{-# OPTIONS_GHC -fwarn-unused-imports #-}

import Control.Monad(when, unless)
import System.Directory(createDirectoryIfMissing,
                        doesFileExist,doesDirectoryExist,
                        getDirectoryContents,copyFile,removeFile)
import Data.List(intersperse)
import System.FilePath((</>))
import System.Cmd(system)
import System.Exit(ExitCode(..))


import Distribution.PackageDescription (emptyHookedBuildInfo)
import Distribution.Simple
import Distribution.Simple.Setup
import Distribution.Simple.LocalBuildInfo(datadir,buildDir,absoluteInstallDirs)

main :: IO ()
main = defaultMainWithHooks simpleUserHooks{ postInst = instWWW
                                           , postCopy = copyWWW
                                           , preBuild = linkFold
                                           , postClean = removeFoldAndLog
                                           }
--------------------------------------------------------------------------------
-- To test the GF web service and minibar, use "cabal install" (or
-- "runhaskell Setup.hs install") to install the program pgf-http, the
-- example grammars listed below, and the minibar. Then start the server with
-- the command "pgf-http" and open http://localhost:41296/minibar/minibar.html
-- in your web browser (Firefox, Safari, Opera or Chrome).

math_langs = words "Bul Cat Eng Fin Fre Ger Ita Ron Spa Swe"
math_grammars = [("OpenMath.pgf", "math", ".."</>"OpenMath"</>base)]
  where base = "OpenMath{" ++ langs ++ "}.gf"
        langs = (concat . intersperse ",") ("LaTeX":math_langs)

mathbar_src = "mathbar"

--------------------------------------------------------------------------------
instWWW args flags pki lbi = setupWWW args dest pki lbi
  where
    dest = NoCopyDest

copyWWW args flags pki lbi = setupWWW args dest pki lbi
  where
    dest = case copyDest flags of
             NoFlag -> NoCopyDest
             Flag d -> d

linkFold args flags =
    do foldExists <- doesFileExist "Fold.hs"
       if foldExists
         then return emptyHookedBuildInfo
         else do execute "ln -s ../transfer/Fold.hs" 
                 return emptyHookedBuildInfo

removeFoldAndLog args flags pkd lbi =
    do removeFileIfExists "Fold.hs"
       removeFileIfExists "pgf-error.log"
  where removeFileIfExists path =
            do exists <- doesFileExist path
               if exists
                 then removeFile path
                 else return ()

setupWWW args dest pkg lbi =
    do mapM_ (createDirectoryIfMissing True) [grammars_dir,mathbar_dir]
       mapM_ build_pgf math_grammars
       copy_mathbar
       copy_mathjax
       create_root_index
  where
    grammars_dir = www_dir </> "grammars"
    mathbar_dir = www_dir </> "mathbar"
    www_dir = datadir (absoluteInstallDirs pkg lbi dest) </> "www"
    gfo_dir = buildDir lbi </> "gfo"

    build_pgf (pgf,tmp,src) =
      do createDirectoryIfMissing True tmp_dir
         execute cmd
         copyFile pgf (grammars_dir</>pgf)
         removeFile pgf
      where
        tmp_dir = gfo_dir</>tmp
        cmd = "gf -make -s -optimize-pgf --gfo-dir="++tmp_dir++
           -- " --output-dir="++grammars_dir++  -- has no effect?!
              " "++src

    copy_mathbar =
      do files <- getDirectoryContents mathbar_src
         mapM_ copy files
      where
        copy file =
            do isFile <- doesFileExist src 
               when isFile $ copyFile src (mathbar_dir</>file)
          where
            src = mathbar_src</>file
            
    copy_mathjax =
      do exists_MathJax <- doesDirectoryExist (mathbar_dir</>"MathJaX")
         unless exists_MathJax install_mathjax

    install_mathjax =
      do execute $ "curl -o " ++ zip_file ++ " " ++ mirror
         execute $ "unzip " ++ zip_file ++ " -d " ++ mathbar_dir
         removeFile zip_file
      where
         zip_file = mathbar_dir</>"mathjax.zip"
         mirror = "http://netcologne.dl.sourceforge.net/project/mathjax/MathJax/v1.0.1/MathJax-v1.0.1a.zip"

    create_root_index = writeFile (www_dir</>"index.html") index_html

    index_html = "<h1>Math service</h1>"
                 ++"<ul><li><a href=\"mathbar/mathbar.html\">Math bar</a></ul>"
                 ++"<a href=\"http://www.grammaticalframework.org/\">Grammatical Framework</a>"
execute command =
  do putStrLn command
     e <- system command
     case e of
       ExitSuccess -> return ()
       _ -> fail "Command failed"
     return ()

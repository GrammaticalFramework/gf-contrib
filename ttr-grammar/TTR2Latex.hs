{-# LANGUAGE GADTs #-}
module TTR2Latex where

-- translating TTR to Latex. AR 25/2/2016

import AbsTTR

import Data.List

printLatex :: Text -> String
printLatex tree = unlines [
  "\\documentstyle{article}",
  "\\begin{document}",
  transText tree,
  "\\end{document}"
  ]
  
type Result = String
failure x = "not yet implemented: " ++ show x

ltapps f xs = "\\" ++ f ++ concat ["{" ++ x ++ "}" | x <- xs]
ltapp  f x = ltapps f [x]
ltcons f = ltapps f []

braces x = "{" ++ x ++ "}"
displayMath s = unlines ["\\vspace{4mm}","\\noindent", "$" ++ s ++ "$"]
---displayMath s = unlines ["\\[",s,"\\]"]

mbox = ltapp "mbox" . ltapp "textit"

transId :: Id -> Result
transId x = case x of
  Id str -> case break (== '_') str of
    ([c],[])-> str
    ([c],_:cs)-> [c] ++ "_" ++ braces (transId (Id cs))
    (cc,[]) -> ltapp "mbox" (ltapp "textit" cc)
    (cc,_:cs) -> ltapp "mbox" (ltapp "textit" cc) ++ "_" ++ braces (mbox cs)

transText :: Text -> Result
transText x = case x of
  TJments jments  -> unlines $ map (displayMath . transJment) jments

transJment :: Jment -> Result
transJment x = case x of
  JIn exp1 exp2  -> transExp exp1 ++ "\\;:\\;" ++ transExp exp2
  JEq exp1 exp2  -> transExp exp1 ++ "\\;=\\;" ++ transExp exp2
  JEqIn exp1 exp2 exp3 -> transExp exp1 ++ "\\;=\\;" ++ transExp exp2 ++ "\\;:\\;" ++ transExp exp3
  JSub exp1 exp2  -> failure x
  JSubIn exp1 exp2 exp3  -> failure x

---- TODO: precedences
transExp :: Exp -> Result
transExp x = case x of
  EId id  -> transId id
  EStr str  -> mbox (show str)
  EInt n  -> show n
  EFloat d  -> show d
  ERecTyp  -> mbox "RecType"
  ERecord fields  -> "\\left["  ++ ltapps "begin" ["array","lcl"] ++ unwords (intersperse "\\\\" (map transField fields)) ++ ltapp "end" "array" ++ "\\right]"
  ESetTy exp  -> "\\{" ++ transExp exp ++ "\\}"
  EListTy exp  -> "[" ++ transExp exp ++ "]"
  ELamApp lambdas exp exps  -> "\\langle " ++ unwords (map transLambda lambdas) ++ "." ++ transExp exp ++ "," ++ "\\langle " ++ transExps exps ++ "\\rangle\\rangle"
  EProj exp id  -> transExp exp ++ "." ++ transId id
  EApps exp exps  -> transExp exp ++ "(" ++ transExps exps ++ ")"
  ECompl exp  -> "\\neg" ++ transExp exp
  EJoin exp1 id2 exp3  -> "\\bigvee_{" ++ transId id2 ++ "\\sqsubseteq " ++ transExp exp1 ++ "}(" ++ transExp exp1 ++ "\\;\\rightarrow\\;" ++ transExp exp3 ++ ")"
  EUnion exp1 exp2  -> transExp exp1 ++ "\\cup " ++ transExp exp2
  EInters exp1 exp2  -> transExp exp1 ++ "\\cap " ++ transExp exp2
  EMerge exp1 exp2  -> transExp exp1 ++ "\\cap. " ++ transExp exp2 ----
  EConcat exp1 exp2  -> transExp exp1 ++ "\\frown " ++ transExp exp2
  ELambs lambdas exp  -> unwords (map transLambda lambdas) ++ "." ++ transExp exp
  EProd id exp1 exp2  -> "(" ++ transId id ++ ":" ++ transExp exp1 ++ ")" ++ "\\;\\rightarrow\\;" ++ transExp exp2
  EFun exp1 exp2  -> transExp exp1 ++ "\\;\\rightarrow\\;" ++ transExp exp2
  ECFun exp1 exp2  -> transExp exp1 ++ "\\;\\rightarrow_{c}\\;" ++ transExp exp2
  EMul exp1 exp2 -> transExp exp1 ++ "*" ++ transExp exp2
  EDiv exp1 exp2 -> transExp exp1 ++ "/" ++ transExp exp2
  EAdd exp1 exp2 -> transExp exp1 ++ "+" ++ transExp exp2
  ESub exp1 exp2 -> transExp exp1 ++ "-" ++ transExp exp2
  ECat exp1 exp2 -> transExp exp1 ++ "+\\!\\!+" ++ transExp exp2

transExps = unwords . intersperse "," . map transExp

transField :: Field -> Result
transField x = case x of
  FIn id exp  -> transId id ++ " & " ++ "\\;:\\;" ++ " & " ++ transExp exp
  FEq id exp  -> transId id ++ " & " ++ "\\;=\\;" ++ " & " ++ transExp exp
  FEqIn id exp1 exp2  -> transId id  ++ " & " ++  "\\;=\\;"  ++ " & " ++ transExp exp1 ++ "\\;:\\;" ++ transExp exp2

transLambda :: Lambda -> Result
transLambda x = case x of
  LAbs id exp  -> ltcons "lambda" ++ " " ++ transId id ++ ":" ++ transExp exp ++ "\\;"


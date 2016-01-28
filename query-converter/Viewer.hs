module Viewer where

-- for viewing E-R designs and relational algebra files

-- select your OS
os = "mac"
-- os = "linux"

pngviewer os = case os of
  "mac" -> "open"
  "linux" -> "eog"

pdfviewer os = case os of
  "mac" -> "open"
  "linux" -> "evince"

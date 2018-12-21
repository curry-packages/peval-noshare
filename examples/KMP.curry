-- Benchmark for the partial evaluator:
-- Knuth/Morris/Pratt pattern matcher

import Profile

data Letter = A | B

match :: [Letter] -> [Letter] -> Bool
match p s = loop p s p s

loop :: [Letter] -> [Letter] -> [Letter] -> [Letter] -> Bool
loop []     _      _  _  = True
loop (_:_)  []     _  _  = False
loop (p:ps) (s:ss) op os = ite (eq p s) (loop ps ss op os) (next op os)

next :: [Letter] -> [Letter] -> Bool
next _  [] = False
next op (_:ss) = loop op ss op ss

ite :: Bool -> a -> a -> a
ite True  x _ = x
ite False _ y = y

eq :: Letter -> Letter -> Bool
eq A A = True
eq B B = True
eq A B = False
eq B A = False

goal :: [Letter] -> Bool
goal s = PEVAL (match [A,A,B] s)

benchmark :: IO ()
benchmark = do
  let l free
  doSolve (l =:= take 500000 (repeat A) ++ [B])
  profileTimeNF (goal l)

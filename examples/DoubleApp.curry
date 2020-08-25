import Debug.Profile

(++) :: [t] -> [t] -> [t]
[]     ++ x  = x
(x:xs) ++ ys = x : (xs ++ ys)

goal x y z = PEVAL ((x ++ y) ++ z)

benchmark = do
  let l free
  doSolve (l =:= [1 .. 500000])
  profileTimeNF (goal l [] [])

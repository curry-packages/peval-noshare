import Profile

map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs

square :: Int -> Int
square x = x * x

goal :: [Int] -> [Int]
goal x = PEVAL (map square x)

main :: [Int]
main = goal [1..10]

benchmark :: IO ()
benchmark = do
  let l free
  doSolve (l =:= [1 .. 500000])
  profileTimeNF (goal l)

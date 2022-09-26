maximum' [] = error "empty!!"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate (n - 1) x

take' :: Int -> [a] -> [a]
take' n xs
  | n <= 0 = []
take' n [] = []
take' n (x:xs) = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' n (x:xs)
  | n == x = True
  | otherwise = elem' n xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  quicksort small ++ [x] ++ quicksort large
  where
    small = [e | e <- xs, e < x]
    large = [e | e <- xs, e >= x]

applyTwice f x = f (f x)

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs

largestDivisible = head (filter p [100000, 99999..])
  where p x = x `mod` 3829 == 0

collatz :: Integer -> [Integer]
collatz 1 = [1]
collatz x
  | even x = x : collatz (x `div` 2)
  | odd x = x : collatz (x * 3 + 1)

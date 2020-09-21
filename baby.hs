double :: (Num a) => a -> a
double x = x + x
doubleTwo :: (Num a) => a -> a -> a
doubleTwo x y = double x + double y
doubleSmallNumber x = if x > 100 then x else double x
doubleSmallNumber' x = (if x > 100 then x else double x) + 1
conanO'Brien = "It's a-me, Conan O'Brien!"
boomBang xs = [if x < 10 then "Boom!" else "Bang!" | x <- xs, odd x]
length' xs = sum [1 | _ <- xs]
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]
rightTriangles = [(a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a + b + c == 24]
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
-- factorial :: Int -> Int
-- factorial n = product [1..n]
factorial' :: Integer -> Integer
factorial' n = product [1..n]
circumference :: Float -> Float
circumference r = 2 * pi * r
circumference' :: Double -> Double
circumference' r = 2 * pi * r
lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"
sayMe :: Int -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
-- addVectors a b = (fst a + fst b, snd a + snd b)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
first :: (a, b, c) -> a
first (x, _, _) = x
second :: (a, b, c) -> b
second (_, y, _) = y
third :: (a, b, c) -> c
third (_, _, z) = z
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y
badAdd :: (Num a) => [a] -> a
badAdd (x:y:z:[]) = x + y + z
firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ show x
-- bmiTell :: Double -> String
-- bmiTell bmi
--   | bmi <= 18.5 = "You're underweight, you emo, you!"
--   | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
--   | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
--   | otherwise = "You're a whale, congratulations!"
-- bmiTellByWeightAndHeight :: Double -> Double -> String
-- bmiTellByWeightAndHeight weight height = bmiTell (weight / height ^ 2)
max' :: (Ord a) => a -> a -> a
max' a b
  | a <= b = b
  | otherwise = a
compare' :: (Ord a) => a -> a -> Ordering
a `compare'` b
  | a < b = LT
  | a > b = GT
  | otherwise = EQ
bmiTell :: Double -> Double -> String
bmiTell weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
        -- skinny = 18.5
        -- normal = 25.0
        -- fat = 30.0 -- インデントは揃える
        (skinny, normal, fat) = (18.5, 25.0, 30.0)

double x = x + x
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

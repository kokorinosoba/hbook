double x = x + x
doubleTwo x y = double x + double y
doubleSmallNumber x = if x > 100 then x else double x
doubleSmallNumber' x = (if x > 100 then x else double x) + 1
conanO'Brien = "It's a-me, Conan O'Brien!"
boomBang xs = [if x < 10 then "Boom!" else "Bang!" | x <- xs, odd x]
length' xs = sum [1 | _ <- xs]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

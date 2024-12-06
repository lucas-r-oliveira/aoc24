{-
 - historians split between two groups
 - each creates a list of Location IDs
 - input: The two lists side-by-side
 - goal: reconcile the lists
 - tip: "maybe the lists are only off by a small amount"
 - the actual goal: calculate the distance between the subsequent
     - smallest numbers of each list
     - and calculate the total distance between the two lists
 -}

 -- steps
 --     read file input
 --     how am I even going to organize it into a proper data structure?
 --     sort both lists
 --     subtract the differences and store them somewhere
 --     reduce distances into a single value
 

-- about haskell
-- - doesn't even feature variables
-- - everything is done using functions and arguments
-- - functions are more similar to mathematical functions
-- rather that a list of instructions
-- - currying: providing less arguments than a function asks for
-- essentially allows us to leave out some of the args in a function
-- for later. This works well in Haskell, because it's a lazily 
-- evaluated language

-- . = function composition (like in math)
--      f(g x) = (f . g) x
--
-- $ operator = A line with one $ essentially says "get the result of everything to the right and apply it as one final argument".
-- https://mmhaskell.com/blog/2021/7/5/function-application-using-the-dollar-sign-


import Data.List

main :: IO ()
main = do

    contents <- readFile "input.txt"
    let linesList = lines contents

    -- TODO: I couldn't figure out how to combine abs with (-) from zipWith 
    -- e.g.: ... zipWith abs . (-) was throwing an error
    let sortedLists = map sort $ map (map (strToInt)) $ transpose $ map words linesList
    print $ foldl (+) 0 $ map abs $ zipWith (-) (head sortedLists) (last sortedLists)

strToInt :: String -> Int
strToInt = read

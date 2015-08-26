import Data.List
import System.IO

-- Comments
-- Single line comment.
{-
Multiline comment.
-}

-- Types
-- Int ranges from -2^63 to 2^26.
maxInt = maxBound :: Int
minInt = minBound :: Int
-- Integer is unbounded.
-- Float, Double
bigFloat = 3.99999999999 + 0.000000000005
bigFloatOverFlow = 3.999999999999 + 0.000000000005
-- Bool can be True and False.
-- Char is Unicode and bounded by `'` characters.
-- Tuple often have 2 values.

-- Math functions
always5 :: Int
always5 = 5
sumOfNums = sum [1..1000]
mathOperations = 5 + 4 - 3 * 2 / 2
moduloExample = mod 5 4
-- https://wiki.haskell.org/Infix_operator
moduloExampleInfix = 5 `mod` 4
-- Some operations need braces.
numEx = 5 + (-4)
-- Square root
num9 = 9 :: Int
sqrtOf9 = sqrt (fromIntegral num9)
-- More functions: pi, exp 9, log 9, 9**2, truncate 9.999, round 9.999, ceiling 9.999, floor 9.999

-- Boolean operations
trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)

-- Lists
primeNumbers = [3,5,7,11]
morePrimes = primeNumbers ++ [13,17,19,23,29]
-- List declaration
favNums = 2 : 7 : 21 : 66 :[]
multList = [[3,5,7],[11,13,17]]
-- List access
morePrimes2 = 2: morePrimes
lenPrime = length morePrimes2
revPrime = reverse morePrimes2
isListEmpty = null morePrimes2
-- Get index 1.
secondPrime = morePrimes2 !! 1
firstPrime = head morePrimes2
lastPrime = last morePrimes2
-- Get everything except last.
primeInit = init morePrimes2
-- Get first three values.
first3Primes = take 3 morePrimes2
-- Get everything except first 3.
removedPrimes = drop 3 morePrimes2
is7InList = 7 `elem` morePrimes2
maxPrime = maximum morePrimes2
minPrime = minimum morePrimes2
newList = [2,3,5]
productPrimes = product newList
-- Generating lists
zeroToTen = [0..10]
evenList = [2,4..20]
letterList = ['A', 'C'..'Z']
-- Lists can be infinite and are read lazy.
infinPow10 = [10,20..]
many2s = take 10 (repeat 2)
many3s = replicate 10 3
cycleList = take 10 (cycle [1,2,3,4,5])
listTimes2 = [x * 2 | x <- [1..10]]
-- List filters
listTimes3 = [x * 3 | x <- [1..10], x * 3 <= 50]
divisBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]
sortedList = sort [9,1,3,8,4]
sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]
listBiggerThen5 = filter (>5) morePrimes
-- While loop
evensUpTo20 = takeWhile (<= 20) [2,4..]
-- Go through list from left to right (foldl, foldr) and multiply.
multOfList = foldl (*) 1 [2,3,4,5]
pow3List = [3^n | n <- [1..10]]
multTable = [[x * y | y <- [1..10]] | x <- [1..10]]

-- Tuples
randTuple = (1, "Random Tuple")
bobSmith = ("Bob Smith", 52)
-- First tuple element
bobsName = fst bobSmith
-- Second tuple element
bobsAge = snd bobSmith
names = ["Bob", "Mary", "Tom"]
addresses = ["123 Main", "234 North", "567 South"]
namesNAddresses =  zip names addresses

-- Functions
-- Main function
main = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn ("Hello " ++ name)
-- Function with type declaration.
addMe :: Int -> Int -> Int
-- Functionn body: funcName param1 param2 = operations (returned value)
addMe x y = x + y
-- Function body without type declaration.
sumMe x y = x + y
addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x, y) (x2, y2) = (x + x2, y + y2)
whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You're an adult"
whatAge x = "Nothing Important"
-- Alternatively put _ instead of x.
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
productFact n = product [1..n]
-- Alternative function syntax using guards. Guards are pipes `|`.
isOdd :: Int -> Bool
isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True
isEven n = n `mod` 2 == 0
whatGrade :: Int -> String
whatGrade age
    | (age >= 5) && (age <= 6) = "Kindergarden"
    | (age > 6) && (age <= 10) = "Elementary School"
    | (age > 10) && (age <= 14) = "Middle School"
    | (age > 14) && (age <= 18) = "High School"
    | otherwise = "Go to college"
batAvgRating :: Double -> Double -> String
batAvgRating hits atBats
    | avg <= 0.200 = "Terrible Batting Average"
    | avg <= 0.250 = "Average Player"
    | avg <= 0.280 = "Your doing pretty good"
    | otherwise = "You're a Superstar"
    where avg = hits / atBats
-- List access
getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
-- Convert to String using `show`.
getListItems (x:[]) = "Your list starts with " ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The 1st item is " ++ show x ++ " and the rest are " ++ show xs
-- The rest of an amount is `xs`.
getFirstItem :: String -> String
getFirstITem [] = "Empty String"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ [x]

-- Higher order functions. Functions that take functions as arguments.
times4 :: Int -> Int
times4 x = x * 4
-- Use a function on all list elements using `map`.
listTimes4 = map times4 [1,2,3,4]
multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs
areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
-- The statement after && covers all other elements.
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False
-- Pass functions
doMult :: (Int -> Int) -> Int
doMult func = func 3
num3Times4 = doMult times4
-- Return a function
getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y
adds3 = getAddFunc 3
fourPlus3 = adds3 4
threePlusList = map adds3 [1,2,3,4,5]

-- Functions without names are Lambdas
dbl1To10 = map (\x -> x * 2)[1..10]
-- Comparison operators: < > <= >= == /=
-- Logical operators: && || not

-- If statement
doubleEvenNumber y =
    if (y `mod` 2 /= 0)
        then y
        else y * 2

-- Case statement
getClass :: Int -> String
getClass n = case n of
    5 -> "Go to Kindergarden"
    6 -> "Go to elementary school"
    _ -> "Go away"

-- Modules
-- Modules contain functions.
--module SampFunctions (getClass, doubleEvenNumbers) where
-- Import all functions from another module
--import SampleFunctions

-- Enumerations
data BaseballPlayer = Pitcher
    | Catcher
    | Infielder
    | Outfield
    -- To print them as string, use `deriving`.
    deriving Show
barryBonds :: BaseballPlayer -> Bool
barryBonds Outfield = True
-- Is barryBonds an Outfield player?
barryInOF = print(barryBonds Outfield)
-- Custom types are similar to structs.
data Customer = Customer String String Double
    deriving Show
tomSmith :: Customer
tomSmith = Customer "Tom Smith" "123 Main" 20.50
getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b
-- Rock paper scissors
data RPS = Rock | Paper | Scissors
shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper beats Rock"
-- This function is incomplete.
shoot _ _ = "Error"
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
    deriving Show
area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x y x2 y2) = (abs (x2 - x)) * (abs (y2 - y))
-- The `$` can be used alternatively to `()`.
--area (Rectangle x y x2 y2) = (abs $ x2 - x) * (abs $ y2 - y)
-- The dot operator can be used for value chaining.
sumValue = putStrLn (show (1 + 2))
sumValue2 = putStrLn . show $ 1 + 2
areaOfCircle = area (Circle 50 60 20)
areaOfRect = area $ Rectangle 10 10 100 100

-- Type classes
-- They can be shown using `show` and checked for equality.
data Employee = Employee {name :: String,
    position :: String,
    idNum :: Int} deriving (Eq, Show)
samSmith2 = Employee {name = "Sam Smith", position = "Manager", idNum = 1}
pamMarx = Employee {name = "Pam Marx", position = "Sales", idNum = 2}
isSamPam = samSmith2 == pamMarx
samSmithData = show samSmith2
data ShirtSize = S | M | L
instance Eq ShirtSize where
    S == S = True
    M == M = True
    L == L = True
    _ == _ = False
instance Show ShirtSize where
    show S = "Small"
    show M = "Medium"
    show L = "Large"
smallAvail = S `elem` [S, M, L]
theSize = show S
-- Custom type class that checks for equality.
class MyEq a where
    areEqual :: a -> a -> Bool
instance MyEq ShirtSize where
    areEqual S S = True
    areEqual M M = True
    areEqual L L = True
    areEqual _ _ = False
newSize = areEqual M M

-- IO
sayHello = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn $ "Hello " ++ name
writeToFile = do
    theFile <- openFile "test.txt" WriteMode
    hPutStrLn theFile ("Random line of text")
    hClose theFile
readFromFile = do
    theFile2 <- openFile "test.txt" ReadMode
    contents <- hGetContents theFile2
    putStr contents
    hClose theFile2

-- Fibonacci sequence
-- The cons operator is `:`. It expands a list.
fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]
-- 1, 1, 2, 3, 5, 8 ...
fib300 = fib !! 300
first20Fibs = take 20 fib

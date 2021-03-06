---------------------------------------
--------- BANNED KEYWORDS -------------
---------------------------------------
-- case class data default deriving  --
-- do  else  foreign  if  import  in --
-- infix infixl infixr instance  let --
-- module newtype of then type where --
---------------------------------------
-- NO TABS (could mess with compiler) -

----------------------
-- RANDOM FUNCTIONS --
----------------------

-- | Hello world function
helloWorld = putStrLn "Hello, World!" -- function definition

-- | add function adds two integers.
add :: (Integer, Integer) -> Integer -- function declaration
add (a, b) = a + b -- function definition

-- | calcSum function sums a list of numbers.
calcSum :: Num a => [a] -> a -- function declaration
calcSum a
  | null a = 0 -- if list is empty return 0
  | otherwise = head a + calcSum (tail a) -- recursively sum

-- | quicksort function sorts a list using quicksort
qsort [] = [] -- if list is empty, return empty list
qsort (x : xs) = qsort smaller ++ [x] ++ qsort larger -- for each x in xs pivot each side and combine result
  where
    smaller = [a | a <- xs, a <= x] -- pivot smaller
    larger = [b | b <- xs, b > x] -- pivot larger

-- | action sequencer function sequences actions and returns a list of outputs
seqn [] = return []
seqn (act : acts) = do
  -- for each action in the action list
  x <- act -- execute action and return result into list position
  xs <- seqn acts -- send the rest of the actions to be sequenced and executed
  return (x : xs) -- return the list of outputs

-- | && operator explicitly defined using pattern matching
(&&) :: Bool -> Bool -> Bool
{-
True && False = False
False && True = False
False && False = False
-}
_ && _ = False -- since anything other than True True will output False (wildcard underscores)

-- | testFront function checks if the begining element of a list is an 'a'
testFront :: [Char] -> Bool
testFront ('a' : _) = True -- wildcard underscore signifies we don't care about the other list values



-----------------------
-- PRELUDE FUNCTIONS --
-----------------------

-- | head function
chead :: [a] -> a
chead (x : _) = x

-- | function that acts as a description wrapper
printExample (code, act) = do
  putStr "Code: "
  putStrLn code
  putStr "Output: "
  print act

-- | function that runs through various prelude library functions
preludeExamples = do
  putStrLn "________________"
  putStrLn "PRELUDE EXAMPLES"
  putStrLn "________________"
  let list = [1, 2, 3, 4, 5]
  putStr "let list = "
  print list
  printExample ("head list", head list) -- selects first element of list : 1
  printExample ("tail list", tail list) -- selects last elements of list : [2, 3, 4, 5]
  printExample ("list !! 2", list !! 2) -- selects n'th element from list : 3
  printExample ("take 3 list", take 3 list) -- selects first n elements from list : [1, 2, 3]
  printExample ("drop 3 list", drop 3 list) -- removes first n elements from list : [4, 5]
  printExample ("length list", length list) -- gets length of the list : 5
  printExample ("sum list", sum list) -- calculates the sum of the list
  printExample ("product list", product list) -- calculates product of list
  printExample ("list ++ [6, 7, 8]", list ++ [6, 7, 8]) -- appends two lists
  printExample ("reverse list", reverse list) -- reverses the list
  printExample ("zip list [6,7,8,9,10]", zip list [6,7,8,9,10])

------------------------
-- LAMBDA EXPRESSIONS --
------------------------

lambdaExamples = do
  putStrLn "---------------"
  putStrLn "LAMBDA EXAMPLES"
  putStrLn "---------------"
  printExample ("(\\x -> x ** 2) 2", (\x -> x ** 2) 2) -- Raises to power of 2
  printExample ("(\\x -> x `mod` 2 == 0) 2", (\x -> x `mod` 2 == 0) 2) -- Checks if number is even
  printExample ("(\\x y -> x + y) 2 3", (\x y -> x + y) 2 3) -- Add two numbers together
  -- or
  printExample ("(\\x -> (\\y -> x + y) 3) 2", (\x -> (\y -> x + y) 3) 2) -- Add two numbers together (alternative)

-- | function that returns first n odd integers
odds :: Int -> [Int]
odds n = map (\x -> x * 2 + 1) [0 .. n -1] -- map applies a function to all elements of a list

---------------
-- OPERATORS --
---------------

operatorExamples = do
  putStrLn "-----------------"
  putStrLn "OPERATOR EXAMPLES"
  putStrLn "-----------------"
  printExample ("7 / 2: ", 7 / 2) -- using division symbol
  -- or
  printExample ("7 'div' 2: ", 7 `div` 2) -- using `div`
  printExample ("1 + 2: ", 1 + 2)
  -- or
  printExample ("(+) 1 2: ", (+) 1 2)
  -- or
  printExample ("(1+) 2: ", (1 +) 2)
  -- or
  printExample ("(+2) 1: ", (+ 2) 1)

-- | Simple operator functions
-- The @ signifies a codeblock to the documentation generator Haddock
-- @
-- (+) :: Int -> Int -> Int
-- (+) = \x -> (\y -> x + y) -- addition
-- (1+) = \y -> 1+y          -- successor
-- (1/) = \y -> 1/y          -- reciprocation
-- (*2) = \x -> x*2          -- doubling
-- (/2) = \x -> x/2          -- halving
-- @

-------------------------
-- LIST COMPREHENSIONS --
-------------------------

listCompExamples = do
  putStrLn "---------------------------"
  putStrLn "LIST COMPREHENSION EXAMPLES"
  putStrLn "---------------------------"
  printExample ("[1, 2, 3]", [1, 2, 3])
  printExample ("1 : (2 : (3 : []))", 1 : (2 : (3 : [])))
  printExample ("1 : 2 : 3 : []", 1 : 2 : 3 : [])
  printExample ("[x^2 | x <- [1..5]]", [x ^ 2 | x <- [1 .. 5]])
  printExample ("[(x,y) | x <- [1,2,3], y <- [4,5]]", [(x, y) | x <- [1, 2, 3], y <- [4, 5]])
  printExample ("[x | x <- [1..10], even x]", [x | x <- [1 .. 10], even x])
  printExample ("[x | x <- [14, 24,-10, 15,-42,31,3,1], x < 15]", [x | x <- [14, 24, -10, 15, -42, 31, 3, 1], x < 15])

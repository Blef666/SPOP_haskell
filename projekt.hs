import Data.List.Split
import System.Environment

data Puzzle = Puzzle [[Int]] [[Int]] deriving Show

rInt :: String -> [[Int]]
rInt a = read a

getVertical :: Puzzle -> [[Int]]
getVertical (Puzzle t _) = t

getHorizontal :: Puzzle -> [[Int]]
getHorizontal (Puzzle _ t) = t

--readPuzzle = map read (splitOn "\n" (readFile "examples/5x5_psi.txt"))
--readPuzzle = splitOn "\n" (file)
--			where
--				file <- readFile "examples/5x5_psi.txt"


-- przyklad odpalenia programu:
-- :main "examples/5x5_psi.txt"
main = do 
			args <- getArgs
			contents <- readFile (args !! 0)
			let dict = map rInt (lines contents)
			let x = (Puzzle (dict !! 0) (dict !! 1))
			print (getVertical x)
			print (getHorizontal x)
			print (args)
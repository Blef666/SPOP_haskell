import Data.List.Split
import System.Environment

-- Puzzle (Columns) (Rows)
data Puzzle = Puzzle [[Int]] [[Int]] deriving Show

{- Picture to główna struktura reprezentująca obrazek
"x" - nic nie jest postawione
" " - nie można postawić w tym miejscu
"*" - jest postawiony znak
-}
type Picture = [[Char]]

rInt :: String -> [[Int]]
rInt a = read a

getVertical :: Puzzle -> [[Int]]
getVertical (Puzzle t _) = t

getHorizontal :: Puzzle -> [[Int]]
getHorizontal (Puzzle _ t) = t

verticalLength (Puzzle t _) = length t
horizontalLength (Puzzle _ t) = length t

initPicture :: Int -> Int -> Picture
initPicture 0 _ = []
initPicture n m = (initRow m) : (initPicture (n - 1) m)
			where
				initRow 0 = []
				initRow m = 'x' : (initRow (m - 1))
				
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

-- s = solvePuzzle 
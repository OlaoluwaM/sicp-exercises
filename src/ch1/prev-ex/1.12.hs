module Ex where

type RowNumber = Integer
type Triangle = [[Integer]]

pascalTriangle :: RowNumber -> Triangle
pascalTriangle 0 = [[]]
pascalTriangle 1 = [[1]]
pascalTriangle 2 = [[1], [1, 1]]
pascalTriangle rowNum = let lastRow = pascalTriangle (rowNum - 1) in lastRow ++ [1 : pairWiseSum (last lastRow) ++ [1]]

pairWiseSum :: [Integer] -> [Integer]
pairWiseSum [] = []
pairWiseSum [x] = []
pairWiseSum (x : rest@(x' : xs)) = x + x' : pairWiseSum rest

-- TODO Find a way to print out a triangle from the output of pascalTriangle

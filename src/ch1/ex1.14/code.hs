-- https://play.haskell.org/saved/Vt29Etcx
-- Port over the first-denomination function from the scheme version too

type Amount = Integer
type Denominations = [Integer]

countingChange :: Amount -> Denominations -> Integer
countingChange 0 _ = 1
countingChange _ [] = 0
countingChange amt denominations@(d : ds)
  | amt < 0 = 0
  | denominations == [1] = 1
  | otherwise = countingChange amt ds + countingChange (amt - d) denominations

main :: IO ()
main = do
  let ans = countingChange 11 [50, 25, 10, 5, 1]
  print ans

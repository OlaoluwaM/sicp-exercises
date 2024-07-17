module Analysis where

avg :: (Fractional a) => [a] -> a
avg xs = let len = (fromIntegral . length) xs in sum xs / len

getRelativeError :: Double -> Double -> Double
getRelativeError expectedVal actualVal =
    let diff = abs (actualVal - expectedVal) in (diff / expectedVal) * 100

getActual :: [Integer] -> Double
getActual = avg . map fromIntegral

getNextExpected :: [Integer] -> Double
getNextExpected xs = let offset = sqrt 10 in getActual xs * offset

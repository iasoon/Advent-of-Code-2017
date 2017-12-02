import Data.String


rotateList : List a -> List a
rotateList [] = []
rotateList (x::xs) = xs ++ [x]

-- ignore non-numeric characters
readNumbers : String -> List Int
readNumbers = mapMaybe (parseInteger . singleton) . unpack

calcResult : List Int -> Int
calcResult xs = sum $ map pairValue $ List.zip xs (rotateList xs) where
    pairValue : (Int, Int) -> Int
    pairValue (a, b) = if a == b then a else 0


solveCaptcha : String -> Int
solveCaptcha = calcResult . readNumbers


main : IO ()
main = do
    input <- readFile "input.txt"
    case input of
        Left err => printLn err
        Right str => printLn $ solveCaptcha str
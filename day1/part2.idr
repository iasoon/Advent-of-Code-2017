import Data.String

rotateList : Nat -> List a -> List a
rotateList n xs = (drop n xs) ++ (take n xs)

-- ignore non-numeric characters
readNumbers : String -> List Nat
readNumbers = mapMaybe (parsePositive . singleton) . unpack

calcResult : List Nat -> Nat
calcResult xs = sum $ map pairValue $ zip xs pairing where
    pairing : List Nat
    pairing = rotateList (div (length xs) 2) xs
    pairValue : (Nat, Nat) -> Nat
    pairValue (a, b) = if a == b then a else 0


solveCaptcha : String -> Nat
solveCaptcha str = calcResult $ readNumbers str


main : IO ()
main = do
    input <- readFile "input.txt"
    case input of
        Left err => printLn err
        Right str => printLn $ solveCaptcha str
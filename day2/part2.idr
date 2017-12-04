import Data.String

-- parse string into a row-major grid
grid : String -> List (List Nat)
grid str = map (fromMaybe 0 . parsePositive) . words <$> lines str

rowChecksum : List Nat -> Nat
rowChecksum [] = 0
rowChecksum (x::xs) =
    case find (divides x) xs of
        Just y => div (max x y) (min x y)
        Nothing => rowChecksum xs
    where
        divides : Nat -> Nat -> Bool
        divides a b = (mod (max a b) (min a b) == 0)
    

calcChecksum : String -> Nat
calcChecksum str = sum . map rowChecksum $ grid str


main : IO ()
main = do
    input <- readFile "input.txt"
    case input of
        Left err => printLn err
        Right str => printLn $ calcChecksum str
import Data.String

-- parse string into a row-major grid
grid : String -> List (List Nat)
grid str = map (fromMaybe 0 . parsePositive) . words <$> lines str

listMin : (l: List Nat) -> {auto ok: NonEmpty l} -> Nat
listMin [] {ok = IsNonEmpty} impossible
listMin (x::xs) {ok = p} = foldl min x xs

listMax : (l: List Nat) -> {auto ok: NonEmpty l} -> Nat
listMax [] {ok = IsNonEmpty} impossible
listMax (x::xs) {ok = p} = foldl max x xs


-- TODO: it should be possible to actually prove this, but my powers are not
-- strong enough yet.
listMinLTElistMax : (l: List Nat) -> {p: NonEmpty l}
    -> LTE (listMin l {ok = p}) (listMax l {ok = p})
listMinLTElistMax xs = really_believe_me $ LTE (listMin xs) (listMax xs)

rowChecksum' : (l: List Nat) -> {auto ok: NonEmpty l} -> Nat
rowChecksum' [] {ok = IsNonEmpty} impossible
rowChecksum' xs {ok = p} = (-) (listMax xs) (listMin xs)
                               {smaller = listMinLTElistMax xs}

rowChecksum : List Nat -> Nat
rowChecksum [] = 0
rowChecksum (x::xs) = rowChecksum' (x::xs)

calcChecksum : String -> Nat
calcChecksum str = sum . map rowChecksum $ grid str


main : IO ()
main = do
    input <- readFile "input.txt"
    case input of
        Left err => printLn err
        Right str => printLn $ calcChecksum str
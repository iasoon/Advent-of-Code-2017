validPassphrase : String -> Bool
validPassphrase str = let passwords = words str in
    length passwords == length (nub passwords)
            
numPassphrases : String -> Nat
numPassphrases str = length $ filter validPassphrase $ lines str

main : IO ()
main = do
    input <- readFile "input.txt"
    case input of
        Left err => printLn err
        Right str => printLn $ numPassphrases str
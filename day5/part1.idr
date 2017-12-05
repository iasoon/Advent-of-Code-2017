import Data.String

data Zipper a = MkZipper (List a) a (List a)

read : Zipper a -> a
read (MkZipper _ pos _) = pos

map : (a -> a) -> Zipper a -> Zipper a
map f (MkZipper ls pos rs) = MkZipper ls (f pos) rs

left : Zipper a -> Maybe (Zipper a)
left (MkZipper []        pos rs) = Nothing
left (MkZipper (l :: ls) pos rs) = Just $ MkZipper ls l (pos::rs)

right : Zipper a -> Maybe (Zipper a)
right (MkZipper ls pos []       ) = Nothing
right (MkZipper ls pos (r :: rs)) = Just $ MkZipper (pos::ls) r rs

move : Int -> Zipper a -> Maybe (Zipper a)
move x z = case compare x 0 of
                LT => maybe_bind (left z) (move (x + 1))
                EQ => Just z
                GT => maybe_bind (right z) (move (x - 1))

step : Zipper Int -> Maybe (Zipper Int)
step z = let d = read z in
             move d (map (+1) z)

solve : List Int -> Nat
solve [] = 0
solve (x :: xs) = solve_ 1 $ MkZipper [] x xs
    where
        solve_ : Nat -> Zipper Int -> Nat
        solve_ n z = case step z of
            Nothing => n
            Just z_ => solve_ (n+1) z_

main : IO ()
main = do
    Right text <- readFile "input.txt"
        | Left err => printLn err
    numbers <- pure $ mapMaybe parseInteger $ lines text
    printLn $ solve numbers
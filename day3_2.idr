import Data.Vect
import Data.Fin

l : Vect 11 Int
l = [54, 26, 25, 23, 11, 10, 5, 4, 2, 1, 1]

record Generator (bufSize : Nat) where
    constructor MkGenerator
    sidePos : Int
    sideLength : Int
    buffer : Vect bufSize Int
    offset : Fin bufSize

gen : Generator 11
gen = MkGenerator 1 2 l 9

pred : {n: Nat} -> Fin n -> Fin n
pred FZ = FZ
pred (FS k) = weaken k

bounds : {a: Nat} -> {b : Nat} -> LTE a b -> IsJust (integerToFin a (S b))
bounds prf = ?hole



using (bufSize : Nat)
    nextNumber : Generator bufSize -> Int
    nextNumber gen = get 0
                        + get (offset gen)
                        + get (pred $ offset gen)
        where   get : Fin bufSize -> Int
                get n = index n $ buffer gen

            
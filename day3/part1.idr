square : Int -> Int
square num = num * num

truncate : Double -> Int
truncate num = cast {to = Int} $ floor num

ringNum : Int -> Int
ringNum num = 1 + truncate (((sqrt d) - 1) / 2)
    where d = cast {to = Double} num

ringEnd : Int -> Int
ringEnd num = square (2 * num + 1)

dist : Int -> Int
dist num = r + abs (r - (mod ringIdx (2*r)))
    where r : Int
          r = ringNum num
          ringIdx = num - (ringEnd (r - 1))
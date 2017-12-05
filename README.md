# 2017 Advent of Code
Today I learned the Advent of Code is a thing. Of course, now I'm participating! Since this is an ideal excuse to toy around with a new language, I finally got myself to take a look at a language that has been piquing my interest for a long time now - Idris!

I'm a bit excited, so let's get this journey started!

## Day 1
I skimmed the idris tutorial and had a swing at the first challenge. The haskell under my belt really helped getting started, and this was a nice exercise for getting to know the standard library a bit.

## Day 2
Today I had my first run-in with actual dependent types. I defined a maximum (and minimum) function that requires its input list to be non-empty. So far so good, but when I went on to subtract the minimum from the maximum, I had to prove that the maximum is always greater than or equal to the minimum. Shouldn't be too hard, but my Idris powers are lacking a bit. I'm looking forward to being able to actually prove these things.

## Day 3
While the first part of the challenge didn't really require any actual programming (as an exact solution was easily obtained), the second part of the challenge involved indexing lists, which requires proving that the index is in bounds. This quickly turned into a soup, and I was unable to find a proper way to adress this challenge, and gave up after a few hours of resistance. Hopefully this is the last challenge I'll have to fail!

## Day 4
Today's challenge was quite simple, only requiring some list filtering and deduplication. Since these needs are well covered in the Idris standard library, it didn't take too long to finish.

## Day 5
I managed to create a working solution with vectors (yay, progress), but it turned out way too slow. I tried using a zipper instead, which worked out nicely.
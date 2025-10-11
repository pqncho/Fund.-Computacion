{-# LANGUAGE GADTs, EmptyDataDecls, EmptyCase #-}
{-# OPTIONS_GHC -fno-warn-tabs #-}

module Lab1 where

import Prelude(Show)

data Bool where {True::Bool; False::Bool} 
    deriving Show

not:: Bool -> Bool
not = \b -> case b of {True -> False; False -> True}

(||):: Bool -> Bool -> Bool
(||) = \b1 b2 -> case b1 of {True -> True; False -> b2}

(&&):: Bool -> Bool -> Bool
(&&) = \b1 b2 -> case b1 of {True -> b2; False -> False}

xor:: Bool -> Bool -> Bool
xor= \b1 b2 -> case b1 of {True -> not b2; False -> b2}

(>>):: Bool -> Bool -> Bool
(>>) = \b1 b2 -> case b1 of {True -> b2; False -> True}

(==):: Bool -> Bool -> Bool
(==) = \b1 b2 -> case b1 of {True -> b2; False -> not b2}
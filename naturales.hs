{-# LANGUAGE GADTs, EmptyDataDecls, EmptyCase #-}
{-# OPTIONS_GHC -fno-warn-tabs #-}
{-# OPTIONS_GHC -fno-warn-missing-methods #-}

module Naturales where

data N where {O:: N; S:: N -> N}
    deriving Show

uno :: N
uno = S O
dos :: N
dos = S uno
tres :: N
tres = S dos
cuatro :: N
cuatro = S tres
cinco :: N
cinco = S cuatro
predecesor :: N-> N
predecesor = \n-> case n of {O-> O; S x-> x}

instance Eq N where
    (==) = \n1 n2 -> case n1 of{
        O -> case n2 of { 
            O -> True; 
            S m2 -> False;
        };
        
        S m1 -> case n2 of {
            O -> False; 
            S m2 -> m1 == m2;
        };
    }

instance Ord N where
    (<=) = \n1 n2  -> case n1 of{
        O -> case n2 of{
            O -> True;
            S m2 -> True;
        };
        S m1 -> case n2 of{
            O -> False;
            S m2 -> m1 <= m2;
        };
    }

instance Num N where
    (+) = \n1 n2 -> case n1 of{
        O -> case n2 of{
            O -> O;
            S m2 -> S m2;
        };
        S m1 -> case n2 of{
            O -> S m1;
            S m2 -> S(m1 + n2);
        };
    }

    (*) = \n1 n2 -> case n1 of{
        O -> O;
        S m1 -> case n2 of{
            O -> O;
            S m2 -> n2 + (m1 * n2);
        };
    }
    (-) = \n1 n2 -> case n1 of{
        O -> O;
        S m1 -> case n2 of{
            O -> S m1;
            S m2 -> m1 - m2;
        };
    }

{-#LANGUAGE GADTs #-}
{-# OPTIONS_GHC -fno-warn-missing-methods #-}

{-
FUNDAMENTOS DE COMPUTACIÓN
ENTREGABLE: NÚMEROS ENTEROS puedeserpa

Integrantes del equipo:
Nombre 1: Marcos Coszion  Nro Est: 332945
Nombre 2: Francisco Lino  Nro Est: 347691

-}

module Enteros where

import Naturales

data Signo where { Pos :: Signo ; Neg :: Signo }
    deriving Show

data Entero where { E :: Signo -> N -> Entero }
    deriving Show

--------------------------------------------------------------------------------
-- EJERCICIO 1: Instancia de Eq para Signo
--------------------------------------------------------------------------------
instance Eq Signo where
    (==) :: Signo -> Signo -> Bool
    (==) = \n1 n2 -> case n1 of{
        Pos -> case n2 of{
            Pos -> True;
            Neg -> False;
        };
        Neg -> case n2 of{
            Pos -> False;
            Neg -> True;
        };
    }

--------------------------------------------------------------------------------
-- EJERCICIO 2: Instancia de Eq para Entero
-- CUIDADO: E Pos O y E Neg O ambos representan el cero
--------------------------------------------------------------------------------
instance Eq Entero where
    (==) :: Entero -> Entero -> Bool
    (==) =  \n1 n2 -> case n1 of{
        E Pos O -> case n2 of{
            E Pos O -> True;
            E Neg O -> True;
            E Pos (S n) -> False;
            E Neg (S n) -> False;
        };
        E Neg O -> case n2 of{
            E Pos O -> True;
            E Neg O -> True;
            E Pos (S n) -> False;
            E Neg (S n) -> False;
        };
        E Pos (S n) -> case n2 of{
            E Pos O -> False;
            E Neg O -> False;
            E Pos (S m) -> n == m;
            E Neg (S m) -> False; 
        };
        E Neg (S n) -> case n2 of{
            E Pos O -> False;
            E Neg O -> False;
            E Neg (S m) -> n == m;
            E Pos (S m) -> False;
        };
    }

--------------------------------------------------------------------------------
-- EJERCICIO 3: Instancia de Ord para Signo
-- Se pide: Neg < Pos
--------------------------------------------------------------------------------
instance Ord Signo where
    (<=) :: Signo -> Signo -> Bool
    (<=) = \n1 n2 -> case n1 of{
        Pos -> case n2 of{
            Pos -> True;
            Neg -> False;
        };
        Neg -> case n2 of{
            Pos -> True;
            Neg -> True;
        };
    }


--------------------------------------------------------------------------------
-- EJERCICIO 4: Instancia de Ord para Entero
-- Recordar: negativos < cero < positivos
-- Entre negativos: el de mayor magnitud es menor (más alejado de cero)
-- Entre positivos: el de mayor magnitud es mayor
-- CUIDADO: E Pos O y E Neg O ambos representan el cero
--------------------------------------------------------------------------------
instance Ord Entero where
    (<=) :: Entero -> Entero -> Bool
    (<=) = \n1 n2 -> case n1 of{ 
        E Pos O -> case n2 of{
            E Pos O -> True;
            E Neg O -> True;
            E Pos (S n) -> True;
            E Neg (S n) -> False;
        };
        E Neg O -> case n2 of{
            E Pos O -> True;
            E Neg O -> True;
            E Pos (S n) -> True;
            E Neg (S n) -> False;
        };
        E Pos (S n) -> case n2 of{
            E Pos O -> False;
            E Neg O -> False;
            E Pos (S m) -> n <= m;
            E Neg (S m) -> False;
        };
        E Neg (S n) -> case n2 of{
            E Pos O -> True;
            E Neg O -> True;
            E Pos (S m) -> True;
            E Neg (S m) -> m <= n;
        };

    }

--------------------------------------------------------------------------------
-- EJERCICIO 5: Instancia de Num para Entero
-- Definir suma, producto y resta de enteros
-- Recordar las reglas de signos y las diferentes combinaciones
-- Cuando una operación da como resultado cero, se puede devolver E Pos O o E Neg O indistintamente
--------------------------------------------------------------------------------
instance Num Entero where
    (+) :: Entero -> Entero -> Entero
    (+) = \n1 n2 -> case n1 of{
        E Pos O -> case n2 of{
            E Pos O -> E Pos O;
            E Neg O -> E Pos O;
            E Pos (S n) -> E Pos (S n);
            E Neg (S n) -> E Neg (S n);
        };
        E Neg O -> case n2 of{
            E Pos O -> E Pos O;
            E Neg O -> E Pos O;
            E Pos (S n) -> E Pos (S n);
            E Neg (S n) -> E Neg (S n);
        };
        E Pos (S n) -> case n2 of{
            E Pos O -> E Pos (S n);
            E Neg O -> E Pos (S n);
            E Pos (S m) -> E Pos ((S m) + (S n));
            E Neg (S m) -> case (n>m) of{
                True -> 
                False -> 
                
                
                --(S n) <= (S m) && (S n) != (S m) -> E Neg ((S m) - (S n)); 
                --(S m) <= (S n) && (S n) != (S m) -> E Pos ((S n) - (S m));
            };
        };
        E Neg (S n) -> case n2 of{
            E Pos O -> E Neg (S n);  
            E Neg O -> E Neg (S n);
            E Neg (S m) -> E Neg ((S n) + (S m)); 
            E Pos (S m) -> case m of{
                ()
            }
        };

    }
        









    (*) = 
    (-) = 
    



    
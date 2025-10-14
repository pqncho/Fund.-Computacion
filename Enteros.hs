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
    (==) = 

--------------------------------------------------------------------------------
-- EJERCICIO 2: Instancia de Eq para Entero
-- CUIDADO: E Pos O y E Neg O ambos representan el cero
--------------------------------------------------------------------------------
instance Eq Entero where
    (==) =  

--------------------------------------------------------------------------------
-- EJERCICIO 3: Instancia de Ord para Signo
-- Se pide: Neg < Pos
--------------------------------------------------------------------------------
instance Ord Signo where
    (<=) = 

--------------------------------------------------------------------------------
-- EJERCICIO 4: Instancia de Ord para Entero
-- Recordar: negativos < cero < positivos
-- Entre negativos: el de mayor magnitud es menor (más alejado de cero)
-- Entre positivos: el de mayor magnitud es mayor
-- CUIDADO: E Pos O y E Neg O ambos representan el cero
--------------------------------------------------------------------------------
instance Ord Entero where
    (<=) = 

--------------------------------------------------------------------------------
-- EJERCICIO 5: Instancia de Num para Entero
-- Definir suma, producto y resta de enteros
-- Recordar las reglas de signos y las diferentes combinaciones
-- Cuando una operación da como resultado cero, se puede devolver E Pos O o E Neg O indistintamente
--------------------------------------------------------------------------------
instance Num Entero where
    (+) = 
    (*) = 
    (-) = 
    



    
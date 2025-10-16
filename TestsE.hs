-- =============================================
-- Tests para Enteros.hs (Eq, Ord, Num)
-- Uso: para cada instancia hay una lista de  casos
--      y el test correspondiente es un booleano que
--      se llama ok<Clase><Tipo> (por ej. okEqSigno).
-- Si un test no da True, probar caso por caso.
-- =============================================

import Naturales
import Enteros

-- ===========================
-- 1. Eq para Signo
-- ===========================
testsEqSigno :: [Bool]
testsEqSigno =
  [ Pos == Pos
  , Neg == Neg
  , not (Pos == Neg)
  , not (Neg == Pos)
  ]

okEqSigno = and testsEqSigno

-- ===========================
-- 2. Eq para Entero
-- ===========================
testsEqEntero :: [Bool]
testsEqEntero =
  [ E Pos O == E Neg O                 -- cero doble
  , E Pos uno == E Pos uno
  , E Neg uno == E Neg uno
  , not (E Pos uno == E Neg uno)
  , E Pos tres /= E Pos cuatro
  , not (E Neg dos == E Pos dos)
  ]

okEqEntero = and testsEqEntero

-- ===========================
-- 3. Ord para Signo
-- ===========================
testsOrdSigno :: [Bool]
testsOrdSigno =
  [ Neg < Pos
  , Neg <= Pos
  , Pos > Neg
  , Pos >= Pos
  , Neg >= Neg
  , not (Pos < Neg)
  ]

okOrdSigno = and testsOrdSigno

-- ===========================
-- 4. Ord para Entero
-- ===========================
testsOrdEntero :: [Bool]
testsOrdEntero =
  [ E Neg tres < E Neg dos			 -- -3 < -2
  , E Neg tres <= E Neg tres		 -- -3 <= -3
  , E Pos O <= E Neg O               -- ceros equivalentes
  , E Pos dos > E Neg uno			 -- 2 > -1
  , E Neg dos < E Pos uno			 -- -2 < 1
  , E Pos tres < E Pos cuatro		 -- 3 < 4
  , not (E Pos tres < E Pos tres)    -- not (3 < 3)
  , E Pos tres >= E Neg dos			 -- 3 > -2
  ]

okOrdEntero = and testsOrdEntero

-- ===========================
-- 5. Num para Entero (+, *, -)
-- ===========================
testsNumEntero :: [Bool]
testsNumEntero =
  -- + : mismos signos
  [ E Pos uno + E Pos dos == E Pos (S(S(S O)))          -- 1 + 2 = 3
  , E Neg uno + E Neg dos == E Neg (S(S(S O)))          -- (-1) + (-2) = -3
  -- + : signos opuestos
  , E Pos cinco + E Neg tres == E Pos (S(S O))          -- 5 + (-3) = 2
  , let r = E Neg dos + E Pos dos in r == E Pos O || r == E Neg O -- -2 + 2 = 0
  , let r = E Pos tres + E Neg tres in r == E Pos O || r == E Neg O
  , E Neg tres + E Pos uno == E Neg dos                 -- -3 + 1 = -2
  , E Pos uno + E Neg tres == E Neg dos                 -- 1 + (-3) = -2
  -- * : multiplicaciones básicas
  , E Pos dos * E Neg dos == E Neg (S(S(S(S O))))       -- 2 * -2 = -4
  , E Neg dos * E Neg uno == E Pos (S(S O))             -- (-2) * (-1) = 2
  , E Pos tres * E Pos dos == E Pos (S(S(S(S(S(S O))))))-- 3*2=6
  -- * : por cero (cualquier signo)
  , E Pos dos * E Neg O == E Pos O || E Pos dos * E Neg O == E Neg O
  , E Neg cinco * E Pos O == E Pos O || E Neg cinco * E Pos O == E Neg O
  , E Neg O * E Neg O == E Pos O || E Neg O * E Neg O == E Neg O
  -- - : restas
  , E Pos dos - E Pos cinco == E Neg (S(S(S O)))        -- 2 - 5 = -3
  , E Pos dos - E Pos dos == E Pos O || E Pos dos - E Pos dos == E Neg O
  , E Neg dos - E Neg cinco == E Pos tres               -- (-2) - (-5) = 3
  , E Neg cinco - E Neg dos == E Neg tres               -- (-5) - (-2) = -3
  , E Neg tres - E Pos uno == E Neg cuatro              -- (-3) - 1 = -4
  , E Pos tres - E Neg uno == E Pos cuatro              -- 3 - (-1) = 4
  , E Neg O - E Pos O == E Pos O || E Neg O - E Pos O == E Neg O -- 0 - 0
  ]

okNumEntero = and testsNumEntero

ok = and [okEqSigno,okEqEntero,okOrdSigno,okOrdEntero,okNumEntero]
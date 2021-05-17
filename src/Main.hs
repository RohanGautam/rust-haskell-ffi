{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign.C

foreign import ccall "double_input" doubleInput :: CInt -> CInt
foreign import ccall "load_something" loadSomething :: CInt -> Bool

main = do
  putStrLn "starting"
  let loadop = loadSomething 1400
  putStrLn $ show 4 ++ " * 2 = " ++ show loadop
  let input = 4
  let output = doubleInput input
  putStrLn $ show input ++ " * 2 = " ++ show output
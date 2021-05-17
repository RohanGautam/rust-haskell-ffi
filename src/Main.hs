{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign.C

foreign import ccall "double_input" doubleInput :: CInt -> CInt
foreign import ccall "load_something" loadSomething :: CInt -> Bool

main = do
  putStrLn "starting"
  -- load something for 5 seconds
  let isLoaded = loadSomething 5000 -- lazily executed, so we make "use" of the output below
  putStrLn $ "Loaded: " ++ show isLoaded 
  -- do some caclulation
  let input = 4
  let output = doubleInput input
  putStrLn $ show input ++ " * 2 = " ++ show output
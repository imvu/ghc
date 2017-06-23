{-# LINE 1 "T12010.hsc" #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LINE 2 "T12010.hsc" #-}
module Main where
import Control.Exception
import Control.Monad
import Foreign.C.Types
import Foreign.Marshal.Alloc
import GHC.IO.FD
import System.Exit


{-# LINE 13 "T12010.hsc" #-}

{-# LINE 14 "T12010.hsc" #-}

{-# LINE 15 "T12010.hsc" #-}

aF_INET :: CInt
aF_INET = 2
{-# LINE 18 "T12010.hsc" #-}

sOCK_STREAM :: CInt
sOCK_STREAM = 1
{-# LINE 21 "T12010.hsc" #-}

main :: IO ()
main = do

{-# LINE 27 "T12010.hsc" #-}
  sock <- c_socket aF_INET sOCK_STREAM 0
  let fd = FD sock 1
  res <- try $ allocaBytes 1024 (\ptr -> readRawBufferPtr "T12010" fd ptr 0 1024)
  case res of
    Left (_ex :: IOException) -> exitSuccess
    Right res'                -> print res' >> exitFailure

foreign import stdcall unsafe "socket"
  c_socket :: CInt -> CInt -> CInt -> IO CInt


{-# LINE 40 "T12010.hsc" #-}

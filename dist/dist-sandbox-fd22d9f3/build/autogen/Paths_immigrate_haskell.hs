module Paths_immigrate_haskell (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/max/develop/immigrate-haskell/.cabal-sandbox/bin"
libdir     = "/Users/max/develop/immigrate-haskell/.cabal-sandbox/lib/x86_64-osx-ghc-7.10.1/immig_ByjsJ0j8jcnHRlqnbQBTmS"
datadir    = "/Users/max/develop/immigrate-haskell/.cabal-sandbox/share/x86_64-osx-ghc-7.10.1/immigrate-haskell-0.1.0.0"
libexecdir = "/Users/max/develop/immigrate-haskell/.cabal-sandbox/libexec"
sysconfdir = "/Users/max/develop/immigrate-haskell/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "immigrate_haskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "immigrate_haskell_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "immigrate_haskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "immigrate_haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "immigrate_haskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

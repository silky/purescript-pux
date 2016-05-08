module BasicExample where

import BasicExample.Counter (update, view)
import Prelude (bind)
import Pux (start, fromSimple, renderToDOM)
import Signal.Chanenl (CHANNEL)
import Control.Monad.Eff.Exception (EXCEPTION)

main :: Eff (channel :: CHANNEL, err :: EXCEPTION) Unit
main = do
  app <- start
    { initialState: 0
    , update: fromSimple update
    , view: view
    , inputs: []
    }

  renderToDOM "#app" app.html

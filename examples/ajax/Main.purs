module AjaxExample where

import Control.Monad.Error.Class (catchError)
import AjaxExample.Todos (init, update, view)
import Prelude (bind)
import Pux (start, renderToDOM, noEffects)

main = do
  app <- start
    { initialState: init
    , update: catchError update (\e -> (noEffects (init)))
    , view: view
    , inputs: [] }

  renderToDOM "#app" app.html

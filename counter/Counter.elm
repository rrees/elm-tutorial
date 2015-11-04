module Counter where

import Html exposing (..)

type alias Model = Int


type Action = Increment | Decrement

update : Action -> Model -> Model
update action model =
    case action of
        Increment -> model + 1
        Decrement -> model - 1

view: Signal.Address Action -> Model -> Html
view address model =
    div []
        [
            button [] [text "Minus"],
            span [] [text (toString model)],
            button [] [text "Plus"]
        ]
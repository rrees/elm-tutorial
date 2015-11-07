module CounterPair where

import Counter exposing (Model)
import Html exposing (..)
import Html.Events exposing (onClick)

type alias Model =
    {
        top : Counter.Model,
        bottom : Counter.Model
    }


init : Int -> Int -> Model
init initialTop initialBottom =
    {
        top = Counter.init initialTop,
        bottom = Counter.init initialBottom
    }

type Action = Top Counter.Action
    | Bottom Counter.Action

update : Action -> Model -> Model
update action model =
    case action of
        Top act ->
        {
            model |
                top <- Counter.update act model.top
        }
        Bottom act ->
        {
            model |
                bottom <- Counter.update act model.bottom
        }

view: Signal.Address Action -> Model -> Html
view address model =
    div []
        [
            Counter.view (Signal.forwardTo address Top) model.top,
            Counter.view (Signal.forwardTo address Bottom) model.bottom,
            button [] [text "Reset"]
        ]

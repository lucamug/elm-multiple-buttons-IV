module Arrayhelpers exposing (..)

import Html exposing (div, text)
import Array
import Html.Attributes exposing (style)


main =
    div
        [ style
            [ ( "margin", "10px" )
            ]
        ]
        [ text "Just a collection of functions for Array manipulation" ]


getElementFromList list index default =
    list
        |> Array.fromList
        |> Array.get index
        |> replaceMaybeWithDefault default


replaceMaybeWithDefault default element =
    case element of
        Nothing ->
            default

        Just val ->
            val


setElementIntoList list index element =
    list
        |> Array.fromList
        |> Array.set index element
        |> Array.toList


removeElementFromList index list =
    (List.take index list) ++ (List.drop (index + 1) list)


updateModelInList list index default msg update =
    let
        model =
            getElementFromList list index default

        newModel =
            update msg model
    in
        setElementIntoList list index newModel

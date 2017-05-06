module Arrayhelper exposing (..)

import Array


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

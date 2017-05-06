module Level1 exposing (view, Msg, update)

import Arrayhelper
import Level2 as Nextlevel
import Html exposing (beginnerProgram, div, button, text, pre)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)


color =
    "#c7c8f9"


defaultElementIfNothing =
    []


main =
    beginnerProgram
        { model = []
        , view = view
        , update = update
        }


view model =
    div [ style [ ( "margin", "10px" ) ] ]
        [ button [ onClick (Add) ] [ text "Add" ]
        , div []
            (List.indexedMap
                (\index element ->
                    div
                        [ style
                            [ ( "border", "1px solid #aaa" )
                            , ( "background-color", color )
                            , ( "display", "inline-block" )
                            , ( "padding", "10px" )
                            , ( "margin", "10px" )
                            ]
                        ]
                        [ Html.map
                            (MsgFromChild index)
                            (div
                                []
                                [ Nextlevel.view element ]
                            )
                        , button [ onClick (Remove index) ] [ text "Remove" ]
                        ]
                )
                model
            )
        , pre [] [ text ("model: " ++ (toString model)) ]
        ]


type Msg
    = MsgFromChild Int Nextlevel.Msg
    | Remove Int
    | Add


update msg model =
    case msg of
        MsgFromChild index msgFromChild ->
            let
                _ =
                    Debug.log "msg" msg

                oldElement =
                    Arrayhelper.getElementFromList model index defaultElementIfNothing

                newElement =
                    Nextlevel.update msgFromChild oldElement
            in
                Arrayhelper.setElementIntoList model index newElement

        Remove index ->
            Arrayhelper.removeElementFromList index model

        Add ->
            List.append model [ defaultElementIfNothing ]

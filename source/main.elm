module Main exposing (view, Msg, update)

import Arrayhelpers
import Product
import ProductDb
import Counter
import Html exposing (beginnerProgram, div, button, text, pre)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)


main =
    beginnerProgram
        { model =
            { counters = []
            , products = []
            }
        , view = view
        , update = update
        }


type Type
    = Counter
    | Product


type Msg
    = MsgFromCounter Int Counter.Msg
    | MsgFromProduct Int Product.Msg
    | Remove Type Int
    | Add Type


view model =
    div [ style [ ( "margin", "10px" ) ] ]
        [ subView model.counters Counter.view MsgFromCounter Counter
        , subView model.products Product.view MsgFromProduct Product
        , div [] [ text ("model: " ++ (toString model)) ]
        ]


subView model view msg type_ =
    div []
        [ button [ onClick (Add type_) ] [ text ("Add " ++ toString type_) ]
        , div []
            (List.indexedMap
                (\index element ->
                    div
                        [ style
                            [ ( "border", "1px solid #aaa" )
                            , ( "background-color", "#b7f4f9" )
                            , ( "display", "inline-block" )
                            , ( "padding", "10px" )
                            , ( "margin", "10px" )
                            ]
                        ]
                        [ Html.map
                            (msg index)
                            (div
                                []
                                [ view element ]
                            )
                        , button [ onClick (Remove type_ index) ] [ text "Remove" ]
                        ]
                )
                model
            )
        ]


update msg model =
    case Debug.log "msg" msg of
        MsgFromCounter index msgFromChild ->
            { model | counters = Arrayhelpers.updateModelInList model.counters index 0 msgFromChild Counter.update }

        MsgFromProduct index msgFromChild ->
            { model | products = Arrayhelpers.updateModelInList model.products index Product.init msgFromChild Product.update }

        Remove type_ index ->
            case type_ of
                Counter ->
                    { model | counters = Arrayhelpers.removeElementFromList index model.counters }

                Product ->
                    { model | products = Arrayhelpers.removeElementFromList index model.products }

        Add type_ ->
            case type_ of
                Counter ->
                    { model | counters = List.append model.counters [ 0 ] }

                Product ->
                    let
                        position =
                            (List.length model.products) % (List.length ProductDb.db)

                        product =
                            Arrayhelpers.getElementFromList ProductDb.db position Product.init
                    in
                        { model | products = List.append model.products [ product ] }

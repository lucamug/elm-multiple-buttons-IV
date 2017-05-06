module Level2 exposing (view, Msg, update)

import Arrayhelper
import Product
import Buttons as Nextlevel
import Html exposing (beginnerProgram, div, button, text, pre)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)


color =
    "#c7f4f9"


defaultElementIfNothing =
    0


defaultProductIfNothing =
    Product.init


main =
    beginnerProgram
        { model = { buttons = [], products = [] }
        , view = view
        , update = update
        }


view model =
    div [ style [ ( "margin", "10px" ) ] ]
        [ button [ onClick (Add Buttons) ] [ text "Add Buttons" ]
        , button [ onClick (Add Product) ] [ text "Add Product" ]
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
                        , button [ onClick (Remove Buttons index) ] [ text "Remove" ]
                        ]
                )
                model.buttons
            )
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
                            (MsgFromProduct index)
                            (div
                                []
                                [ Product.view element ]
                            )
                        , button [ onClick (Remove Product index) ] [ text "Remove" ]
                        ]
                )
                model.products
            )
        , pre [] [ text ("model: " ++ (toString model)) ]
        ]


type Type
    = Buttons
    | Product


type Msg
    = MsgFromChild Int Nextlevel.Msg
    | MsgFromProduct Int Product.Msg
    | Remove Type Int
    | Add Type


update msg model =
    let
        _ =
            Debug.log "msg" msg
    in
        case msg of
            MsgFromChild index msgFromChild ->
                let
                    oldElement =
                        Arrayhelper.getElementFromList model.buttons index defaultElementIfNothing

                    newElement =
                        Nextlevel.update msgFromChild oldElement
                in
                    { model | buttons = Arrayhelper.setElementIntoList model.buttons index newElement }

            MsgFromProduct index msgFromChild ->
                let
                    oldElement =
                        Arrayhelper.getElementFromList model.products index defaultProductIfNothing

                    newElement =
                        Product.update msgFromChild oldElement
                in
                    { model | products = Arrayhelper.setElementIntoList model.products index newElement }

            Remove type_ index ->
                case type_ of
                    Buttons ->
                        { model | buttons = Arrayhelper.removeElementFromList index model.buttons }

                    Product ->
                        { model | products = Arrayhelper.removeElementFromList index model.products }

            Add type_ ->
                case type_ of
                    Buttons ->
                        { model | buttons = List.append model.buttons [ defaultElementIfNothing ] }

                    Product ->
                        { model | products = List.append model.products [ defaultProductIfNothing ] }

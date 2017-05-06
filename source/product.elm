module Product exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { name : String
    , price : Float
    , priceInView : Bool
    , picture : String
    }


init : Model
init =
    Model "Photocamera" 24.31 False "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"


type Msg
    = ShowPrice
    | HidePrice


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowPrice ->
            { model | priceInView = True }

        HidePrice ->
            { model | priceInView = False }


view : Model -> Html Msg
view model =
    div
        [ if model.priceInView then
            onClick HidePrice
          else
            onClick ShowPrice
        , style
            [ ( "padding", "20px" )
            , ( "margin", "10px" )
            , ( "display", "inline-block" )
            , ( "cursor", "pointer" )
            , ( "text-align", "center" )
            , ( "background-color", "#ffffff" )
            , ( "border", "1px solid grey" )
            , ( "width", "120px" )
            ]
        ]
        [ div [] [ text model.name ]
        , div
            [ style
                [ ( "padding-bottom", "100%" )
                , ( "position", "relative" )
                ]
            ]
            [ img
                [ src model.picture
                , style
                    [ ( "position", "absolute" )
                    , ( "max-width", "100%" )
                    , ( "max-width", "70%" )
                    , ( "max-height", "70%" )
                    , ( "margin", "auto" )
                    , ( "top", "0" )
                    , ( "left", "0" )
                    , ( "bottom", "0" )
                    , ( "right", "0" )
                    , ( "max-height", "100%" )
                    , ( "transition", "all 0.5s" )
                    , if model.priceInView then
                        ( "transform", "rotateY(360deg)" )
                      else
                        ( "transform", "rotateY(0deg)" )
                    ]
                ]
                []
            ]
        , if model.priceInView then
            div
                [ style
                    [ ( "backgroundColor", "#aaffaa" )
                    , ( "padding", "4px" )
                    ]
                ]
                [ text (toString model.price ++ "$") ]
          else
            div
                [ style
                    [ ( "padding", "4px" )
                    ]
                ]
                [ text "Click for Price" ]
        ]


main : Program Never Model Msg
main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }

module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events as Events


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 0 }


type Msg
    = Increment


main : Program flags Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : flags -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = "Elm template"
    , body =
        [ Html.button
            [ Attr.class "button"
            , Events.onClick PlayButtonClicked
            ]
            [ Html.text (String.fromInt model.count) ]
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

module ProductDb exposing (db)

import Product
import Html exposing (beginnerProgram, div, button, text, pre, h1)
import Html.Attributes exposing (style)


main =
    div
        [ style
            [ ( "margin", "10px" )
            ]
        ]
        [ h1 [] [ text "ProductDb" ]
        , text (toString db)
        ]


db =
    [ Product.Model "Photocamera" 24.31 False "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"
    , Product.Model "TV" 24.22 True "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/f5/5808ec3fcee27fddd4f6d80bd6512061/ue-55ku6070-led-fernseher-dvb-t2cs2-hdmi-usb-ci-und-wlan.jpg"
    , Product.Model "Product 3" 36.45 True "https://files.rakuten-static.de/a80a984051650024bc9aba3c601fb83a/thumbs/280/a1/ade697c2eb8f1eec8d3bbba3eaae031c/gartenliege-rio-grande-liegestuhl-sonnenliege-relaxliege.jpg"
    , Product.Model "Watch" 48.77 False "https://files.rakuten-static.de/af7ab40167d6ddd2323eba2ce7b0b90b/thumbs/280/14/e56931b625ab4a22d5c8fcbc2309042d/firenze-herrenuhr-chronograph-schwarz-orange-edelstahl-lederarmband-neu.jpg"
    , Product.Model "Bicycle" 24.38 False "https://files.rakuten-static.de/e9d9152203630452fef5a10bdbe6f01b/thumbs/280/2d/c4494d84e489e8022313b5190a8cf0c5/likeabike-jumper-von-kokua-like-a-bike-orange.jpg"
    , Product.Model "Movie" 36.43 False "http://marketplace.rakuten-static.de/cms_content/homepage/content/images/wuaki/vaiana.jpeg"
    , Product.Model "Laptop" 48.17 True "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/5d/f958bcfe9f68145916aa2f65df5179ac/aspire-e-15-e5-575g-59z7-15-6-und-quot-full-hd-gaming-notebook-940mx-intel-core-i5-8gb-ram.jpg"
    , Product.Model "Coffee" 24.73 False "https://files.rakuten-static.de/8862eb0986a6a4e7be3a19b910545cc0/thumbs/280/99/e5ce3cf7a4bbea798fb3f20bc6a81c39/ea815b-espresso-kaffee-vollautomat.jpg"
    ]

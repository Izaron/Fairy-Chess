package.path = "?.lua;" .. package.path
package.path = "pieces/?.lua;" .. package.path
package.path = "love2d-modules/?.lua;" .. package.path

love.conf = (t) ->
    export Settings = {
        cell_size: 80,
        rows: 8,
        columns: 8,

        white_color: {
            red: 0.9375,
            green: 0.84765625,
            blue: 0.70703125
        },

        black_color: {
            red: 0.70703125,
            green: 0.53125,
            blue: 0.38671875
        },

        font_size: 24
    }

--     export rapidjson = require("rapidjson")
--     export settings = rapidjson.load(LOVE2DFOLDER .. "settings.json")

    t.window.title = "Fairy Chess"
    t.window.icon = "assets/icon.png"

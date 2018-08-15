package.path = "?.lua;" .. package.path
package.path = "pieces/?.lua;" .. package.path
package.path = "love2d-modules/?.lua;" .. package.path

require "settings"

LOVE2DFOLDER = "love2d-modules/"

love.conf = (t) ->
    t.modules.audio = false
    t.modules.event = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = false
    t.modules.keyboard = false
    t.modules.math = false
    t.modules.mouse = false
    t.modules.physics = false
    t.modules.sound = false
    t.modules.system = false
    t.modules.timer = false
    t.modules.touch = false
    t.modules.video = false
    t.modules.window = true
    t.modules.thread = false

--     export rapidjson = require("rapidjson")
--     export settings = rapidjson.load(LOVE2DFOLDER .. "settings.json")

    t.window.width = Settings["columns"] * Settings["cell_size"]
    t.window.height  = Settings["rows"] * Settings["cell_size"]

    t.window.title = "Fairy Chess"
    t.window.icon = LOVE2DFOLDER .. "icon.png"


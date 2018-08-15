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

    export rapidjson = require("rapidjson")
    export settings = rapidjson.load("love2d/settings.json")

    t.window.width = settings["columns"] * settings["cell_size"]
    t.window.height  = settings["rows"] * settings["cell_size"]

    t.window.title = "Fairy Chess"
    t.window.icon = "icon.png"


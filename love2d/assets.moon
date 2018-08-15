require"logging.console"

ASSETS_FOLDER = "assets/"

logger = logging.console()

images = {}  -- Loaded images from the assets folder


load_all = ->
    files = love.filesystem.getDirectoryItems(ASSETS_FOLDER)
    for file in *files
        key = file\sub(0, file\find(".", 1, true) - 1)
        logger\debug("loading #{file}")
        images[key] = love.graphics.newImage(ASSETS_FOLDER .. file)


export Assets = {
    :images, :load_all
}

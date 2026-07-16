local sushi_splitters = require("__sushi-splitters-lib__.lib")

if mods["lignumis"] and settings.startup["sushi-splitters-and-more-compat-lignumis"].value then
  if not mods["wood-logistics"] then
    sushi_splitters.create_sushi_splitter {
        name = "wood-splitter",
        tint = util.color("896245"),
        -- Recipes will be added by the original mod in data updates phase.
        --unlock = "wood-logistics",
      }
  end
end

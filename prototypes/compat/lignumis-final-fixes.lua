local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if mods["lignumis"] and not settings.startup["sushi-splitters-and-more-compat-lignumis"].value then
  if not mods["wood-logistics"] and settings.startup["lignumis-belt-progression"].value then
    -- Remove sushi splitter upgrade recipes if lignumis belt progression is enabled, otherwise the game will crash
    khaoslib_recipe.remove("sushi-splitter-upgrade")
    khaoslib_technology:load("logistics")
      :remove_unlock_recipe("sushi-splitter-upgrade")
      :commit()

    -- Simplify recycling recipe
    if mods["quality"] then
      khaoslib_recipe:load("sushi-splitter-recycling")
        :set_results {
          {type = "item", name = "sushi-splitter", amount = 1, probability = 0.25}
        } :commit()
    end
  end
end

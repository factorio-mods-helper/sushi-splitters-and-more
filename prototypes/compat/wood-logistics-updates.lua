local flib_locale = require("__flib__.locale")
local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_entity = require("__khaoslib__.prototypes.entity")
local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local sushi_splitters = require("__sushi-splitters-lib__.lib")

if mods["wood-logistics"] and (not mods["lignumis"] or (mods["lignumis"] and not settings.startup["sushi-splitters-and-more-compat-lignumis"].value)) then
  if settings.startup["sushi-splitters-and-more-compat-wood-logistics"].value then
    local new_icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/splitter-south", util.color("896245"))

    khaoslib_entity:load("splitter", "sushi-wood-splitter"):set_icons(new_icons):commit()
    khaoslib_item:load("sushi-wood-splitter"):set_icons(new_icons):commit()

    local recipes = {
      "sushi-wood-splitter",
      "sushi-wood-splitter-upgrade",
    }

    for _, recipe_name in pairs(recipes) do
      khaoslib_recipe:load(recipe_name)
        :set_icons(new_icons)
        :commit()
    end
  else
    sushi_splitters.remove_sushi_splitter("wood-splitter", nil, nil, "wood-logistics")
  end
end

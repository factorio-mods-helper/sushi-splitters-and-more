local flib_locale = require("__flib__.locale")
local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_entity = require("__khaoslib__.prototypes.entity")
local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

if mods["lignumis"] and settings.startup["sushi-splitters-and-more-compat-lignumis"].value then
  local new_icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/splitter-south", util.color("896245"))

  khaoslib_entity:load("splitter", "sushi-wood-splitter"):set_icons(new_icons):commit()
  khaoslib_item:load("sushi-wood-splitter"):set_icons(new_icons):commit()

  local recipes = {
    "sushi-wood-splitter",
    "sushi-wood-splitter-upgrade",
  }

  for _, recipe_name in pairs(recipes) do
    -- Create recipe copies with gold cable instead of copper cable
    khaoslib_recipe.copy(recipe_name, "gold-" .. recipe_name)
      :set {localised_name = flib_locale.of("recipe", recipe_name)}
      :replace_ingredient("copper-cable", function (ingredient)
        ingredient.name = "gold-cable"
        return ingredient
      end)
      :set_icons(util.combine_icons(
        new_icons,
        {{icon = "__lignumis-assets__/graphics/icons/gold-cable.png", icon_size = 64, draw_background = true}},
        {scale = 0.5, shift = {8, 8}},
        64
      ))
      :add_unlock("wood-logistics")
      :commit()

    -- Add copper cable icon to the original recipes
    khaoslib_recipe:load(recipe_name)
      :set_icons(util.combine_icons(
        new_icons,
        {{icon = "__base__/graphics/icons/copper-cable.png", icon_size = 64, draw_background = true}},
        {scale = 0.5, shift = {8, 8}},
        64
      ))
      :commit()
  end
end

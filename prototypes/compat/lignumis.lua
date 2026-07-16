local flib_locale = require("__flib__.locale")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local sushi_splitters = require("__sushi-splitters-lib__.lib")

if mods["lignumis"] and settings.startup["sushi-splitters-and-more-compat-lignumis"].value then
  if not mods["wood-logistics"] then
    sushi_splitters.create_sushi_splitter {
        name = "wood-splitter",
        tint = util.color("896245"),
        -- Recipes will be added by the original mod in data updates phase.
        --unlock = "wood-logistics",
      }

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
          khaoslib_recipe.get_icons(recipe_name),
          {{icon = "__lignumis-assets__/graphics/icons/gold-cable.png", icon_size = 64}},
          {scale = 0.5, shift = {8, 8}},
          64
        ))
        :add_unlock("wood-logistics")
        :commit()

      -- Add copper cable icon to the original recipes
      khaoslib_recipe:load(recipe_name)
        :set_icons(util.combine_icons(
          khaoslib_recipe.get_icons(recipe_name),
          {{icon = "__base__/graphics/icons/copper-cable.png", icon_size = 64}},
          {scale = 0.5, shift = {8, 8}},
          64
        ))
        :commit()
    end

  end
end

--- @diagnostic disable: param-type-mismatch

local khaoslib_entity = require("__khaoslib__.prototypes.entity")
local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

if settings.startup["sushi-splitters-and-more-tweaks-recipe-hints"].value then
  local sushi_splitters_recipes = khaoslib_recipe.find(function (recipe)
    return recipe.name:match("sushi(.*)splitter") ~= nil and recipe.name:match("recycling") == nil and recipe.name:match("incineration") == nil
  end)

  for _, recipe_name in pairs(sushi_splitters_recipes) do
    local new_icons = {}
    local recipe = khaoslib_recipe:load(recipe_name)

    if recipe:has_ingredient(function (ingredient) return ingredient.name:match("sushi(.*)splitter") ~= nil end) then
      local ingredient = recipe:get_ingredient(function (_ingredient) return _ingredient.name:match("sushi(.*)splitter") ~= nil end)
      new_icons = ingredient and khaoslib_item.get_icons(ingredient.name) or {}
    elseif recipe:has_ingredient(function (ingredient) return ingredient.name:match("splitter") ~= nil end) then
      local ingredient = recipe:get_ingredient(function (_ingredient) return _ingredient.name:match("splitter") ~= nil end)
      new_icons = ingredient and khaoslib_item.get_icons(ingredient.name) or {}
    end

    if #new_icons > 0 then
      new_icons = util.combine_icons(recipe:get_icons(), new_icons, {scale = 0.5, shift = {-8, -8}}, 64)
      --new_icons = util.combine_icons(new_icons, recipe:get_icons(), {}, 64)

      recipe:set_icons(new_icons):commit()
    end
  end
end

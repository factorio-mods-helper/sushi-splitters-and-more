local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_entity = require("__khaoslib__.prototypes.entity")
local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

local tint_map = {
  ["sushi-splitter"] = util.color("e3bf05"),
  ["sushi-fast-splitter"] = util.color("e64131"),
  ["sushi-express-splitter"] = util.color("84d5e6"),
  ["sushi-turbo-splitter"] = util.color("b7d369"),
}

for name, tint in pairs(tint_map) do
  local new_icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/splitter-south", tint)

  if khaoslib_entity.exists("splitter", name) then
    khaoslib_entity:load("splitter", name):set_icons(new_icons):commit()
  end

  if khaoslib_item.exists(name) then
    khaoslib_item:load(name):set_icons(new_icons):commit()
  end

  if khaoslib_recipe.exists(name) then
    khaoslib_recipe:load(name):set_icons(new_icons):commit()
  end

  if khaoslib_recipe.exists(name .. "-upgrade") then
    khaoslib_recipe:load(name .. "-upgrade"):set_icons(new_icons):commit()
  end
end

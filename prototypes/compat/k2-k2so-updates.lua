local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_entity = require("__khaoslib__.prototypes.entity")
local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local sushi_splitters = require("__sushi-splitters-lib__.lib")

local splitters = {
  ["kr-advanced-splitter"] = {
    color = util.color("59ea41"),
    unlock = "kr-logistic-4",
  },
  ["kr-superior-splitter"] = {
    color = util.color("b648e6"),
    unlock = "kr-logistic-5",
  },
}

if mods["Krastorio2"] or mods["Krastorio2-spaced-out"] then
  if settings.startup["sushi-splitters-and-more-compat-k2-k2so"].value then
    for splitter, v in pairs(splitters) do
      local new_icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/splitter-south", v.color)

      khaoslib_entity:load("splitter", "sushi-" .. splitter):set_icons(new_icons):commit()
      khaoslib_item:load("sushi-" .. splitter):set_icons(new_icons):commit()

      local recipes = {
        "sushi-" .. splitter,
        "sushi-" .. splitter .. "-upgrade",
      }

      for _, recipe_name in pairs(recipes) do
        khaoslib_recipe:load(recipe_name)
          :set_icons(new_icons)
          :commit()
      end
    end

    if mods["Krastorio2-spaced-out"] then
      sushi_splitters.remove_sushi_splitter("kr-advanced-splitter")
    end
  else
    for splitter, v in pairs(splitters) do
      sushi_splitters.remove_sushi_splitter(splitter, nil, nil, v.unlock)
    end
  end
end

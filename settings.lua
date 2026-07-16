local khaoslib_setting = require("__khaoslib__.settings.setting")

if mods["lignumis"] then
  khaoslib_setting:load {
    type = "bool-setting",
    name = "sushi-splitters-and-more-compat-lignumis",
    setting_type = "startup",
    default_value = true,
    order = "a[compat]-a[lignumis]",
  } :commit()
end

if mods["wood-logistics"] then
  khaoslib_setting:load {
    type = "bool-setting",
    name = "sushi-splitters-and-more-compat-wood-logistics",
    setting_type = "startup",
    default_value = true,
    order = "a[compat]-a[wood-logistics]",
  } :commit()
end

khaoslib_setting:load {
  type = "bool-setting",
  name = "sushi-splitters-and-more-tweaks-recipe-hints",
  setting_type = "startup",
  default_value = true,
  order = "a[tweaks]-a[recipe-hints]",
} :commit()

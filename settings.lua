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

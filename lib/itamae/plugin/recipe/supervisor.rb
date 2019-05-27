require "itamae/plugin/recipe/supervisor/version"

include_recipe './supervisor/stop'
include_recipe './supervisor/install'

include_seasoning if respond_to?(:include_seasoning)

include_recipe './supervisor/start'

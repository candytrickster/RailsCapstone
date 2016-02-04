# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
# %w( landing.rb ).each do |controller|
#   Rails.application.config.assets.precompile += ["#{controller}.css"]
# end

Rails.application.config.assets.precompile += %w( landing.css )
Rails.application.config.assets.precompile += %w( signing.css )
Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( budget.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( countdown.js )
Rails.application.config.assets.precompile += %w( guest_lists.css )
Rails.application.config.assets.precompile += %w( seating.css )
Rails.application.config.assets.precompile += %w( tables.css )

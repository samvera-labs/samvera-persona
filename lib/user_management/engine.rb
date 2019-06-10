require 'rubygems'
require 'pretender'
module UserManagement
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_bot, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    config.before_initialize do
      config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    end

    config.after_initialize do
      my_engine_root = UserManagement::Engine.root.to_s
      paths = ActionController::Base.view_paths.collect{|p| p.to_s}
      hyrax_path = paths.detect { |path| path.match('/hyrax-') }
      if hyrax_path
        paths = paths.insert(paths.index(hyrax_path), my_engine_root + '/app/views')
      else
        paths = paths.insert(0, my_engine_root + '/app/views')
      end
      ActionController::Base.view_paths = paths
      ::ApplicationController.send :include, UserManagement::BecomesBehavior
    end

  end
end

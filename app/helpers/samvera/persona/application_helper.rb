module Samvera
  module Persona
    module ApplicationHelper
      def root_path
        main_app.root_path
      end

      def root_url
        main_app.root_url
      end
    end
  end
end

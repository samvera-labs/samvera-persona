
module UserManagement
  class ApplicationController < ::ApplicationController
    impersonates :user
  end
end
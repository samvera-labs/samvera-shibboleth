class Samvera::Shibboleth::RoutesGenerator < Rails::Generators::Base
  def replace_device_route
    insert_into_file 'config/routes.rb', after: /devise_for :users/ do
      ", :controllers => { :omniauth_callbacks => \"omniauthcallbacks\" }, :skip => [:sessions]"
    end
  end
end

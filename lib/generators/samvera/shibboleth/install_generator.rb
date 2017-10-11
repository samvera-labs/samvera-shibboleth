class Samvera::Shibboleth::Install < Rails::Generators::Base
  def install_models
    generate "samvera:shibboleth:models"
  end

  def install_config
    generate "samvera:shibboleth:config"
  end

  def install_routes
    generate "samvera:shibboleth:routes"
  end
end

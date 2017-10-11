class Samvera::Shibboleth::ConfigGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def inject_device_omniauth
    file_path = 'config/initializers/devise.rb'
    abort "Device is not installed" unless File.exist?(file_path)
    insert_into_file file_path, before: /\n  \# ==> Warden configuration\n/ do
      "  config.omniauth :shibboleth, {:uid_field => 'eppn',\n" \
      "                                :info_fields => {\n" \
      "                                  ## affiliation info from testshib.org IDP\n" \
      "                                  :affiliation => lambda {|request_param| request_param.call('unscoped-affiliation').split(';')},\n" \
      "                                },\n" \
      "  }\n" \
      "  ## Note: the above 'lambda' turns a shib multi-valued attribute value into ruby array\n" \
      "  ## See https://github.com/toyokazu/omniauth-shibboleth\n"
    end
  end

  def install_omniauth_initializer
    copy_file "config/initializers/omniauth.rb"
  end
end

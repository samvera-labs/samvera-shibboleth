class Samvera::Shibboleth::ModelsGenerator < Rails::Generators::Base
  def inject_user_model
    file_path = 'app/models/user.rb'
    abort "User model does not exist." unless File.exist?(file_path)
    insert_into_file file_path, after: /:validatable/ do
      ", :omniauthable"
    end
    insert_into_file file_path, before: /  \# Method added by Blacklight/ do
      "  ## allow omniauth (including shibboleth) logins - this will create a local user based on an omniauth/shib login\n" \
      "  ## if they haven't logged in before\n" \
      "  def self.from_omniauth(auth)\n" \
      "    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|\n" \
      "      user.provider = auth.provider\n" \
      "      user.uid = auth.uid\n" \
      "      user.email = auth.uid\n" \
      "      user.password = Devise.friendly_token[0,20]\n" \
      "    end\n" \
      "  end\n\n"
    end
  end
end

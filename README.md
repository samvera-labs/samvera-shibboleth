# Samvera::Shibboleth

This gem is a *WORK IN PROGRESS* to make configuring Hyrax/Devise to use shibboleth authentication easier.

## Prerequisites

This gem is currently under development for [Hyrax](https://github.com/samvera/hyrax) with plans to test against
[Hyku](https://github.com/samvera-labs/hyku). See those installation instructions for a more complete set of dependencies.

This gem assumes the following:

1. [Hyrax](https://github.com/samvera/hyrax)
1. A web server:
    1. [Apache](#apache) configuration
    2. [Nginx](#nginx) configuration

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'samvera-shibboleth', :git => 'https://github.com/samvera-labs/samvera-shibboleth.git'
```

And then execute:
```bash
$ bundle install
```

## Web Server Configuration

### Apache

The following is a basic config. There will likely be additional configuration depending on how the appliation is running (eg. passenger setup for rails).

```apache
<VirtualHost *:443>
    ServerName YOUR_IP_ADDRESS_OR_HOSTNAME

    SSLEngine On
    # Using existing self-signed cert - change this to a proper certificate
    SSLCertificateFile /etc/pki/tls/certs/localhost.crt
    SSLCertificateKeyFile /etc/pki/tls/private/localhost.key
    CustomLog       "/var/log/httpd/ssl_access_log" combined
    ErrorLog        "/var/log/httpd/ssl_error_log"

    # Shibboleth Setup
    # The location matches the path in your application that will redirect to shibboleth
    # for authentication
    <Location "/users/auth/shibboleth">
        AuthType shibboleth
        ShibRequestSetting requireSession 1
        require valid-user
     </Location>

</VirtualHost>
```

### Nginx

_*Coming Soon.*_

## Contributing 

If you're working on a PR for this project, create a feature branch off of `main`. 

This repository follows the [Samvera Community Code of Conduct](https://samvera.atlassian.net/wiki/spaces/samvera/pages/405212316/Code+of+Conduct) and [language recommendations](https://github.com/samvera/maintenance/blob/master/templates/CONTRIBUTING.md#language).  Please ***do not*** create a branch called `master` for this repository or as part of your pull request; the branch will either need to be removed or renamed before it can be considered for inclusion in the code base and history of this repository.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

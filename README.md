# Masq2 OpenID Server

Masq2 is a mountable Rails engine that provides OpenID server/identity provider functionality.
It is the successor to the [masq gem](https://github.com/dennisreimann/masq), which in turn
was the successor of the stand-alone Rails application of the same purpose, [masquerade](http://github.com/dennisreimann/masquerade/).

Because of this history, and the desire to be drop-in compatible with `masq`,
the namespace remains `Masq`, not `Masq2`.

The project is released under the MIT-License and its source code is available at [GitHub](http://github.com/oauth-xx/masq2/).
Feel free to fork and submit patches :)

## Installation

1. In case you want to run Masq2 as a standalone application (not integrated into an existing app), you will have to generate a bare-bone Rails app first:
    * `rails new my_openid_provider`

2. Add `masq2` to your Gemfile and install it:
    * `gem 'masq2'`
    * `bundle install`

3. Copy the configuration and edit it:
    * `bundle exec rake masq:install:config`
    * `$EDITOR config/masq.yml`

4. Copy the migrations and migrate:
    * `bundle exec rake masq:install:migrations`
    * `bundle exec rake db:migrate`

5. Configure the routes by mounting the masq engine:
    * For integration into an existing app, mount it in a subdirectory, like:
        * `mount Masq::Engine => "/masq"` or
        * `mount Masq::Engine => "/openid"`
    * Standalone installation, mount it at the root:
        * `mount Masq::Engine => "/"`

## Testing the installation

You can test the functionality in your local environment starting two instances: One as
your Identity Provider/OpenID Server and another one as Relying Party.

    * `rails server`
    * `rails server -p 3001`

Open your browser with these urls (assumes you mounted the engine at */masq*):

    * [http://localhost:3000/masq](http://localhost:3000/masq) (Identity Provider)
    * [http://localhost:3001/masq/consumer](http://localhost:3001/masq/consumer) (Relying Party testsuite)

First you have to create an account at the Identity Provider, after that you will be able
to use the issued OpenID URL (`http://localhost:3000/masq/YOUR_LOGIN`) to send requests from the
Relying Party to the server.

Use the options provided by the OpenID verification form to test several aspects of the
client-server communication (like requesting simple registration data).

## Development

### Introduction

`masq2` adds ORACLE database support, as well as support for
Rails 6.1, 7.0, 7.1, 7.2, 8.0, which `masq` never had.

The main functionality is in the server controller, which is the endpoint for incoming
OpenID requests. The server controller is supposed to only interact with relying parties
a.k.a. consumer websites. It includes the OpenidServerSystem module, which provides some
handy methods to access and answer OpenID requests.

#### v1 Release Breaking Change

\[📒Also Rails 5.2+ / Serialization / Psych Caveats\]

v1 release has a breaking change from the ancient masq v0.3.4 release.
Continue reading if you think it may impact you.

Rails 5.2.8.1 is a security patch release to fix CVE-2022-32224.
See: https://discuss.rubyonrails.org/t/cve-2022-32224-possible-rce-escalation-bug-with-serialized-columns-in-active-record/81017

The patch (Rails v5.2.8.1) causes an error with `masq` v0.3.4

```
Psych::DisallowedClass: Tried to load unspecified class: ActiveSupport::HashWithIndifferentAccess
```

when serializing a Hash the way we had done in previous versions `app/models/masq/open_id_request.rb`:
```ruby
serialize :parameters, Hash
```

so we instead switch to serializing as JSON:
```ruby
# serialize :parameters, JSON # Would be for Rails 5.2/6.0, but this gem has already dropped support for Rails 5.2/6.0
serialize :parameters, type: Hash, coder: JSON
```

If an implementation needs to continue using the serialized Hash,
you will need to override the definition by reopening the model, and adding:

```ruby
serialize :parameters, type: Hash, coder: Hash
```

In addition, one of the following is also needed.

1. Simple, but insecure fix, which reverts to previous unpatched behavior is:

      ```ruby
Rails.application.config.active_record.use_yaml_unsafe_load = true
      ```

2. More complex, and a bit less insecure fix, is to explicitly list the allowed classes to serialize:

      ```ruby
Rails.application.config.active_record.yaml_column_permitted_classes = [Symbol, Date, Time, HashWithIndifferentAccess]
      ```

### Testing

You can run the tests with Rake:

* `DB_ADAPTER=sqlite3 bundle exec rake app:masq:test:ci`
* `DB_ADAPTER=mysql2 bundle exec rake app:masq:test:ci`
* `DB_ADAPTER=postgresql bundle exec rake app:masq:test:ci`

The Rake task configures the database.yml for the chosen adapter.

In case you prefer running the tests continuously, use Guard:

* `bundle exec guard`

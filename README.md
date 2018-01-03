# Masq OpenID Server

[![Build Status](https://travis-ci.org/bardbess/masq.svg?branch=5-0-rails)](http://travis-ci.org/bardbess/masq)

Masq is a mountable Rails engine that provides OpenID server/identity provider functionality.
It is the successor of the stand-alone Rails application [masquerade](http://github.com/dennisreimann/masquerade/).

The project is released under the MIT-License and its source code is available at [GitHub](http://github.com/dennisreimann/masquerade/).
Feel free to fork and submit patches :)

## Installation

0. In case you want to run masq as a standalone application (not integrated into an existing app), you will have to generate a barebone Rails app first:
    * `rails new my_openid_provider`

1. Add masq to your Gemfile and install it:
    * `gem 'masq'`
    * `bundle install`

2. Copy the configuration and edit it:
    * `bundle exec rake masq:install:config`
    * `$EDITOR config/masq.yml`

3. Copy the migrations and migrate:
    * `bundle exec rake masq:install:migrations`
    * `bundle exec rake db:migrate`

4. Configure the routes by mounting the masq engine:
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

This fork adds ORACLE database support to the existing dennisreimann/masq gem.

The main functionality is in the server controller, which is the endpoint for incoming
OpenID requests. The server controller is supposed to only interact with relying parties
a.k.a. consumer websites. It includes the OpenidServerSystem module, which provides some
handy methods to access and answer OpenID requests.

### Testing

You can run the tests with Rake:
    * `DB_ADAPTER=sqlite3 bundle exec rake app:masq:test:ci`
    * `DB_ADAPTER=mysql2 bundle exec rake app:masq:test:ci`
    * `DB_ADAPTER=postgresql bundle exec rake app:masq:test:ci`

The Rake task configures the database.yml for the chosen adapter.

In case you prefer running the tests continuously, use Guard:
    * `bundle exec guard`

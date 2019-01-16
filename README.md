# Steps
 1. Install devise gem
    - [add: gem 'devise' into Gemfile](https://github.com/plataformatec/devise)
    - run `bundle install`
    - run `rails g devise:install`
    - generate User model: `rails g devise user`
    - run `rake db:migrate`
 2. Install doorkeeper gem
    - [add: gem 'dookeeper' into Gemfile](https://github.com/doorkeeper-gem/doorkeeper)
 3. Install jbuilder gem for generate Json
    - [add: gem 'jbuilder' into Gemfile](https://github.com/rails/jbuilder)

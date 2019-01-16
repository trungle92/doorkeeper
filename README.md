# Install gem
 1. Install devise gem
    - [add: gem 'devise' into Gemfile](https://github.com/plataformatec/devise)
    - run `bundle install`
    - run `rails g devise:install`
    - generate User model: `rails g devise user`
    - run `rake db:migrate`
 2. Install doorkeeper gem
    - [add: gem 'doorkeeper' into Gemfile](https://github.com/doorkeeper-gem/doorkeeper)
    - run `bundle install`
    - run `rails generate doorkeeper:install`
    - run `rails generate doorkeeper:migration`
    - run `rake db:migrate`
 3. Install jbuilder gem for generating Json
    - [add: gem 'jbuilder' into Gemfile](https://github.com/rails/jbuilder)

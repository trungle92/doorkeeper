## NOTE
 1. I assume you know how oauth work :D
 2. With purpose is help you understand how oauth work in api rails application with devise and doorkeeper, so i just install and configure basically.
 3. If you want to be more please access them pages. 
 #
## Defination
| Authentication        | Authorization    |
| ---------------------:|:---------------: |
| who are you?          | Can you do this? |
| Establishing identity | verifying access |
| 401 Unauthorized      | 403 Forbidden    |

## Token based authentication
 - Alternative to session cookies
 - You don't worry about CSRF
 - Authorization: Bearer <-token->
## Access token
 - Often randomly generated strings
 - Has a limited lifetime
## Grant Types
 - Authorization Code
 - Implicit
 - **_Resource Owner Password_** (this type will be used in this article)
 - Client Credentials
#
## Flow
1. OAuth2:
![](https://assets.digitalocean.com/articles/oauth/abstract_flow.png "withouth doorkeeper")
2. with doorkeeper
![](https://i.imgur.com/zrwbb5j.png "with doorkeeper")
## Install gem
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
## Config
 1. In controller I wanna use **API** instead of **Api** so i have to config as below
 _config/intializer/inflections.rb_
 ```
 ActiveSupport::Inflector.inflections(:en) do |inflect| 
  inflect.acronym 'API'
 end
 ```
 2. I wanna overrdide token_controllers proper
 _config/routes.rb_
 ```
 use_doorkeeper do
  controllers(token: 'doorkeeper/custom_tokens')
 end
 ```

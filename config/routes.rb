Rails.application.routes.draw do
  devise_for :users

  use_doorkeeper do
    skip_controllers(
      :applications, :authorizations, :authorized_applications, :token_info
    )

    controllers(tokens: 'doorkeeper/custom_tokens')
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/public', to: "info#public"
      get '/mine', to: "info#mine"
    end
  end

end

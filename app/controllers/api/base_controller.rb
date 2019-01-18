class API::BaseController < ActionController::Base
  #include API::ErrorRescues
  include API::Rendering

  # don't need to use CRSF
  protect_from_forgery with: :null_session

  # I will skip this function
  # before_action :verify_secret_key_from_header
  #--------------------------------------------------
  # We are using doorkeeper, so don't need use devise to check CRSF
  skip_before_action :verify_authenticity_token

  # this view will render json object by using jbuilder
  # layout page for all api
  layout 'api/layouts/base'

  def current_user
    # https://github.com/doorkeeper-gem/doorkeeper/blob/f2816becf0d62250aa76d019535b31084d1622f4/lib/doorkeeper/rails/helpers.rb#L72
    # doorkeepr_token is an instance of Doorkeepr::AccessToken
    # doorkeeper_token.resource_owner_id ~ user_id
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token.present?
  end

  def doorkeeper_unauthorized_render_options(error: nil)
    error.define_singleton_method(:status){ :ok } if error.present?

    { json: APIStatus::USER_UNAUTHENTICATED.merge(message: error.try(:description), timestamp: Time.now.utc.to_i, data: nil) }
  end

  def pagination_params
    params.permit(:page, :per_page)
  end

  # if you work at real project then you need to protect your app 
  # with more type like SECRET_KEY_GET, expecially when you working 
  # with API project you have to strictly check endpoint.
  # so you should use SECRET_KEY from client to check them before going on
  def verify_secret_key_from_header
    if ENV['ENABLE_SECRET_KEY'] == 'true'
      if request.method == 'GET'
        secret_key = ENV['SECRET_KEY_GET']
      else
        secret_key = ENV['SECRET_KEY']
      end

      render_failure_without_template(
        APIStatus::USER_UNAUTHORIZED.merge(
          message: 'User unauthorized',
          key_message: 'user_unauthorized'
        )
      ) if secret_key != request.headers['HTTP_X_SECRET_KEY']
    end
  end
end

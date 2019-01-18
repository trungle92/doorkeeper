class API::V1::InfoController < API::BaseController
  before_action :doorkeeper_authorize!, except: :public
  before_action :clone_info

  def public
    render_success
  end

  def mine
    @info.merge(
      habit: 'Watch jav'
    )

    render_success
  end

  private
  def clone_info
    @info ||= {
      email: "lexuantrung1612@gmail.com",
      name:  "Mrlonely"
    }
  end
end

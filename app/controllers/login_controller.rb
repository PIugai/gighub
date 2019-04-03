class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def wechat_params
    p 'appid'
    p ENV["appId"]
    {
      appid: ENV["appId"],
      secret: ENV["appSecret"],
      js_code: params[:code],
      grant_type: "authorization_code"
    }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    p @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def login
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    p @user
    render json: {
      userId: @user.id
    }
  end
end

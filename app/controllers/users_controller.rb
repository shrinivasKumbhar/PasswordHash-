class UsersController < ApplicationController

  def index
    Rails.logger.info {"#{__FILE__}:#{__LINE__} index action start"}
    @user = User.new

    count = MyView.select("count(*) as count");
    Rails.logger.info {"#{__FILE__}:#{__LINE__} count #{count[0].count}"}
    Rails.logger.info {"#{__FILE__}:#{__LINE__} index action end"}
  end

  def new
    Rails.logger.info {"#{__FILE__}:#{__LINE__} new action start"}
    Rails.logger.info {"#{__FILE__}:#{__LINE__} params : #{params}"}
    params[:username] = params[:user][:username]
    params[:password] = params[:user][:password]
    User.new.save_user(params)
    Rails.logger.info {"#{__FILE__}:#{__LINE__} new action end"}
  end

  def login
    Rails.logger.info {"#{__FILE__}:#{__LINE__} login action start"}
    Rails.logger.info {"#{__FILE__}:#{__LINE__} params : #{params}"}
    params[:username] = params[:user][:username]
    params[:password] = params[:user][:password]
    User.new.user_login(params)
    Rails.logger.info {"#{__FILE__}: #{__LINE__} login action end"}
  end
end

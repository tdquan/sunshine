class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :welcome_step1, :welcome_step2, :create]
  def home
  end

  def welcome_step1
    @temp_user=User.new
  end

  def create
    @temp_user=User.create(params[:address])
    redirect_to welcome_step2_path
  end

  def welcome_step2
    @temp_user=User.new
  end



end

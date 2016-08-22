class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @user = User.new
  end

  # def welcome_catch
  # end

  # def welcome_step0
  #   @user=User.new
  # end

  # def create_step0
  #   session[:current_user_first_name] = params[:user][:first_name]
  #   redirect_to welcome_step1_path
  # end

  # def welcome_step1
  #   @user=User.new
  #   @first_name= session[:current_user_first_name]
  # end

  def create_step1
    session[:current_user_address] = params[:user][:address]
    redirect_to welcome_step2_path
  end

  def welcome_step2

    # email = "a#{User.last.email}"
    # user = User.create(first_name: session[:current_user_first_name], address: session[:current_user_address], password: "123456", email: email)
    # sign_in(user)


    @solar_panels = SolarPanel.near(session[:current_user_address], 1)
    @consumers = User.all.near(session[:current_user_address], 1).select { |user| !user.is_producer? }

    @participants = (@solar_panels + @consumers).length

  end

    def welcome_step3_rent
      @user=current_user
      session[:profile] = "rent"
    end

    def create_step3
      current_user[:email] = params[:user][:email]
      redirect_to welcome_step4_rent_path
    end

    def welcome_step4_rent
      @solar_panels = SolarPanel.near(session[:current_user_address], 1)
      @best_panel = @solar_panels.last
    end

    def welcome_step3_own
      session[:profile] = "own"
    end




    # @hash2 = Gmaps4rails.build_markers(@users) do |user, marker|
    #   marker.lat user.latitude
    #   marker.lng user.longitude
    #   marker.infowindow render_to_string(partial: "/solar_panels/map_box", locals: { user: user })

    # end




end

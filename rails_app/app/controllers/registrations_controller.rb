class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    @user = User.new(new_user)
    @user.password = (0...2).map { (97 + rand(26)).chr }.join + Random.rand(9999999).to_s + (65 + rand(26)).chr
    if @user.save
      flash[:notice] = "You have signed up successfully. check your email for password."
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def update
    super
  end

  private
  def new_user
    params.required(:user).permit(:email)
  end

end

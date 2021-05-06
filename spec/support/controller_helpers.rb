module ControllerHelpers
  def sign_in(user)
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end
end

# function provided from stack overflow user: Taimoor Changaiz
# at https://stackoverflow.com/questions/10121835/how-do-i-simulate-a-login-with-rspec

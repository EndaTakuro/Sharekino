class Members::SessionsController < Devise::SessionsController
  def new_guest
    member = Member.guest
    sign_in member
    redirect_to movies_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
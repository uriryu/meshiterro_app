class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    @post_images = @user.post_images.page(params[:page])
    #@post_image.userは特定の投稿画像(@post_image)に紐づいたユーザーの情報を取得。投稿画像に対してユーザは1人なので、取得データは一つ.
    #@user.post_imagesはユーザーが投稿した投稿・画像すべてを取得.
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # user_paramsで下のストロングパラメータを呼び出し、マスアサインメント脆弱性を防ぐ。なんでもかんでも保存されないようにする!
    redirect_to user_path(@user.id)
    # user_pathでShowのurl, (@user.id)でUser.findで探した中のidページを(引数)で持ってくる
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
    # まずはparamsにデータが入る。requireでモデル名を指定し、送信されたデータから絞り込む。permitで絞り込まれたデータから、保存を許可するカラムを指定する。
  end
end

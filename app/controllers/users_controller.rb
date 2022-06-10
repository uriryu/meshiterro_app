class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
    #@post_image.userは特定の投稿画像(@post_image)に紐づいたユーザーの情報を取得。投稿画像に対してユーザは1人なので、取得データは一つ.
    #@user.post_imagesはユーザーが投稿した投稿・画像すべてを取得.
  end

  def edit
  end
end

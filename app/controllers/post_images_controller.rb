class PostImagesController < ApplicationController

	# 画像投稿、画面表示
	def new
		@post_image = PostImage.new
	end

	# 投稿画像データの保存
	def create
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		if @post_image.save
		   redirect_to post_images_path
		else
			render :new #同じコントローラないの別のアクションのビューを表示する。
		end
	end

	# 投稿画像リスト表示画面
	def index
		@post_images = PostImage.page(params[:page]).reverse_order
	end

	# 投稿画像詳細表示画面
	def show
		@post_image = PostImage.find(params[:id])
		@post_comment = PostComment.new
	end

	# 投稿削除機能
	def destroy
		@post_image = PostImage.find(params[:id])
		@post_image.destroy
		redirect_to post_images_path
	end

	# 投稿データのストロングパラメータ
	private
	def post_image_params
		params.require(:post_image).permit(:shop_name, :image, :caption)
	end

end

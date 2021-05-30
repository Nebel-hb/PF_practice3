class PostsController < ApplicationController

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      @post.create_notification_comment!(current_user, @comment.id)#通知
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

def index
    @tag_list = Tag.all              #ビューでタグ一覧を表示するために全取得。
    @posts = Post.all                #ビューで投稿一覧を表示するために全取得。
    @post = current_user.posts.new   #ビューのform_withのmodelに使う。
end

def show
    @post = Post.find(params[:id])  #クリックした投稿を取得。
    @post_tags = @post.tags         #そのクリックした投稿に紐付けられているタグの取得。  
    # @comment = Comment.new
    @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
    @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得

end

def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @posts = @tag.posts.all           #クリックしたタグに紐付けられた投稿を全て表示
end

 private
   def post_params
     params.require(:post).permit(:content)
   end
end

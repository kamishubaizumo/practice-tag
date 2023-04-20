class TagsController < ApplicationController
  def index
    @tags = Ttag.all
    @tag = Ttag.new
  end

  def create
   #一度に複数を登録する
   tags = tag_params[:tag_name].split(" ")

    tags.each do |tag|

       #create(カラム名: ブロック変数)

       #find_or_create_by 同じ値が存在する場合、既存のレコードを返し
       #存在しない場合には新しいレコードを作成する
      Ttag.find_or_create_by(tag_name: tag)
    end
   redirect_to tags_path
  end



  def destroy
    @tag = Ttag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end


  private

  def tag_params
    params.require(:ttag).permit(:tag_name)
  end

end

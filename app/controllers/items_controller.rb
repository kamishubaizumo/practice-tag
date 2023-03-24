class ItemsController < ApplicationController


  def index
    @items = Item.all
    @tag_list = Ttag.all

  end

  def show
    @item = Item.find(params[:id])
    @item_tags = @item.ttags
  end


  def new
    @item = Item.new
    @tag = Ttag.new
    @tag_list = Ttag.all
  end

  def create
   @item = Item.new

   #@item.name
   @item.name = params[:item][:name]
   @item.item_text = params[:item][:item_text]

   #ビューから取ってきたものを拾ってきている
   #split(nil)は非推奨らしいので、半角スペース
   tag_list = params[:item][:tag_name].split(" ")

    if @item.save!
      @item.save_tag(tag_list)
      redirect_to items_path
    else
      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
    #pluck :tag_nameというカラムの値を取得する
    @tags = @item.ttags.pluck(:tag_name).join(" ")
    @tag_list = Ttag.all

  end

  def update
    @item = Item.find(params[:id])
    #フォームから送信されたタグ名のリスト
    tag_list = params[:item][:tag_name].split(" ")

    if @item.update(item_params)
      #save_tagitemモデルで定義
       @item.save_tag(tag_list)
       redirect_to item_path(@item.id)
    else
       redirect_to :edit
    end

  end

  def destroy

    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path

  end


   def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Ttag.all
      #検索されたタグを受け取る
    @tag = Ttag.find(params[:ttag_id])
    #検索されたタグに紐づく投稿を表示
    #byebug
    @items = @tag.items.where(params[:id])
   end



  private

  def item_params
    params.require(:item).permit(:name, :item_text)
  end


end

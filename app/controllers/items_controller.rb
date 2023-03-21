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
    @tags = Ttag.all


  end

  def create
   @item = Item.new(item_params)
   tag_list = params[:item][:tag_name].split(nil)
    if @item.save
      @item.save_tag(tag_list)
      redirect_to items_path
    else
      redirect_to new_item_path
    end


  end

  def edit
    @item = Item.find(params[:id])
    @tags = @item.ttags.pluck(:tag_name)



    @tag_list = Ttag.all


  end

  def update
  end

  def destroy
  end


  private

  def item_params
    params.require(:item).permit(:name, :item_text)
  end


end

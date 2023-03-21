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
   #byebug
   @item = Item.new
   @item.name = params[:item][:name]
   @item.item_text = params[:item][:item_text]
   tag_list = params[:item][:tag_name].split(nil)
    if @item.save!
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
    @item = Item.find(params[:id])
    tag_list = params[:item][:name].split(nil)


    if @item.update(item_params)
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


  private

  def item_params
    params.require(:item).permit(:name, :item_text)
  end


end

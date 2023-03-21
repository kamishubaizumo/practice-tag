class TagsController < ApplicationController
  def index
    @tags = Ttag.all
    @tag = Ttag.new
  end

  def show
  end

  def create
   @tag = Ttag.new(tag_params)
   @tag.save
   redirect_to tags_path
  end

  def edit
  end

  def update
  end


  private

  def tag_params
    params.require(:ttag).permit(:tag_name)
  end

end

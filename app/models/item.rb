class Item < ApplicationRecord

  has_many :item_tags, dependent: :destroy
  has_many :ttags, through: :item_tags




  #編集するとき、タグの入れ替えをする。
  def save_tag(sent_tags)
    unless sent_tags.empty?
      self.item_tags.destroy_all
  
      sent_tags.each do |new|
        new_post_tag = Ttag.find_or_create_by(tag_name: new)
        self.ttags << new_post_tag
      end
    end
  end










end

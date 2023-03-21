class Item < ApplicationRecord

  has_many :item_tags, dependent: :destroy
  has_many :ttags, through: :item_tags

  validates :name,:item_text, presence: true



  #編集するとき、タグの入れ替えをする。
  def save_tag(sent_tags)
    unless sent_tags.empty?
      self.item_tags.destroy_all

      sent_tags.each do |new|
        # Ttag.find_or_create_by(tag_name: new)
        # self.ttags << new_post_tag
        self.item_tags.find_or_create_by(ttag_id: Ttag.find_or_create_by(tag_name: new).id)
      end
    end
  end










end

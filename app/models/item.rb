class Item < ApplicationRecord

  has_many :item_tags, dependent: :destroy
  has_many :ttags, through: :item_tags

  validates :name,:item_text, presence: true



  #編集するとき、タグの入れ替えをする。
    def save_tag(sent_tags)
      unless sent_tags.empty?
        self.item_tags.destroy_all

        sent_tags.each do |new|

          #find_or_create_by 同じ値が存在している場合、既存の値を返す
          #存在しない場合、新しく作成される
          new_post_tag = Ttag.find_or_create_by(tag_name: new)

          #include?で　アイテムにすでに同じタグが関連付けられているかどうかをチェックし、
          #それがない場合にのみ、新しいタグをアイテムに関連付けする
          unless self.ttags.include?(new_post_tag)
            #<<演算子 新しいタグがアイテムに関連付けられ、データベースに保存されます。
            self.ttags << new_post_tag
          end
        end
      end
    end





end

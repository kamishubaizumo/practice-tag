# 複数タグ登録の実験

## item投稿時にタグもフォームで新規、あるいは既存のタグを選んで投稿
## itemを投稿するのと同時に、タグも投稿されるイメージ。
### tagを複数選択できるようにする。タグの新規、既存を選べるようにしたい。

## 複数タグをつけて投稿できる。
## アイテムのタグをクリックすると、そのタグがついたアイテムが一覧表示される


### アイテム投稿ページにタグを一覧表示させ、
- そのタグをクリックするとフォームに自動で入力されるようにしたい。



- 作成されたタグはTtagモデルに格納。
- 新規のタグは直打ちで登録
- 既存のタグをクリックして、追加できるようにしたい



- ItemモデルはItem_tagをもっている

- 中間テーブル　Item_tag

- Ttagモデルは、Item_tagを持っている

## アイテムを編集するとき、タグを追加したり、削除できるようにする。


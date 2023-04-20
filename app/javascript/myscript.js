// chatGPT凄すぎるだろ。


document.addEventListener('turbolinks:load', () => {
  // テキストボックスを取得
  const tagInput = document.querySelector('input[name="item[tag_name]"]');

  // タグをクリックした時の処理
  const tagLinks = document.querySelectorAll('.tag-link');
  tagLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      // リンクのデフォルト動作を無効化
      e.preventDefault();
      // テキストボックスの内容にタグを追加
      const clickedTag = e.target.innerText.trim();
      if (tagInput.value) {
        tagInput.value = `${tagInput.value} ${clickedTag}`;
      } else {
        tagInput.value = clickedTag;
      }
    });
  });


   const clearButton = document.querySelector('#clear-button');

    // クリアボタンをクリックした時の処理
    clearButton.addEventListener('click', (e) => {
    // テキストボックスを空にする
    tagInput.value = '';
  });

});



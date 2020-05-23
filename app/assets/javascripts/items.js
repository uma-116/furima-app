$(document).on('turbolinks:load', ()=> {
  //投稿枚数制限するために、変数を定義
  let items_images_limit = 10;

  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][img]"
                    id="item_images_attributes_${index}_img"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  $('#image-box').on('change', '.js-file', function(e) {
  
    // 投稿枚数制限
    if ($(".js-file_group").length >= items_images_limit) {
      alert("これ以上画像投稿できません");
      return false;
    }
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));

    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
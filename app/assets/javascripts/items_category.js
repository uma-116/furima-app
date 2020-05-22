$(function () {

  function buildCategoryForm(children) {       // ④カテゴリのフォームを組み立ててappendする。
    var options = ``;                          // buildOption関数でこれを組み立てる
    children.forEach(function (child) {        // カテゴリを一つずつ渡してoptionタグを一つずつ組み立てていく。
      options += buildOption(child);
    });
    var blank = "選択してください";
    var html = `
                <select class="content__main__item-info-box__category" name="item[category_id]" class="select-category" id="jsChildren_id">
                <option value="">${blank}</option>
                  ${options}
                </select>
                `
    return html;
  }

  function buildOption(child) {                // ④渡されてきたデータを使ってoptionタグを組み立てる。
    var option = `<option value="${child.id}">${child.name}</option>`
    return option;
  }
  $(document).on('turbolinks:load', function () {
    $('#item_category_id').change(function () {      // ①セレクトボックスが切り替わったら発火
      let parent = $(this).val()
      $.ajax({                                       // ②リクエストを送る
        url: "/category/set_children",
        type: 'GET',
        data: { parent_id: parent },
        dataType: "json"
      })
        .done(function (children) {                  // ③html追加
          var html = buildCategoryForm(children)
          $('.jsCategory').append(html);
        })
    })
  });

  $(document).on('change','#jsChildren_id', function () {
    let child = $(this).val();
    $.ajax({
      url: "/category/set_grandchildren",
      type: 'GET',
      data: { child_id: child },
      dataType: "json"
    })
      .done(function (grandchildren) {
        var html = buildCategoryForm2(grandchildren)
        $('.jsCategory').append(html);
      })
  });

    function buildCategoryForm2(grandchildren) {
        var options = ``;
        grandchildren.forEach(function (grandchild) {
          options += buildOption2(grandchild);
        });
        var blank = "選択してください";
        var html = `
                    <select class="content__main__item-info-box__category" name="item[category_id]" class="select-category" id="jsGrandchildren_id">
                    <option value="">${blank}</option>
                      ${options}
                    </select>
                    `
        return html;
    }
  
    function buildOption2(grandchild) {
      var option = `<option value="${grandchild.id}">${grandchild.name}</option>`
      return option;
      }
});


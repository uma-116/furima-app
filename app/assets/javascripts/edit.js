$(function(){
  $(document).on("click", '.update-box', function() {
    let id = $(this).data('index')
    $(`#item_images_attributes_${id}_img`).trigger('click');
    $(`#item_images_attributes_${id}_img`).change(function(){
      $(`#image-box__${id}`).replaceWith('<div class="image-icon"><i class="fas fa-camera"><br><br>画像追加済み</i></div>');
    });
  });

  $(document).on("click", '.delete-box', function() {
    let id = $(this).data('index')
    $(`#preview-box__${id}`).remove();
    $(`#item_images_attributes_${id}__destroy`).prop('checked', true);
  });

  $(document).on("click", '.add-delete-box', function() {
    let id = $(this).data('index')
    $(`#preview-box__${id}`).remove();
    $(`#item_images_attributes_${id}__destroy`).prop('checked', true);
  });

  $(document).on('click', '.add-box', function() {
    let id = $(this).data('index')
    $(`#item_images_attributes_${id}_img`).change(function(){
      $(`#add-box__${id}`).replaceWith(`<div class="preview-box" data-index="${id}" id="preview-box__${id}"><div class="upper-box"><div class="image-icon"><i class="fas fa-camera"><br><br>画像追加済み</i></div></div><div class="lower-box"><div class="add-delete-box" data-index="${id}" id="delete-box__${id}"><span class="delete-btn">削除</span></div></div></div>`);
      var count = $('.preview-box').length
      if(count <= 9)
        $('#preview').append(`<label class="add-box" data-index="${id+1}" for="item_images_attributes_${id+1}_img" id="add-box__${id+1}"><i class="fas fa-plus"><br><br>画像を追加</i></label>`)
        $('#image-box').append(`<div class="add_group" data-index="${id+1}"><input class="hidden-field" type="file" name="item[images_attributes][${id+1}][img]" id="item_images_attributes_${id+1}_img"><input name="item[images_attributes][${id+1}][_destroy]" type="hidden" value="0"><input class="hidden-destroy" type="checkbox" value="${id+1}" name="item[images_attributes][${id+1}][_destroy]" id="item_images_attributes_${id+1}__destroy"></div>`);
    });
  });
});
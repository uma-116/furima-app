$(function(){
  function buildHTML(comment){
    var html = `<div class="comment__index__content">
                  <div class="comment__index__content__info">
                    <p>
                      <strong>
                      </strong>
                    </p>
                    <div class="comment__index__content__info__user">
                      <strong>
                        <a href="#">${comment.nickname}</a>
                      </strong>
                    </div>
                    <strong>
                      <div class="comment__index__content__info__date">
                      ${comment.created_at}
                      </div>
                    </strong>
                    <p></p>
                  </div>
                  <div class="comment__index__content__text">
                  ${comment.comment}
                  </div>
                </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comment__index').prepend(html);
      $('.comment__form-wrapper__form__text').val('');
      $('.comment__form-wrapper__form__btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});



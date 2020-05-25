$( document ).on( 'input', '#price-result', function(){
  var inputValue = $( this ).val();
  var fee = inputValue /10;
  var round_up_fee = Math.floor( fee ) ;
  var result = inputValue - round_up_fee;
  var round_up_fee_comma = String(round_up_fee).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' );
  var result_comma = String(result).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' );
  $('.sall-fee').html(round_up_fee_comma);
  $('.sall-fee').append('円');
  $('.profit').html(result_comma);
  $('.profit').append('円');
});
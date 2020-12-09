$(function(){
  $('.sell-box__item__description-form').on('input', function(){
    let cnt = $(this).val().length;
    $('.numerator').text(cnt);
  });
  $('.sell-box__item__description-form').trigger('input');
});


$(function() {
  $('.sell-box__price-area__form').on('input', function() {
    let val = $(this).val();
    $('.sell-box__commission__sum').text(Math.floor($(this).val() * 0.1));
    $('.sell-box__profit__sum').text(Math.ceil($(this).val() * 0.9));
    $('.sell-box__commission__sum').prepend('¥ ')
    $('.sell-box__profit__sum').prepend('¥ ')
    if(val == 0 ) {
    $('.sell-box__commission__sum').text('ー');
    $('.sell-box__profit__sum').text('ー');
    }
  });
  $('.sell-box__price-area__form').trigger('input');
});
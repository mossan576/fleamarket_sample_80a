$(function(){
  $('.sell-box__item__description-form').on('input', function(){
      var cnt = $(this).val().length;
      $('.numerator').text(cnt);
  });
  $('.sell-box__item__description-form').trigger('input');
});
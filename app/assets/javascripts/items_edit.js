// $(function(){
// });

// $(function(){
//   $('.Form').on('submit', function(e){
//     e.preventDefault()
//     console.log("hoge")
//   });
// });

$(function() {
  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    let items_edit = $('.js-form__text-field').val();
    console.log(items_edit);
  });
});
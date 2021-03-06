$(function(){
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  length = $('.item_images_length').val();
  $('#item_images').change(function(){
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      if(dataBox.items.length > (20 - length) ){
        return false;
      }
      file_field.files = dataBox.files
      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);
      if (num == 10){
        $('#image-box__container').css('display', 'none')
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='item-image' data-image="${file.name}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="80" >
                      </div>
                    </div>
                    <div class='item-image__operation'>
                      <div class='item-image__operation--delete'>削除</div>
                    </div>
                  </div>`
        $('#image-box__container').before(html);
      };
      $('#image-box__container').attr('class', `item-num-${num}`)
    });
  });

  $(document).on("click", '.item-image__operation--delete', function(){
    var target_image = $(this).parent().parent()
    var target_name = $(target_image).data('image')
    if(file_field.files.length==1){
      $('input[type=file]').val(null)
      dataBox.clearData();
      console.log(dataBox)
    }else{
      $.each(file_field.files, function(i,input){
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      file_field.files = dataBox.files
    }
    target_image.remove()
    var num = $('.item-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `item-num-${num}`)
  })

  $(document).on("click", '.edit-btn', function(){
    const index = $(this).data("index");
    $(`#item_replace_image_${index}`).trigger("click");
  })
  
  $(document).on("change", `input[type="file"]`, function(e){
    const index = $(this).data("index");
    $(`#item_replace_images_${index}`).prop('checked', true);
    $(`[data-index="${index}"]`).css({'background': '#31A9EE', 'color' : '#ffffff' })
    if ($(`#item_image_ids_${index}`).prop('checked')){
      $(`#item_image_ids_${index}`).prop('checked', false);
    }
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(){
      var image = this.result;
      $(`#preview_${index}`).attr('src', `${image}`);
    };
  });
  
  $(document).on("click", `input[type="checkbox"]`,function(e){
    const value = $(this).val();
    if ( $(`#item_replace_images_${value}`).prop('checked') ){
      $(`#item_replace_images_${value}`).prop('checked', false);
      $(`[data-index="${value}"]`).css({'background-color': '#ffffff', 'color' : 'blue' })
    }
  });

});

$(function(){
  $('#image_field').on('change', function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = (function(e){
      var ar = new Uint8Array(reader.result);  
      $(".new-post__form__image--box").append($("<img class = photo_img>").attr("src", e.target.result));
  })
  reader.readAsDataURL(file);
  })
  $('#image_field').on('click', function(){
    $('#image_field').val('');
    $('.new-post__form__image--box').empty();
  })
});
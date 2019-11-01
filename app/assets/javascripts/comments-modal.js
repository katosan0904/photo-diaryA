$(function(){
  $('.comment-trash-icon').on('click',function(){
    $('.comment-modal').fadeIn();
    // 画面をスクロールさせない処理
    $('body').css("overflow", "hidden");
    return false;
  });
  $('.comment-modal__window--cancel').on('click',function(){
    $('.comment-modal').fadeOut();
    $('body').css("overflow", "scroll");
  });
  $('.comment-modal__window--ok').on('click', function(){
    $('.modal').fadeOut();
  });
});
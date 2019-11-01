$(function(){
  $('.trash-icon').on('click',function(){
    $('.post-modal').fadeIn();
    // 画面をスクロールさせない処理
    $('body').css("overflow", "hidden");
    return false;
  });
  $('.post-modal__window--cancel').on('click',function(){
    $('.post-modal').fadeOut();
    $('body').css("overflow", "scroll");
  });
  $('.post-modal__window--ok').on('click', function(){
    $('.modal').fadeOut();
  });
});
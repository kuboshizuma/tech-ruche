$(function(){
  $(document).on('ajax:complete', '.fa-bu', function(event, ajax, status) {
    $(this).removeClass('fa-bu').addClass('fa-bu-o');
    $(".fa_button", this).html('お気に入りに追加する<i class="fa fa-star-o"></i>');
  });
  $(document).on('ajax:complete', '.fa-bu-o', function(event, ajax, status) {
    $(this).removeClass('fa-bu-o').addClass('fa-bu');
    $(".fa_button", this).html('お気に入り済み<i class="fa fa-star"></i>');
  });
});

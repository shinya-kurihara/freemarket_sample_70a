$(function() {
    $(".header__box__navi__left__category").hover(function() {
    $("ul.category1").toggle();
    });
    $(".header__box__navi__left__category li ul").hide();
    $(".header__box__navi__left__category li").hover(function() {
        $(">ul:not(:animated)", this).stop(true, true).slideDown("fast");
        $(">a", this).addClass("active");
    }, function() {
        $(">ul:not(:animated)", this).stop(true, true).slideUp("fast");
        $(">a", this).removeClass("active");
  });
});
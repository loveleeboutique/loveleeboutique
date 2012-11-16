$(window).load(function () {
    $('img.typekit-badge').hide();
});

(function ($) {
    $(function () {
        $('a.privacy, a.refund').click(function () {
            $('.privacy_info').dialog({
                resizable:false,
                modal:true,
                draggable:false,
                width:505,
                height:741
            });
            return false;
        });
        $.ajaxSettings.dataType = 'json';
        $('ul#main-nav-bar.sf-menu').superfish();
        $('.shop ul.sf-menu').superfish();
        $('div.slider').carousel({
            pagination:true,
            autoSlide:true,
            autoSlideInterval:5000,
            animSpeed: "slow",
            loop: true
        });

        $('.shop ul li:has(ul)').css({'background':'url("/assets/lovelee_arrow_right.png") 90px 7px no-repeat white', 'background-size':'7px'});
    });
})(jQuery);



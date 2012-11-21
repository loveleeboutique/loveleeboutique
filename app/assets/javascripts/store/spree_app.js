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
        $('ul#main-nav-bar li ul li:last-child').css({'border-bottom':'1px solid #ffaeb9'});
        $('.shop ul.sf-menu').superfish();
        $('div.slider').carousel({
            pagination:true,
            autoSlide:true,
            autoSlideInterval:5000,
            animSpeed:"slow",
            loop:true
        });

        $('.shop ul li:has(ul)').css({'background':'url("/assets/lovelee_arrow_right.png") 90px 7px no-repeat white', 'background-size':'7px'});
        $('.products #main-image').zoom();
        $('.products #main-image img').wrap('<span style="display:inline-block"></span>')
            .css('display', 'block')
            .parent()
            .zoom();

        $('#product-variants span:first').addClass('selected');
        $('#product-variants span').click(function(){
           $('#product-variants span').removeClass('selected');
           $(this).addClass('selected');
        });

        $('#product-variants ul li:first').css({'padding-left':'0'});
        $('.products.show .out-of-stock').parent().hide()
    });
})(jQuery);



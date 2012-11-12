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
        $('ul.sf-menu').superfish();
        $('div.slider').carousel({
            pagination:true,
            autoSlide:true,
            autoSlideInterval:5000,
            animSpeed: "slow",
            loop: true
        });
    });
})(jQuery);



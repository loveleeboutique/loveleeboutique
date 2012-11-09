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
    });
})(jQuery);


(function ($) {
    $(function () {
        $.ajaxSettings.dataType = 'json';

        $('.head ul.navigation').addClass("sf-menu");
        $('.head ul.navigation').superfish();
    })
})

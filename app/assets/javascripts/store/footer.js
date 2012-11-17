$(window).bind("load resize", function () {
    var browserWindowHeight = $(window).height();
    var headNavHeight = $('.header').outerHeight(true);
    var containerBeautySAGE = $('.container').outerHeight(true);
    var footerHeight = $('#footer').outerHeight(true);
    var totalHeight = headNavHeight + containerBeautySAGE + footerHeight;
    if (browserWindowHeight > totalHeight) {
        $('#footer').css({'position':'absolute', 'bottom':0})

    }
    else {
        $('#footer').css({'position':'relative'})
    }
});
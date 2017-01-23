
var adjustHero = function() {
  var maxHeight = 1024;
  var maxWidth = 1440;
  var height = $('.hero-photo').height();
  var width = $('.hero-photo').width();
  var screenRatio = height / width;
  var imageRatio = maxHeight / maxWidth;
  var imageRatio, imageHeight,imageWidth, logoOffset, logoFontSize;

  if(width > maxWidth && height > maxHeight) {
    imageWidth = maxWidth;
    imageHeight = maxHeight;
  } else if (width < maxWidth && (height > maxHeight || imageRatio < screenRatio)) {
    imageWidth = width;
    imageHeight = width * (1024.0 / 1440);
  } else {
    imageHeight = height;
    imageWidth = height * (1440 / 1024.0);

  }

  if(imageHeight < height && imageWidth !== maxWidth) {
    logoOffset = 5 + width / 12.0;
    logoFontSize = 40 * (width / maxWidth);
  } else {
    logoOffset = 90 + (width - imageWidth) / 2.0;
    logoFontSize = 40;
  }

  logoFontSize = Math.max(logoFontSize, 18);
  var footerHeight = height - imageHeight;
  $('.hero-footer').css({height: footerHeight + 1});
  $('.hero-logo').css({left: logoOffset, 'font-size': logoFontSize + 'px'});
  $('.hero-logo .the-arts').css({'font-size': (logoFontSize / 2) + 'px'});
};

$(function() {
  if($('.hero-logo').is('*')) {
    adjustHero();
    $('.hero-footer').on('resizeme.zf.trigger', adjustHero);
    var $input = $('.zipcode-search');

    $input.on('focus', function() {
      $('.hero-photo').addClass('is-opaque');
    }).on('blur', function() {
      $('.hero-photo').removeClass('is-opaque');
    });

    var $heroPhoto = $('.hero-photo');
    var $opacityLayer = $('.opacity-layer');
    var $preHover = $('.pre-hover');
    var $postHover = $('.post-hover');
    ReactiveListener.add($input[0], {
      'Pointer2d': [{
        callback: function(opts) {
          var dist = opts.dist['Pointer2d'];
          if(dist > 300) {
            $opacityLayer.css({'opacity': 0});
            $preHover.show();
            $postHover.hide();
          } else if(dist > 30) {
            $opacityLayer.css({'opacity': (1 - (dist / 300))});
            $preHover.show();
            $postHover.hide();
            $heroPhoto.removeClass('show-placeholder');
          } else {
            $opacityLayer.css({'opacity': 1});
            $preHover.hide();
            $postHover.show();
            $heroPhoto.addClass('show-placeholder');
          }
        }
      }]
    });
    ReactiveListener.start();
  }
});

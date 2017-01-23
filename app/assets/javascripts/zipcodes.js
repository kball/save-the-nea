
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
  adjustHero();
  $('.hero-footer').on('resizeme.zf.trigger', adjustHero);

  $('.zipcode-search').on('focus', function() {
    $('.hero-photo').addClass('is-opaque');
  });

  $('.zipcode-search').on('blur', function() {
    $('.hero-photo').removeClass('is-opaque');
  });
});

(function () {
  $('.clone-example-1')
    .html('$ git clone ' + window.location.protocol + '//<span class="highlight"><a href="#" class="login">login</a></span>:@' + window.location.host);

  var widget = new Auth0Widget(window.auth0_settings);

  $('.login').on('click', function () {
    widget.signin();
  });

  var result = widget.parseHash(window.location.hash);

  if (!result || result.error || !result.id_token) {
    $('.authenticated').hide();
    $('.anonymous').show();
    return;
  }

  var token = result.id_token;

  $('.token').html(token);
  $('.clone-example-2')
    .html('git clone ' + window.location.protocol + '//<span class="highlight">' + token + '</span>:@' + window.location.host);

  $('.code').on('click', function () {
    var range;
    if (document.selection) {
      range = document.body.createTextRange();
      range.moveToElementText(this);
      range.select();
    } else if (window.getSelection) {
      range = document.createRange();
      range.selectNode(this);
      window.getSelection().addRange(range);
    }
  });

  $('.authenticated').show();
  $('.anonymous').hide();

})();
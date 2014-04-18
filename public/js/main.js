var hash = window.location.hash;
var token = /id_token=(.*)$/ig.exec(hash.split('&')[1])[1];
var decoded = jwt_decode(token);

$('.name').text(decoded.name);

$('.token').html(token);
$('.clone-example')
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


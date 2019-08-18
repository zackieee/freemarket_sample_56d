$(function(){
  var menu = $('.aaaa'), // スライドインするメニューを指定
      menuBtn = $('arow'), // メニューボタンを指定
      body = $(document.body),    
      menuWidth = menu.outerWidth();                
       
      // メニューボタンをクリックした時の動き
      menuBtn.on('click', function(){
      // body に open クラスを付与する
      body.toggleClass('open');
          if(body.hasClass('open')){
              // open クラスが body についていたらメニューをスライドインする
              body.animate({'left' : menuWidth }, 300);            
              menu.animate({'left' : 0 }, 300);                    
          } else {
              // open クラスが body についていなかったらスライドアウトする
              menu.animate({'left' : -menuWidth }, 300);
              body.animate({'left' : 0 }, 300);            
          }             
      });
  });    

$(function() {

  function buildHTML(url){
    var html = `<div class="sell-main__contents__content__item__images--already">
                  <div class="sell-main__contents__content__item__images--already__blocks">
                    <img src="${url}" width="120" height="130" class="sell-main__contents__content__item__images--already__blocks__image">
                    <div class="sell-main__contents__content__item__images--already__blocks__block">
                      <a class="sell-main__contents__content__item__images--already__blocks__block--edit">編集</a>
                      <a href="" class="sell-main__contents__content__item__images--already__blocks__block--delete">削除</a>
                    </div>
                  </div>
                </div>`;
    return html;
  }

  $(".hidden").on("change", function(e) {
    var file = e.target.files[0];
    var blobUrl = window.URL.createObjectURL(file);
    var html = buildHTML(blobUrl);
    $(".sell-main__contents__content__item__images").prepend(html);
  });

  $(document).on("click", ".sell-main__contents__content__item__images--already__blocks__block--delete", function(){
    $(this).remove();
  });
  
  // new画面で使う
  // 価格を価格を打ち込んだ時に、手数料と販売利益を表示
  $(".dropdown--right").on("keyup", function(){
    var price  = $(this).val();
    var fee    = Math.floor( price / 10 );
    var profit = price - fee;
    if (price >= 300 && price <= 9999999) {
      $(".fee").text(fee);
      $(".profit").text(profit);
    }
    else {
      $(".fee").text("ー");
      $(".profit").text("ー");
    }
  });

  // edit画面で使う
  // 元々の手数料と販売利益を表示
  var price  = $(".dropdown--right").val();
  var fee    = Math.floor( price / 10 );
  var profit = price - fee;
  if (price.length != 0) {
    $(".fee").text(fee);
    $(".profit").text(profit);
  }

});
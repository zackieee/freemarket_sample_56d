$(function(){
  // active/close様のul作成
  function UlBuildHTML(){
    var html = `<ul id="trade-result-list">`
    return html;
  }

  // active/closeリスト描画用
  function ListBuildHTML(data,index){
    var html =`
              <li class="mypage__main__contents__content">
                <a href="/notifications/${data.id}/dispatcher">
                  <img class="mypage__main__contents__content__image" height="48px" width="48px" src="${data.image}">
                  <div class="mypage__main__contents__content__text">
                    ${data.name}
                    <div class="mypage__main__contents__content__time" id="checked-${index}">
                      <i class="far fa-sm fa-clock"></i>
                      <p>
                        <time datetime="${data.created_at}">${data.created_at}前</time>
                      </p>
                    </div>
                  </div>
                  <div class="mypage__main__contents__content__link-icon">
                    <i class="fas fa-lg fa-angle-right"></i>
                  </div>`
    return html;
  }

  // 一覧表示ボタン表示用
  function BtnBuildHTML(path){
    var html = `
              <div class="mypage__main__contents__content__btn" id="result-btn">
                <a href="${path}">
                  一覧を見る
                </a>
              </div>`
    return html;
  }

  // データが何も無い時用
  function NoneListBuildHTML(message){
    var html = `
              <div class="mypage__main__contents__content--none">
                <h3>
                  ${message}
                </h3>
              </div>`
    return html;
  }

  // Closeリストの表示
  $('#close-trade').on('click',function(e){
    // タブの切り替え
    $('#close-trade').addClass('selected-tab');
    $('#active-trade').removeClass('selected-tab');

    var result_all  = $('#trade-result-all');
    result_all.empty();
    $('#trade-result-btn').remove();    
    $.ajax({
      url:     '/trades/close_index_api',
      type:    "GET",
      dataType:'json',
    })
    .done(function(close_trades){
      if ( close_trades.length > 0 ){
        close_trades.forEach(function(trade,index){
          var ul_html = UlBuildHTML();
          result_all.append(ul_html);
          var result_list = $('#trade-result-list');
          // 5行までは繰り返す
          if(index <= 5){ 
            var html = ListBuildHTML(trade,index);
            result_list.append(html);
          }else if (index === 5){
            //一覧で見るボタン付加
            var path = '/trade/close_index';
            var html = BtnBuildHTML(path);
            result_all.append(html);
            return false;
          }else{
            return false;
          }
        });
      }else{
        //データがない場合は無いパネル出す
        var message = '過去の取引はありません'
        var html = NoneListBuildHTML(message);
        result_all.empty();
        result_all.append(html);
      }
    })
    .fail(function(){
      // 障害発生！！
    });
  });

  //Activeリストの再表示
  $('#active-trade').on('click',function(e){
    // タブの切り替え
    $('#close-trade').removeClass('selected-tab');
    $('#active-trade').addClass('selected-tab');

    var result_all  = $('#trade-result-all');
    result_all.empty();
    $('#trade-result-btn').remove();    
    $.ajax({
      url:     '/trades/active_index_api',
      type:    "GET",
      dataType:'json',
    })
    .done(function(active_trades){
      if ( active_trades.length > 0 ){
        active_trades.forEach(function(trade,index){
          var ul_html = UlBuildHTML();
          result_all.append(ul_html);
          var result_list = $('#trade-result-list');
          // 5行までは繰り返す
          if(index < 5){ 
            var html = ListBuildHTML(trade,index);
            result_list.append(html);
          }else if (index === 5){
            //一覧で見るボタン付加
            var path = '/trade/active_index'
            var html = BtnBuildHTML(path);
            result_all.append(html);
            return false;
          }else{
            return false;
          }
        });
      }else{
        //データがない場合は無いパネル出す
        var message ='取引中の商品はありません'
        var html = NoneListBuildHTML(message);
        result_all.empty();
        result_all.append(html);
      }
    })
    .fail(function(){
      // 障害発生！！
    });
  });
});
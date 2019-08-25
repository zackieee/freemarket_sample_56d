$(function(){
  // notice,todo用のul作成
  function UlBuildHTML(){
    var html = `<ul id="result-list">`
    return html;
  }

  // notification,todoリスト描画用
  function ListBuildHTML(data,index){
    var html =`
              <li class="mypage__main__contents__content">
                <a href="/notifications/${data.id}/dispatcher">
                  <img class="mypage__main__contents__content__image" height="48px" width="48px" src="${data.image}">
                  <div class="mypage__main__contents__content__text">
                    ${data.title}
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
  //未読マーク付加
  function CheckFlagBuildHTML(){
    var html = `<p class="user-main__contents__form__group__item--required">
                  未読
                </p>`
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

  // TODOリストの表示
  $('#todo-list').on('click',function(e){
    // タブの切り替え
    $('#todo-list').addClass('selected-tab');
    $('#notice-list').removeClass('selected-tab');

    var result_all  = $('#result-all');
    result_all.empty();
    $('#result-btn').remove();    
    $.ajax({
      url:     '/notifications/index_todo_api',
      type:    "GET",
      dataType:'json',
    })
    .done(function(todos){
      if ( todos.length > 0 ){
        todos.forEach(function(todo,index){
          var ul_html = UlBuildHTML();
          result_all.append(ul_html);
          var result_list = $('#result-list');
          // 5行までは繰り返す
          if(index <= 5){ 
            var html = ListBuildHTML(todo,index);
            result_list.append(html);
          }else if (index === 5){
            //一覧で見るボタン付加
            var path = '/notifications/index_todo';
            var html = BtnBuildHTML(path);
            result_all.append(html);
            return false;
          }else{
            return false;
          }
        });
      }else{
        //データがない場合は無いパネル出す
        var message = 'やることリストはありません'
        var html = NoneListBuildHTML(message);
        result_all.empty();
        result_all.append(html);
      }
    })
    .fail(function(){
      // 障害発生！！
    });
  });

  //お知らせの再表示
  $('#notice-list').on('click',function(e){
    // タブの切り替え
    $('#todo-list').removeClass('selected-tab');
    $('#notice-list').addClass('selected-tab');

    var result_all  = $('#result-all');
    result_all.empty();
    $('#result-btn').remove();
    
    $.ajax({
      url:     '/notifications/index_api',
      type:    "GET",
      dataType:'json',
    })
    .done(function(notices){

      if ( notices.length > 0 ){
        notices.forEach(function(notice,index){
          var ul_html = UlBuildHTML();
          result_all.append(ul_html);
          var result_list = $('#result-list');
          // 5行までは繰り返す
          if(index < 5){ 
            var html = ListBuildHTML(notice,index);
            result_list.append(html);
            if(!notice.checked){
              var html = CheckFlagBuildHTML();
              var check_flag  = $("#checked-" + index);
              check_flag.append(html);
            };
          }else if (index === 5){
            //一覧で見るボタン付加
            var path = '/notifications'
            var html = BtnBuildHTML(path);
            result_all.append(html);
            return false;
          }else{
            return false;
          }
        });
      }else{
        //データがない場合は無いパネル出す
        var message ='お知らせはありません'
        var html = NoneListBuildHTML(message);
        result_all.empty();
        result_all.append(html);
      }
    })
    .fail(function(){
      alert('データ取得に失敗しました');
    });
  });
});
$(function(){
  // ul作成
  function UlBuildHTML(){
    var html = `<ul id="rating-result-list">`
    return html;
  }

  // li作成
  function ListBuildHTML(data){
    var html = `<li class="rating__contents__content">
                  <a href="/users/${data.rater_id}/show_profile">
                    <img class="rating__contents__content__image" height="48px" width="48px" src="${data.rater_avatar}">
                    <div class="rating__contents__content__text">
                      <i class="fas ${data.rate}"></i>
                        ${data.stance}
                      <p>${data.rater_nickname}</p>
                      <p>${data.comment}</p>
                      <div class="rating__contents__content__text__time">
                        <i class="far fa-lg fa-clock"></i>
                        <p>${data.created_at}</p>
                      </div>
                    </div>
                    <div class="rating__contents__content__link-icon">
                      <i class="fas fa-lg fa-angle-right"></i>
                    </div>
                  </a>
                </li>`
    return html;
  }

  // データが何も無い時用
  function NoneListBuildHTML(message){
    var html = `
              <div class="rating__contents__none" id="rating-result-none">
                <h3>
                  ${message}
                </h3>
              </div>`
    return html;
  }
  
  //リスト表示
  $("[id^='rating-tab-']").on('click',function(e){
    var target = $(this).data('rating');
    // タブの切り替え
    // 現状のactiveタブを取得し、クラス削除
    $("[id^='rating-tab-']").removeClass('selected-tab');
    // clickされたタブにselected-tabクラスを追加
    $(this).addClass('selected-tab');
    $.ajax({
      url:     '/ratings/index_api',
      type:    "GET",
      data:     {rating: target},
      dataType:'json',
    })
    .done(function(list){
      // リストを空にする
      var result_all  = $('#rating-result-all');
      result_all.empty();

      // 取得データの状況によって表示切り替え
      if ( list.length > 0 ){
        //データがあった場合はリスト表示
        list.forEach(function(data,index){
          var ul_html = UlBuildHTML();
          result_all.append(ul_html);
          var result_list = $('#rating-result-list');
          var html = ListBuildHTML(data);
          result_list.append(html);
        });
      }else{
        //データがない場合は無いパネル出す
        var message ='評価はまだありません'
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
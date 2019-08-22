$(function() {

  function imageHTML(url, num){
    var html = `<div class="sell-main__contents__content__item__images--already">
                  <div class="sell-main__contents__content__item__images--already__blocks">
                    <img src="${url}" width="117" height="130" class="sell-main__contents__content__item__images--already__blocks__image">
                    <div class="sell-main__contents__content__item__images--already__blocks__block">
                      <p class="sell-main__contents__content__item__images--already__blocks__block--edit">編集</p>
                      <p class="sell-main__contents__content__item__images--already__blocks__block--delete" data-id="${num}">削除</p>
                    </div>
                  </div>
                </div>`;
    return html;
  };

  function fileHTML(num){
    var html =`<div class="sell-main__contents__content__item__images--upload" id="upload${num}">
                写真を選択
                <label class="sell-main__contents__content__item__images--upload--label" for="product_images_${num}">
                  <input multiple="multiple" class="hidden" data-image-id="${num}" type="file" name="product[images][]" id="product_images_${num}">
                </label>
               </div>`;
    return html;
  };

  var num = 1;

  $("#product_images_1").on("change", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var fileName = file.name
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload1").css("display", "none");
    var fileHtml = fileHTML(2);
    $(".sell-main__contents__content__item__images").append(fileHtml);
    num += 1;
  });
  
  // 本当はこれでいきたかった。。
  // if (num > 1) {
  //   $(document).on("change", "#product_images_" + num, function(e) {
  //     var file = e.target.files[0];
  //     var blobUrl = window.URL.createObjectURL(file);
  //     var html = imageHTML(blobUrl, num);
  //     $(".sell-main__contents__content__item__images").prepend(html);
  //     $("#upload" + String(num)).css("display", "none");
  //     num += 1;
  //     var fileHtml = fileHTML(num);
  //     $(".sell-main__contents__content__item__images").append(fileHtml);
  //   });
  // }

  $(document).on("change", "#product_images_2", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload" + String(num)).css("display", "none");
    num += 1;
    var fileHtml = fileHTML(num);
    $(".sell-main__contents__content__item__images").append(fileHtml);
  });

  $(document).on("change", "#product_images_3", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload" + String(num)).css("display", "none");
    num += 1;
    var fileHtml = fileHTML(num);
    $(".sell-main__contents__content__item__images").append(fileHtml);
  });

  $(document).on("change", "#product_images_4", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload" + String(num)).css("display", "none");
    num += 1;
    var fileHtml = fileHTML(num);
    $(".sell-main__contents__content__item__images").append(fileHtml);
  });

  $(document).on("change", "#product_images_5", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload" + String(num)).css("display", "none");
    num += 1;
    var fileHtml = fileHTML(num);
    $(".sell-main__contents__content__item__images").append(fileHtml);
  });

  $(document).on("change", "#product_images_6", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload" + String(num)).css("display", "none");
    num += 1;
    var fileHtml = fileHTML(num);
    $(".sell-main__contents__content__item__images").append(fileHtml);
  });

  $(document).on("change", "#product_images_7", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload" + String(num)).css("display", "none");
    num += 1;
    var fileHtml = fileHTML(num);
    $(".sell-main__contents__content__item__images").append(fileHtml);
  });

  $(document).on("change", "#product_images_8", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload" + String(num)).css("display", "none");
    num += 1;
    var fileHtml = fileHTML(num);
    $(".sell-main__contents__content__item__images").append(fileHtml);
  });

  $(document).on("change", "#product_images_9", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload" + String(num)).css("display", "none");
    num += 1;
    var fileHtml = fileHTML(num);
    $(".sell-main__contents__content__item__images").append(fileHtml);
  });

  $(document).on("change", "#product_images_10", function(e) {
    var files = e.target.files;
    $.each(files, function(index, file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl, num);
      $(".sell-main__contents__content__item__images").prepend(html);
    });
    $("#upload" + String(num)).css("display", "none");
    num += 1;
    var fileHtml = fileHTML(num);
    $(".sell-main__contents__content__item__images").append(fileHtml);
  });

  $(document).on("click", ".sell-main__contents__content__item__images--already__blocks__block--delete", function(){
    // プレビューを削除
    $(this).parents(".sell-main__contents__content__item__images--already").remove();
    // 削除した画像のdata-idを取得
    var dataId = $(this).data("id");
    // file_fieldごと削除
    $("#upload" + String(dataId)).remove();
    // $("#upload" + String(dataId)).css("display", "none");
  });

  $(document).on("click","#edit-delete", function(){
    // プレビューを削除
    $(this).parents(".sell-main__contents__content__item__images--already").css("display", "none");
  });
  
  // new画面で使う
  // 価格を価格を打ち込んだ時に、手数料と販売利益を表示
  $(".dropdown--right").on("keyup", function(){
    var price  = $(this).val();
    var fee    = Math.floor( price / 10 );
    var profit = price - fee;
    if (price >= 300 && price <= 9999999) {
      $(".fee").text(fee.toLocaleString());
      $(".profit").text(profit.toLocaleString());
    }
    else {
      $(".fee").text("ー");
      $(".profit").text("ー");
    }
  });

  // edit画面で使う
  // 元々の手数料と販売利益を表示
  $(window).on("load", function(){
    var pattern = /products\/\d+\/edit/;
    if (document.URL.match(pattern)){
      var price  = $(".dropdown--right").val();
      var fee    = Math.floor( price / 10 );
      var profit = price - fee;
      if (price.length != 0) {
        $(".fee").text(fee.toLocaleString());
        $(".profit").text(profit.toLocaleString());
      };
    }
  })

});
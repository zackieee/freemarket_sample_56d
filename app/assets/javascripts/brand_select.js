$(function(){

  function buildBOX(id,name){
    var brand_form =    `<label class="sell-main__contents__content__item" for="brand">
                          ブランド
                        </label>
                        <span class="sell-main__contents__content__item--optional">
                          任意
                        </span>
                        <input class="sell-main__contents__content__item__input" placeholder="シャネル" maxlength="40" size="40" type="text" name="product[brand_id]" id="product_brand_box" data-brand-id='${id}' value='${name}'></input>
                        <input type="hidden" name="product[brand_id]" value='${id}'></input>
                        <div id = brand_box__lists>
                          <ul class = "brand_box__list"></ul>
                        </div>`
    return brand_form;
  };

  function buildBRAND(brand){
    var brand_list = `<li class = brand_box__list__select data-brand-id='${brand.id}' data-brand-name='${brand.name}'>${brand.name}</li>`
    return brand_list;
  }

  //カテゴリ2つ目を選択するとブランド選択が出てくる
  $(document).on('change','#category_box_1', function(){
    $('#brand_box').empty();
    var id = '';
    var name = '';
    html = buildBOX(id,name);
    $("#brand_box").append(html);
  });

  $(document).on('keyup','#product_brand_box', function(){
    var input = $("#product_brand_box").val();
    if(input.length >= 2){
      $.ajax({
        type: "GET",
        url: "/products/get_brand",
        data: { keyword: input },
        dataType: "json"
      })
      .done(function(brands){
        $('.brand_box__list').empty();
        brands.forEach(function(brand){
          html = buildBRAND(brand);
          $(".brand_box__list").append(html);
        });
      })
      .fail(function(){
        alert("ブランド検索に失敗しました");
      })
    };
  });

  $(document).on('click','.brand_box__list__select', function(){
    $('.brand_box__list').empty();
    var id = $(this).data("brand-id");
    var name = $(this).data("brand-name");
    html = buildBOX(id,name);
    $('#brand_box').empty();
    $("#brand_box").append(html);
  });


});
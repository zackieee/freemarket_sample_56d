$(function(){

  function buildBOX(){
    var size_box = `<label class="sell-main__contents__content__item" for="size">
                      サイズ
                    </label>
                    <span class="sell-main__contents__content__item--required">
                      必須
                    </span>
                    <select required="required" maxlength="40" name="product[size_id]" id="product_size_box"><option value="">---</option>`
    return size_box;
  }

  function buildSIZE(value){
    var sizes = `<option value="${value.id}">${value.data}</option> `
    return sizes;
  }

  //カテゴリ3つ目を選択するとブランド選択が出てくる
  $(document).on('change','#category_box_2', function(){
    $('#size_box').empty();
    var category_id = Number(this.value);
    const size_category_1 = [158,159,160,161,162,163,164,165,166,167,168,168,169,170,
                             171,172,173,174,175,176,177,178,179,180,181,182,183,184,
                             185,186,187,188,189,190,191,192,193,194,195,196,197,198,
                             199,200,201,202,203,204,205,206,207,208,209,210,211,212,
                             213,214,215,216,217,228,229,230,231,232,233,234,310,311,
                             312,313,314,315,316,317,318,319,320,325,326,327,328,329,
                             330,331,332,333,337,338,339,340,341,342,343,343,344,345,
                             346,347,348,349,350,351,352,353,354,355,356,357,358,359,
                             360,361,362,363,364,365,366,367,368,369,370,371,372,373,
                             374,375,376,377,378,379,380,401,402,403,404,405,456,457,
                             1027,1028,1052,1062,1071,1083,1084,1094,1095];
    const size_category_2 = [218,219,220,221,222,223,224,225,226,227,322,381,382,383,
                             384,385,386,387,388,1030,1031,1053,1063,1072,1080,1081,
                             1090,1091];
    const size_category_3 = [534,535,536,537,538,1082,1092];
    if(size_category_1.includes(category_id)){
      var id = 1;
    }else if(size_category_2.includes(category_id)){
      var id = 2;
    }else if(size_category_3.includes(category_id)){
      var id = 3;
    }else{
      return;
    };
    $.ajax({
        url: '/products/get_size',
        type: "GET",
        data: { size_category_id: id },
        dataType: 'json'
      })
      .done(function(data){
        if (data.length){
          html = buildBOX(data);
          $("#size_box").append(html);
          data.forEach(function( size ) {
            html = buildSIZE(size);
            $("#product_size_box").append(html);
          });
        };
      })
      .fail(function(){
        alert('正しくありません');
      })
  });



});
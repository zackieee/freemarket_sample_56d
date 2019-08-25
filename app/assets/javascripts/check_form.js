$(function(){

  //郵便番号にハイフンを自動挿入するメソッド
  function insertStr(input){
    return input.slice(0, 3) + '-' + input.slice(3,input.length);
  }

  //半角→全角メソッド
  function toFullWidth(input) {
    return input.replace(/[A-Za-z0-9!-~]/g,
        function(input){
        return String.fromCharCode(input.charCodeAt(0)+0xFEE0);
        }
    );
  };

  //全角→半角メソッド
  function toHalfWidth(input) {
    return input.replace(/[Ａ-Ｚａ-ｚ０-９！-～]/g,
      function(input){
        return String.fromCharCode(input.charCodeAt(0)-0xFEE0);
      }
    );
  };

  //郵便番号に自動でハイフンを付ける
  $("#user_address_attributes_postal_code").on('keyup',function(e){
    var input = $('#user_address_attributes_postal_code').val();

    if(input.length === 3){
      $(this).val(insertStr(input));
    }
  });

  //全角指定の項目は自動で全角変換
  $('#user_lastname').on('blur',function(e){
    $(this).val(toFullWidth($(this).val()));
  });

  $('#user_firstname').on('blur',function(e){
    $(this).val(toFullWidth($(this).val()));
  });

  //半角指定の項目は自動で半角変換
  $('#user_tel').on('blur',function(e){
    $(this).val(toHalfWidth($(this).val()));
  });

});

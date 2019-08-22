document.addEventListener(
  "DOMContentLoaded", (e) => {
    Payjp.setPublicKey("pk_test_fce09d900358cad3e1310579");
    const btn = document.getElementById('token_submit');

    const check_list_number = $("#card-number-check-result");
    function appendCheckNumberResult(){
      var html =
        `<div class="error-messages">
            <ul>
              <li>必須項目です</li>
            </ul>
          </div>`
      check_list_number.append(html);
    }
  
    const check_list_cvc = $("#security-code-check-result");
    function appendCheckCVCResult(){
      var html =
        `<ul class="error-messages">
            <li>必須項目です</li>
          </ul>`
      check_list_cvc.append(html);
    }
  
    function checkForm(){
      var flag = true;
      if(document.getElementById("card_number").value == ""){
        flag = false;
        appendCheckNumberResult();
      }
      if(document.getElementById("card_security_code").value == ""){
        flag = false;
        appendCheckCVCResult();
      }
      return flag;
    }

    if(btn){
      btn.addEventListener("click", (e) => {
        var reg_new = new RegExp('users/sign_up/payment');
        var reg_edit = new RegExp('users/edit/payment_2');
        if(reg_new.test(location.pathname) || reg_edit.test(location.pathname)){
          e.preventDefault();
          var result = checkForm();
          if(result){
          //カード情報生成
          //画面から情報を取得します
          const card = {
            number: document.getElementById("card_number").value,
            cvc: document.getElementById("card_security_code").value,
            exp_month: document.getElementById("_expiration_date_2i").value,
            exp_year: 20 + document.getElementById("_expiration_date_1i").value
          }
          //トークン生成
          //カード情報はサーバ通信に含めないように削除する
          Payjp.createToken(card, (status, response) => {
            if (status === 200) { //成功した場合
              $("#card_number").removeAttr("name");
              $("#card_security_code").removeAttr("name");
              $("#_expiration_date_2i").removeAttr("name");
              $("#_expiration_date_1i").removeAttr("name");
              $("#card_token").append(
                $('<input type="hidden" name="payjp_token">').val(response.id)
              ); //トークンを送信できるように隠しタグを生成（これが走ってコントローラに飛ぶ)
              document.inputForm.submit();
            } else {
              //TODO:Payjp.createTokenの例外処理はここに記述。
              //try/chatchにする場合は構造自体に変更ある可能せ合いあり
            }
          });
        }
      }
    });
  }
},false);

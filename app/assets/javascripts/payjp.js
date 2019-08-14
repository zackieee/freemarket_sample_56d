document.addEventListener(
  "DOMContentLoaded", (e) => {
    Payjp.setPublicKey("pk_test_fce09d900358cad3e1310579");
    const btn = document.getElementById('token_submit');
    btn.addEventListener("click", (e) => {
      e.preventDefault();

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
        }
      });
    });
  },false);
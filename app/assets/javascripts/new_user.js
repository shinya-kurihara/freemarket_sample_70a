//新規登録時  例外処理

$(function(){

  // 入力内容チェックのための関数
function input_check(){
  let result = true;

  // エラー用装飾のためのクラスリセット
  $('#nickname').removeClass("inp_error");
  $('#email').removeClass("inp_error");
  $('#password').removeClass("inp_error");
  $('#password2').removeClass("inp_error");
  $('#first_name').removeClass("inp_error");
  $('#last_name').removeClass("inp_error");
  $('#first_kana').removeClass("inp_error");
  $('#last_kana').removeClass("inp_error");
  $('.birth_year').removeClass("inp_error");
  $('.birth_month').removeClass("inp_error");
  $('.birth_day').removeClass("inp_error");


  // 入力エラー文をリセット
  $("#Input_error__name").empty();
  $("#Input_error__email").empty();
  $("#Input_error__password").empty();
  $("#Input_error__password2").empty();
  $("#Input_error__first_name").empty();
  $("#Input_error__last_name").empty();
  $("#Input_error__first_kana").empty();
  $("#Input_error__last_kana").empty();
  $("#Input_error__birthday__select").empty();


  // 入力内容セット
  let nickname         =$('#nickname').val();
  let email            =$('#email').val();
  let password         =$('#password').val();
  let password2        =$('#password2').val();
  let first_name       =$('#first_name').val();
  let last_name        =$('#last_name').val();
  let first_kana       =$('#first_kana').val();
  let last_kana        =$('#last_kana').val();
  let birth_year       =$('.birth_year').val();
  let birth_month      =$('#birth_month').val();
  let birth_day        =$('#birth_day').val();
  


  // 入力内容チェック

  //ニックネーム
  if(nickname == ""){
    $("#Input_error__name").html(" ニックネームを入力してください");
    $("#nickname").addClass("inp_error");
    result = false;
  }

  //メールアドレス登録
  if(email == ""){
    $("#Input_error__email").html("メールアドレスを入力してください")
    $(email).addClass("inp_error");
    result = false;
  }else if(email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)){
    $("#Input_error__email").html("フォーマットが不適切です");
    $("#email").addClass("inp_error");
    result = false;
  }

  // パスワード
  if(password == ""){
   $("#Input_error__password").html(" パスワードを入力してください");
   $("#password").addClass("inp_error");
   result = false;
  }else if(password.length < 7 || password.length > 128 ){
   $("##Input_error__password").html(" パスワードは7文字以上 128文字以下で入力してください。");
   $("#password").addClass("inp_error");
   result = false;
  }

  // パスワード2
  if(password2 == ""){
    $("#Input_error__password2").html(" パスワードを入力してください");
    $("#password2").addClass("inp_error");
    result = false;
   }else if(password.length < 7 || password.length > 128 ){
    $("##Input_error__password2").html(" パスワードは7文字以上 128文字以下で入力してください。");
    $("#password2").addClass("inp_error");
    result = false;
   }

  //苗字
  if(first_name == ""){
   $("#Input_error__first_name").html("苗字を入力してください");
   $("#first_name").addClass("inp_error");
   result = false;
  }

  //名前
  if(last_name == ""){
   $("#Input_error__last_name").html("名前を入力してください");
   $("#last_name").addClass("inp_error");
   result = false;
  }

  //苗字(カナ)
  if(first_kana == ""){
   $("#Input_error__first_kana").html("苗字かなを入力してください");
   $("#first_kana").addClass("inp_error");
   result = false;
  }

  //苗字(カナ)
  if(last_kana == ""){
   $("#Input_error__last_kana").html("名前かなを入力してください");
   $("#last_kana").addClass("inp_error");
   result = false;
  }

  //生年月日 年
   if(birth_year == ""){
    $("#Input_error__birthday__select").html("生年月日を入力してください");
    result = false;
   }

  //生年月日 月
  if(birth_month == ""){
    $("#Input_error__birthday__select").html("生年月日を入力してください");
    result = false;
   }

     //生年月日 日
  if(birth_day == ""){
    $("#Input_error__birthday__select").html("生年月日を入力してください");
    result = false;
   }

  return result;
}


  $("#Userinput__btn").on('click',function(e){
    e.preventDefault();                      //エラー文消さない
    if(input_check()){                      //この中にsubmitアクションを作る

      $('#new_user').attr('action', '/users').submit();
      
      return false;                           //親要素のイベントを発生させない
    }
  });
});

//__________________________________________________________________________________________________


// 以下アドレス

// 新規登録時  例外処理

$(function(){

// 入力内容チェックのための関数
function input_check(){
  let result = true;

  // エラー用装飾のためのクラスリセット
  $('#post_code').removeClass("inp_error");
  $('#prefecture').removeClass("inp_error");
  $('#city').removeClass("inp_error");
  $('#house_number').removeClass("inp_error");


  // 入力エラー文をリセット
  $("#Input_error__post_code").empty();
  $("#Input_error__prefecture").empty();
  $("#Input_error__city").empty();
  $("#Input_error__house_number").empty();

  // 入力内容セット
  let post_code                        =$('#post_code').val();
  let prefecture            =$('#prefecture').val();
  let city                  =$('#city').val();
  let house_number                        =$('#house_number').val();

  // 入力内容チェック

  // 郵便番号
  if(post_code == ""){
   $("#Input_error__post_code").html("郵便番号を入力してください");
   $("#post_code").addClass("inp_error");
   result = false;
  }

  //都道府県
  if(prefecture == ""){
   $("#Input_error__prefecture").html("都道府県を入力してください");
   $("#prefecture").addClass("inp_error");
   result = false;
  }

  //市町村区
  if(city == ""){
   $("#Input_error__city").html("市町村区を入力してください");
   $("#city").addClass("inp_error");
   result = false;
  }

  //番地
  if(house_number == ""){
   $("#Input_error__house_number").html("番地を入力してください");
   $("#house_number").addClass("inp_error");
   result = false;
  }

  return result;
}



  $("#Addressinput__btn").on('click',function(e){
    e.preventDefault();                      //エラー文消さない
    if(input_check()){                        //

      $('#new_sending_destination').attr('action', '/sending_destinations').submit();

      return false;                           //親要素のイベントを発生させない
    }
  });
});
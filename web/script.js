function getPlatform() {
  console.log("getPlatform is called from script.js");
  return navigator.platform;
}

async function jsOpenTabFunction(url) {
    let promise = new Promise(function(resolve, reject) {
        var win = window.open(url,"New Popup Window","width=800,height=800");
        console.log("window",win);

        var timer = setInterval(function() {
                if (win.closed) {
                    clearInterval(timer);
                    alert("'Popup Window' closed!");
                    resolve('Paid');
                }
            }, 500);
        console.log("window",win);
    });
    let result = await promise;
    console.log("result",result);
    return result;
}


async function jsPromiseFunction(amount, orderId, orderName) {
    console.log("start jsOpenTabFunction");
    //todo 오케 여기 부분부터 이제 토스로 바꿔주면 되겠다
    var clientKey = 'test_ck_AQ92ymxN349YG91NZoAVajRKXvdk'
    var tossPayments = TossPayments(clientKey)

    // ------ 결제창 띄우기 ------
    tossPayments.requestPayment('카드', { // 결제수단 파라미터 (카드, 계좌이체, 가상계좌, 휴대폰 등)
      // https://docs.tosspayments.com/reference/js-sdk
      amount: amount, // 결제 금액 - 150
      orderId: orderId, // 주문 ID(주문 ID는 상점에서 직접 만들어주세요.) - 'T05MlFPKGrlB2LySnGDKV'
      orderName: orderName, // 주문명 - '테스트 결제'
      successUrl:'https://dodohan-6c8fd.web.app/store/success', // 결제 성공 시 이동할 페이지(이 주소는 예시입니다. 상점에서 직접 만들어주세요.)
      failUrl: 'https://docs.tosspayments.com/guides/payment/test-fail', // 결제 실패 시 이동할 페이지(이 주소는 예시입니다. 상점에서 직접 만들어주세요.)
    })
    // ------결제창을 띄울 수 없는 에러 처리 ------
    // 메서드 실행에 실패해서 reject 된 에러를 처리하는 블록입니다.
    // 결제창에서 발생할 수 있는 에러를 확인하세요.
    // https://docs.tosspayments.com/reference/error-codes#결제창공통-sdk-에러
    .catch(function (error) {
      if (error.code === 'USER_CANCEL') {
        // 결제 고객이 결제창을 닫았을 때 에러 처리
      } else if (error.code === 'INVALID_CARD_COMPANY') {
        // 유효하지 않은 카드 코드에 대한 에러 처리
      }
    });
    console.log('ended!');
    return;
}
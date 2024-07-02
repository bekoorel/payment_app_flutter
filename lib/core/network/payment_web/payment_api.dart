import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:payment_app_flutter/core/constens/conestans.dart';

class PaymentApi {
  var dio = Dio();

  handelTokens(
    String amountCents,
  ) async {
    try {
      final getPublicToken =
          await apiReq(ConstansUrl.publicTokenLink, ConstansUrl.publicToken);

      final getordersid = await apiReq(
        ConstansUrl.ordersidLink,
        {
          "auth_token": getPublicToken.data["token"],
          "delivery_needed": "true",
          "amount_cents": amountCents,
          "currency": "EGP",
          "items": [],
        },
      );

      final getTokenPayment = await apiReq(
        ConstansUrl.paymentTokenLink,
        {
          "auth_token": getPublicToken.data["token"],
          "amount_cents": amountCents,
          "expiration": 3600,
          "order_id": getordersid.data['id'],
          "billing_data": {
            "apartment": "NA",
            "email": "NA",
            "floor": "NA",
            "first_name": "ahmed",
            "street": "NA",
            "building": "NA",
            "phone_number": "+201118849262",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": "ramdan",
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": 2298940,
          "lock_order_when_paid": "false"
        },
      );
      return 'https://accept.paymob.com/api/acceptance/iframes/409410?payment_token=${getTokenPayment.data['token']}';
    } catch (e) {
      print(e);
    }
  }

  Future<Response<dynamic>> apiReq(String url, data) async {
    Response<dynamic> response = await dio.request(
      url,
      options: Options(
        method: 'POST',
      ),
      data: data,
    );
    loges();
    return response;
  }

  loges() {
    dio.interceptors.add(
      LogInterceptor(
        logPrint: (o) => debugPrint(o.toString()),
      ),
    );
  }
}

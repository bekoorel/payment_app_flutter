import 'dart:convert';

import 'package:dio/dio.dart';

class PaymentApi {
  var dio = Dio();
  // step 1
  String publicTokenLink = 'https://accept.paymob.com/api/auth/tokens';
  String publicToken = json.encode({
    "api_key":
        "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TWpFNU1qSXpMQ0p1WVcxbElqb2lNVGN4T1RnME1UazJOQzQyTnpZNU9EVWlmUS5fRTdld2hfQWQ0aVR2ajZlaHpQOUNhbHlhWGRPUW9oQ0llQS1wUlJiLWZxV3lHZkFwOFRxcFhEa0xMenl5c3R6Ums0QjgxSG0wYjVJTFpGS2lVSVIwZw=="
  });

  // step 2
  String ordersidLink = 'https://accept.paymob.com/api/ecommerce/orders';

  // step 3
  String paymentTokenLink =
      'https://accept.paymob.com/api/acceptance/payment_keys';

  handelTokens(
    String amountCents,
  ) async {
    final getPublicToken = await apiReq(publicTokenLink, publicToken);
    print(
      getPublicToken.data["token"],
    );
    final getordersid = await apiReq(
      ordersidLink,
      jsonEncode(
        {
          "auth_token": getPublicToken.data["token"],
          "delivery_needed": "false",
          "amount_cents": amountCents,
          "currency": "EGP",
          "items": [],
        },
      ),
    );
    // final getTokenPayment=apiReq(paymentTokenLink, jsonEncode(),);

    print(
      jsonEncode(getordersid.data),
    );
  }

  Future<Response<dynamic>> apiReq(String url, data) async {
    Response<dynamic> response = await dio.request(
      url,
      options: Options(
        method: 'POST',
      ),
      data: data,
    );
    return response;
  }
}

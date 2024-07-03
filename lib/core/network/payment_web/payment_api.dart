import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:payment_app_flutter/core/Dependencies/get_it.dart';
import 'package:payment_app_flutter/core/constens/conestans.dart';
import 'package:payment_app_flutter/features/payment/logic/credit_logic.dart';

class PaymentApi {
  var dio = Dio();
  final formeData = getIt<CreditLogic>();

  handelTokens( ) async {
    try {
      final getPublicToken =
          await apiReq(ConstansUrl.publicTokenLink, ConstansUrl.publicToken);
 
      final getordersid = await apiReq(
        ConstansUrl.ordersidLink,
        {
          "auth_token": getPublicToken.data["token"],
          "delivery_needed": "true",
          "amount_cents": "500",
          "currency": "EGP",
          "items": [],
        },
      );

      final getTokenPayment = await apiReq(
        ConstansUrl.paymentTokenLink,
        {
          "auth_token": getPublicToken.data["token"],
          "amount_cents": "500",
          "expiration": 3600,
          "order_id": getordersid.data['id'],
          "billing_data": {
            "apartment": formeData.apartment,
            "email": formeData.email,
            "floor": "NA",
            "first_name": formeData.firstName,
            "street": formeData.street,
            "building": formeData.building,
            "phone_number": formeData.phoneNumber,
            "shipping_method": "NA",
            "postal_code": formeData.postalCode,
            "city": formeData.city,
            "country": formeData.country,
            "last_name": formeData.lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": 2298940,
          "lock_order_when_paid": "false"
        },
      );
      return 'https://accept.paymob.com/api/acceptance/iframes/409410?payment_token=${getTokenPayment.data['token']}';
    } catch (e) {
      rethrow;
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

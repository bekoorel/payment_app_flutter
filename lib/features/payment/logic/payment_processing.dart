import 'package:payment_app_flutter/core/Dependencies/get_it.dart';
import 'package:payment_app_flutter/core/network/payment_web/payment_api.dart';

class PayUsingIfreme {
 
  final api = getIt<PaymentApi>();

  String urlIfreme = '';
  getUrlIfreme() async {
    urlIfreme = await api.handelTokens();
    return '';
  }
}

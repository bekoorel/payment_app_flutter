import 'package:get_it/get_it.dart';
import 'package:payment_app_flutter/core/network/payment_web/payment_api.dart';
import 'package:payment_app_flutter/core/network/web/repo.dart';
import 'package:payment_app_flutter/features/cart/logic/logic_cart.dart';
import 'package:payment_app_flutter/features/payment/logic/credit_logic.dart';
import 'package:payment_app_flutter/features/payment/logic/payment_processing.dart';

final getIt = GetIt.instance;

setup() async {
  getIt.registerSingleton<CreditLogic>(
    CreditLogic(),
  );
  getIt.registerSingleton<LogicCart>(
    LogicCart(),
  );
  getIt.registerSingleton<Repo>(
    Repo(),
  );
  getIt.registerSingleton<PaymentApi>(
    PaymentApi(),
  );
  getIt.registerSingleton<PayUsingIfreme>(
    PayUsingIfreme(),
  );
}

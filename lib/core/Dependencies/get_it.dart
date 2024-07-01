import 'package:get_it/get_it.dart';
import 'package:payment_app_flutter/core/network/payment_web/payment_api.dart';
import 'package:payment_app_flutter/core/network/web/repo.dart';
import 'package:payment_app_flutter/core/token/save_token.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Repo>(
    Repo(),
  );
  getIt.registerSingleton<SaveToken>(
    SaveToken(),
  );
  getIt.registerSingleton<PaymentApi>(
    PaymentApi(),
  );
}

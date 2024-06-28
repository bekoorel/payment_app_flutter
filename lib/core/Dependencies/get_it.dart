import 'package:get_it/get_it.dart';
import 'package:payment_app_flutter/core/network/repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Repo>(
    Repo(),
  );
}

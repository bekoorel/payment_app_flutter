import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SaveToken {
  String apiToken =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TWpFNU1qSXpMQ0p1WVcxbElqb2lNVGN4T1RnME1UazJOQzQyTnpZNU9EVWlmUS5fRTdld2hfQWQ0aVR2ajZlaHpQOUNhbHlhWGRPUW9oQ0llQS1wUlJiLWZxV3lHZkFwOFRxcFhEa0xMenl5c3R6Ums0QjgxSG0wYjVJTFpGS2lVSVIwZw==';

// Create storage
  final storage = const FlutterSecureStorage();

// Read value
  get readValue async => await storage.read(key: 'token');

// Write value
  writeValue(String tok) async => await storage.write(key: 'token', value: tok);
}

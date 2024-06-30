import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('products')
  Future<List<Prodact>> getTasks();
}

@JsonSerializable()
class Prodact {
  Prodact(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});
  factory Prodact.fromJson(Map<String, dynamic> json) =>
      _$ProdactFromJson(json);

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Map<String, dynamic> toJson() => _$ProdactToJson(this);
}

class Rating {
  // ignore: prefer_typing_uninitialized_variables
  var rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}

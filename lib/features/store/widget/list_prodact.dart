import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_card/image_card.dart';
import 'package:payment_app_flutter/core/Dependencies/get_it.dart';
import 'package:payment_app_flutter/core/network/api.dart';
import 'package:payment_app_flutter/core/network/repo.dart';
import 'package:payment_app_flutter/core/style/style.dart';
import 'package:payment_app_flutter/features/cart/logic/logic_cart.dart';
import 'package:shimmer/shimmer.dart';

class ListProdact extends StatelessWidget {
  ListProdact({super.key});
  final dataItmes = getIt<Repo>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Prodact>>(
      future: dataItmes.dataApi(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Consumer(
            builder: (context, ref, child) => GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عدد الأعمدة في الشبكة
                  crossAxisSpacing: 5.0, // المسافة الأفقية بين الأعمدة
                  mainAxisSpacing: 5.0, // المسافة العمودية بين الصفوف
                  childAspectRatio: 0.6),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return TransparentImageCard(
                  width: 200.w,
                  height: 700.h,
                  imageProvider: NetworkImage('${snapshot.data![index].image}'),
                  title: Text(
                    textAlign: TextAlign.center,
                    '${snapshot.data![index].title}',
                    style: TextStyle(
                        fontSize: 15.spMin,
                        color: StyleApp.white,
                        fontWeight: FontWeight.bold),
                  ),
                  description: Text(
                    '${snapshot.data![index].price} EG',
                    style: TextStyle(
                        backgroundColor: StyleApp.indigo,
                        fontSize: 20.spMin,
                        color: StyleApp.white,
                        fontWeight: FontWeight.bold),
                  ),
                  tags: <Widget>[
                    Card(
                      child: IconButton(
                        onPressed: () {
                          ref.read(logicCartProvider).setItem(
                              '${snapshot.data![index].title}',
                              '${snapshot.data![index].price} EG',
                              '${snapshot.data![index].image}');
                        },
                        icon: const Icon(Icons.shopping_cart_checkout_sharp),
                        color: StyleApp.indigo,
                      ),
                    )
                  ],
                );
              },
            ),
          );
        } else {
          return Center(
            child: Shimmer.fromColors(
              baseColor: StyleApp.indigo,
              highlightColor: StyleApp.white,
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Fetching your products',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                  text: 'Loding',
                  style: TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

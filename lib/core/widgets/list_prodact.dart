import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_card/image_card.dart';
import 'package:payment_app_flutter/core/Dependencies/get_it.dart';
import 'package:payment_app_flutter/core/network/api.dart';
import 'package:payment_app_flutter/core/network/repo.dart';
import 'package:payment_app_flutter/core/style/style.dart';
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
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة في الشبكة
              crossAxisSpacing: 10.0, // المسافة الأفقية بين الأعمدة
              mainAxisSpacing: 10.0, // المسافة العمودية بين الصفوف
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return TransparentImageCard(
                width: 200.w,
                height: 200.h,
                imageProvider: NetworkImage('${snapshot.data![index].image}'),
                /*    tags: [
                  _tag('Product', () {}),
                ],*/
                title: Text(
                  textAlign: TextAlign.center,
                  '${snapshot.data![index].title}',
                  style: TextStyle(
                      fontSize: 10.spMin,
                      color: StyleApp.white,
                      fontWeight: FontWeight.bold),
                ),
                // description: Text('${snapshot.data![index].description}'),
              );
            },
          );
        } else {
          return Center(
            child: Shimmer.fromColors(
              baseColor: StyleApp.indigo,
              highlightColor: StyleApp.white,
              child: const Text(
                'Loding',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 100.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

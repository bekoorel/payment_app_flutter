import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app_flutter/core/style/style.dart';
import 'package:payment_app_flutter/features/cart/logic/logic_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: StyleApp.white, fontSize: 30.sp),
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.go('/PaymentScreen');
              },
              child: const Text(
                'Pay >>',
                style: TextStyle(color: StyleApp.white, fontSize: 20),
              )),
        ],
        backgroundColor: StyleApp.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                    ListView.builder(
                  itemCount: ref.read(logicCartProvider).items.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(
                          '${ref.read(logicCartProvider).items.elementAt(index)['name']}'),
                      leading: Image.network(
                          '${ref.read(logicCartProvider).items.elementAt(index)['imageUrl']}'),
                      trailing: IconButton(
                          onPressed: () {
                            ref.watch(logicCartProvider).deletItme(index);
                            ref
                                .read(logicCartProvider)
                                .getTotalPriceAndCounts();
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: StyleApp.indigo,
                          )),
                      subtitle: Text(
                          '${ref.read(logicCartProvider).items.elementAt(index)['price']} EG'),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                child: Consumer(
                  builder: (context, ref, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${ref.watch(logicCartProvider).total} EG',
                          style: TextStyle(
                              color: StyleApp.indigo, fontSize: 20.sp)),
                      Text('${ref.watch(logicCartProvider).counte} counte',
                          style: TextStyle(
                              color: StyleApp.indigo, fontSize: 20.sp)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

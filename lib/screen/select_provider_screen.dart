import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_river_test/layout/default_layout.dart';
import 'package:flutter_river_test/riverpod/select_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    // 특정값만 watch
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    // hasBought만 변경시에 listen 실행
    ref.listen(selectProvider.select((value) => value.hasBought), (previous, next) {
      print('next : $next');
    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(state.name),
            // Text(state.isSpicy.toString()),
            // Text(state.hasBought.toString()),
            Text(state.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleSpicy();
              },
              child: Text('spicy toggle'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: Text('hasBought toggle'),
            ),
          ],
        ),
      ),
    );
  }
}

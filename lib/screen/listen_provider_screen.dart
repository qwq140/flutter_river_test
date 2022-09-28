import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_river_test/layout/default_layout.dart';
import 'package:flutter_river_test/riverpod/listen_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(next);
      }
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
            10,
            (index) => Column(
                  children: [
                    Text(index.toString()),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(listenProvider.notifier)
                            .update((state) => state == 10 ? 10 : state + 1);
                      },
                      child: Text(
                        '다음',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(listenProvider.notifier)
                            .update((state) => state == 0 ? 0 : state - 1);
                      },
                      child: Text(
                        '뒤로',
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}

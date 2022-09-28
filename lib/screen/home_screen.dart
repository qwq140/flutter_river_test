import 'package:flutter/material.dart';
import 'package:flutter_river_test/layout/default_layout.dart';
import 'package:flutter_river_test/screen/auto_dispose_modifier_screen.dart';
import 'package:flutter_river_test/screen/family_modifier_screen.dart';
import 'package:flutter_river_test/screen/future_provider_screen.dart';
import 'package:flutter_river_test/screen/listen_provider_screen.dart';
import 'package:flutter_river_test/screen/provider_screen.dart';
import 'package:flutter_river_test/screen/select_provider_screen.dart';
import 'package:flutter_river_test/screen/state_notifier_provider_screen.dart';
import 'package:flutter_river_test/screen/state_provider_screen.dart';
import 'package:flutter_river_test/screen/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'HomeScreen',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  return StateProviderScreen();
                },)
              );
            },
            child: Text('StateProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return StateNotifierProviderScreen();
                  },)
              );
            },
            child: Text('StateNotifierProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return FutureProviderScreen();
                  },)
              );
            },
            child: Text('FutureProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return StreamProviderScreen();
                  },)
              );
            },
            child: Text('StreamProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return FamilyModifierScreen();
                  },)
              );
            },
            child: Text('FamilyModifierScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return AutoDisposeModifierScreen();
                  },)
              );
            },
            child: Text('AutoDisposeModifierScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return ListenProviderScreen();
                  },)
              );
            },
            child: Text('ListenProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return SelectProviderScreen();
                  },)
              );
            },
            child: Text('SelectProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return ProviderScreen();
                  },)
              );
            },
            child: Text('ProviderScreen'),
          ),
        ],
      ),
    );
  }
}

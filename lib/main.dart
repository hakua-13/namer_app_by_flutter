import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:namer_app_flutter_codelab_first/provider/app_state_provider.dart';
import 'package:namer_app_flutter_codelab_first/screens/favorites_page.dart';
import 'package:namer_app_flutter_codelab_first/screens/generator_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Namer App',
        theme:  ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const MyHomePage(),
      );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateNotifier = ref.watch(appStateProvider.notifier);
    Widget page;
    switch (appState) {
      case 0:
      page = const GeneratorPage();
      break;
      case 1:
      page = const FavoritesPage();
      break;
      default:
      throw UnimplementedError('no widget for $appState');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text("Favorites")
                  )
                ],
                selectedIndex: appState,
                onDestinationSelected: (value) {
                  appStateNotifier.set(value);
                }
              )
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ]
        )
      );
    });
  }
}
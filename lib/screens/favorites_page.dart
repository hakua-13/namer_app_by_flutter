import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:namer_app_flutter_codelab_first/provider/favorites_provider.dart';

class FavoritesPage extends ConsumerWidget{
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final favoritesNotifier = ref.watch(favoritesProvider.notifier);

    if (favorites.isEmpty) {
      return const Center(
        child: Text('No favorite yet')
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${favorites.length} favorites:'),
        ),
        for (var favorite in favorites)
          ListTile(
            leading: const Icon(
              Icons.favorite,
              color: Colors.pink
            ),
            title: Text(
              favorite.asLowerCase,
              style: const TextStyle(fontSize:18)
            ),
            trailing: const Icon(Icons.delete),
            onTap: () {
              favoritesNotifier.remove(favorite);
            }
          )
      ]
    );
  }
}
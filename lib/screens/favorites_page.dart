import 'package:flutter/material.dart';
import 'package:namer_app_flutter_codelab_first/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget{
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

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
              appState.removeFavorite(favorite);
            }
          )
      ]
    );
  }
}
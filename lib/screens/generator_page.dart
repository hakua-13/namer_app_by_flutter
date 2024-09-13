import 'package:flutter/material.dart';
import 'package:namer_app_flutter_codelab_first/main.dart';
import 'package:namer_app_flutter_codelab_first/widgets/big_card.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: Colors.pink,
                        size: 24,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Like',
                        style: TextStyle(
                          fontSize: 16
                        )
                      )
                    ]
                  )
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ),
              ]
            ),
          ],
        )
      );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:namer_app_flutter_codelab_first/provider/current_word_provider.dart';
import 'package:namer_app_flutter_codelab_first/provider/favorites_provider.dart';
import 'package:namer_app_flutter_codelab_first/widgets/big_card.dart';

class GeneratorPage extends ConsumerWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWord = ref.watch(currentWordProvider);
    final currentWordNotifier = ref.watch(currentWordProvider.notifier);
    final favorites = ref.watch(favoritesProvider);
    final favoritesNotifier = ref.watch(favoritesProvider.notifier);

    IconData icon;
    if (favorites.contains(currentWord)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: currentWord),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if(favorites.contains(currentWord)) {
                      favoritesNotifier.remove(currentWord);
                    } else {
                      favoritesNotifier.add(currentWord);
                    }
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
                    currentWordNotifier.next();
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
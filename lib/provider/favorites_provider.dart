import 'package:english_words/english_words.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_provider.g.dart';

@riverpod
class Favorites extends _$Favorites {
  @override
  List<WordPair> build() {
    return [];
  }

  void add(WordPair current) {
    List<WordPair> newList = [...state];
    newList.add(current);

    state = newList;
  }

  void remove(WordPair current) {
    List<WordPair> newList = [...state];
    newList.remove(current);

    state = newList;
  }
}
import 'package:english_words/english_words.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_word_provider.g.dart';

@riverpod
class CurrentWord extends _$CurrentWord {
  @override
  WordPair build() {
    return WordPair.random();
  }

  void next() {
    state = WordPair.random();
  }
}
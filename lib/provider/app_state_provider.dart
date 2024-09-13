import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state_provider.g.dart';

@riverpod
class AppState extends _$AppState {
  @override
  int build() {
    return 0;
  }

  void set(int index) {
    state = index;
  }
}
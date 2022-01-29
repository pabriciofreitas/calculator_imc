import 'package:flutter/foundation.dart';

abstract class HomePresenter {
  ValueNotifier<int> get pageIndexNotifier;
  //Future<void> logout();
  // void updateUserId();
}

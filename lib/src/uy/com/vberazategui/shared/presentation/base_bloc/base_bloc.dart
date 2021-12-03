import 'package:flutter/material.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/base_bloc/bloc_state.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/base_bloc/snackbar_state.dart';

class BaseBLoC extends ChangeNotifier {
  BLoCState _state = BLoCState.idle;
  late String _snackBarMessage;
  SnackBarState _snackBarState = SnackBarState.info;

  // ignore: unnecessary_getters_setters
  BLoCState get state => _state;
  String get snackBarMessage => _snackBarMessage;
  SnackBarState get snackBarState => _snackBarState;

  // ignore: unnecessary_getters_setters
  set state(BLoCState value) {
    _state = value;
  }

  void setNotify(BLoCState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setMessage(SnackBarState snackBarState, String message) {
    _snackBarState = snackBarState;
    _snackBarMessage = message;
  }
}

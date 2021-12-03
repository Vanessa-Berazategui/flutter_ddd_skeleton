import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/lang/l10n.dart';

class Failure {
  Failure({String? message, String? prefix, String? emoji})
      : _message = message,
        _prefix = prefix,
        _emoji = emoji;

  String? _message;
  String? _prefix;
  String? _emoji;

  // ignore: avoid_setters_without_getters
  set message(String? value) {
    _message = value;
  }

  // ignore: avoid_setters_without_getters
  set prefix(String? value) {
    _prefix = value;
  }

  // ignore: avoid_setters_without_getters
  set emoji(String? value) {
    _emoji = value;
  }

  @override
  String toString() => (_prefix ?? '') + (_message ?? '') + (_emoji ?? '');
}

class NoInternetFailure extends Failure {
  NoInternetFailure()
      : super(message: AppLocalizations.current.fb_tx_without_connection);
}

class ReceiveTimeOutFailure extends Failure {
  ReceiveTimeOutFailure()
      : super(message: AppLocalizations.current.fb_tx_expired_time);
}

class ConnectTimeOutFailure extends Failure {
  ConnectTimeOutFailure()
      : super(message: AppLocalizations.current.fb_tx_expired_time);
}

class ServerFailure extends Failure {
  ServerFailure(String message)
      : super(
          message: message.isEmpty
              ? AppLocalizations.current.fb_tx_internal_server_error
              : message,
        );
}

class CacheFailure extends Failure {}

class UnexpectedFailure extends Failure {
  UnexpectedFailure()
      : super(message: AppLocalizations.current.fb_tx_unexpected_error);
}

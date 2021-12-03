import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class LogInjectableModule {
  @injectable
  Logger get logger => Logger(
        printer: PrettyPrinter(),
      );
}

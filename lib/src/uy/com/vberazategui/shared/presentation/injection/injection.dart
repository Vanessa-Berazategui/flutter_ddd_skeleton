import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => $initGetIt(getIt);

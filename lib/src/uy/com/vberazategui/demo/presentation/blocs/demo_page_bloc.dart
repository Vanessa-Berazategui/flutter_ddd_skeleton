import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/application/usecases/cache_demo.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/application/usecases/clear_cache_demo.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/application/usecases/demo.dart'
    as d_uc;
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/application/usecases/get_cached_demo.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/base_bloc/base_bloc.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/base_bloc/bloc_state.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/base_bloc/snackbar_state.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/mixins/validation_mixin.dart';
import 'package:injectable/injectable.dart';

@injectable
class DemoPageBLoC extends BaseBLoC with ValidationMixin {
  DemoPageBLoC({
    required this.demoUseCase,
    required this.cacheDemoUseCase,
    required this.getCachedDemoUseCase,
    required this.clearCacheDemoUseCase,
  });

  final d_uc.Demo demoUseCase;
  final CacheDemo cacheDemoUseCase;
  final GetCachedDemo getCachedDemoUseCase;
  final ClearCacheDemo clearCacheDemoUseCase;

  Future<void> demo() async {
    setNotify(BLoCState.busy);

    final result = await demoUseCase.call(d_uc.Params(demoDetail: 'something'));

    result.fold(
      (failure) => setMessage(SnackBarState.error, failure.toString()),
      (value) => setMessage(SnackBarState.info, ''),
    );

    setNotify(BLoCState.idle);
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/presentation/demo_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: DemoPage),
  ],
)
class $AppRouter {}

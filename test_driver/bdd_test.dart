import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'hooks.dart';

Future<void> main(List<String> args) {
  final config = FlutterTestConfiguration()
    // ignore: unnecessary_raw_strings
    ..features = [Glob(r'test_driver/features/**.feature')]
    ..reporters = [
      StdoutReporter(),
      FlutterDriverReporter(),
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './test_driver/reporters/cucumber_report.json')
    ]
    ..hooks = [Hooks(), AttachScreenshotOnFailedStepHook()]
    ..stepDefinitions = []
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = false
    ..targetAppPath = 'test_driver/flavour/flavour_1/app_dev.dart'
    ..order = ExecutionOrder.sequential
    // uncomment to see an example of running scenarios based on tag expressions
    //'@supervisor_background' '@cashier_background' '@supervisor' '@cashier'
    ..tagExpression = '@test'
    ..logFlutterProcessOutput = true
    ..flutterBuildTimeout = const Duration(minutes: 10);

  if (args.isNotEmpty) config.runningAppProtocolEndpointUri = args[0];

  return GherkinRunner().execute(config);
}

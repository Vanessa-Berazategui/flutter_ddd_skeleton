// ignore_for_file: avoid_print

import 'package:gherkin/gherkin.dart';

class Hooks extends Hook {
  /// The priority to assign to this hook.
  /// Higher priority gets run first so a priority of 10 is run before
  /// a priority of 2
  @override
  int get priority => 1;

  /// Run before any scenario in a test run have executed
  @override
  Future<void> onBeforeRun(TestConfiguration config) async =>
      print('------------ Before run hook ------------');

  /// Run after all scenarios in a test run have completed
  @override
  Future<void> onAfterRun(TestConfiguration config) async =>
      print('------------ After run hook ------------');

  /// Run after the scenario world is created but run before a scenario
  /// and its steps are executed
  /// Might not be invoked if there is not a world object
  @override
  Future<void> onAfterScenarioWorldCreated(
    World world,
    String scenario,
    Iterable<Tag> tags,
  ) async =>
      print("------------ After scenario world created' ------------");

  /// Run before a scenario and it steps are executed
  @override
  Future<void> onBeforeScenario(
    TestConfiguration config,
    String scenario,
    Iterable<Tag> tags,
  ) async =>
      print(
          "------------ Running hook before scenario '$scenario' ------------");

  /// Run after a scenario has executed
  @override
  Future<void> onAfterScenario(
    TestConfiguration config,
    String scenario,
    Iterable<Tag> tags,
  ) async =>
      print("------------ Running hook after scenario '$scenario'------------");

  /// Run before a step is executed
  @override
  Future<void> onBeforeStep(World world, String step) => Future.value(null);

  /// Run after a step has executed
  @override
  Future<void> onAfterStep(
      World world, String step, StepResult stepResult) async {
    if (stepResult.result == StepExecutionResult.fail) {
      world
        ..attach('Step execution result.', 'text/plain')
        ..attach(stepResult.resultReason!, 'application/json');
    }
  }
}

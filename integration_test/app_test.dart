import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:notebook/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('App Test', () {
    testWidgets("first time open app", (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 150));

      var nextPage = find.byType(ElevatedButton).first;
      await tester.tap(nextPage);
      await tester.pumpAndSettle(const Duration(seconds: 20));

      var goToPermissions = find.byType(ElevatedButton).first;
      await tester.tap(goToPermissions);
    });
  });
}

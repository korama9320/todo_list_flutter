import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:notebook/card.dart';

import 'package:notebook/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('App Test', () {
    testWidgets("first time open app", (tester) async {
      addNotes() async {
        var nextPage = find.byType(IconButton).first;
        await tester.tap(nextPage);

        await tester.pumpAndSettle(const Duration(seconds: 3));

        var note = find.byType(TextFormField).first;
        await tester.enterText(note, "learn integration testing");

        await tester.pumpAndSettle(const Duration(seconds: 3));
        var addNote = find.byType(ElevatedButton).first;
        await tester.tap(addNote);

        await tester.pumpAndSettle(const Duration(seconds: 3));
        await tester.pageBack();

        await tester.pumpAndSettle(const Duration(seconds: 3));
      }

      findButton() async {
        var checkDone = find.byType(IconButton).first;
        await tester.tap(checkDone);

        await tester.pumpAndSettle(const Duration(seconds: 3));
      }

      dismissCard() async {
        var noteCard = find.byType(NoteCard).first;
        await tester.drag(noteCard, const Offset(300, 0));

        await tester.pumpAndSettle(const Duration(seconds: 3));
      }

      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await addNotes();
      await dismissCard();
      await addNotes();
      await findButton();

      var doneItem = find.byKey(const Key('second'));
      await tester.tap(doneItem);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      await findButton();

      var todoItem = find.byKey(const Key('first'));
      await tester.tap(todoItem);

    //   await findButton();

    //   await tester.tap(doneItem);

    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   await dismissCard();

      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_intl_plugin_sample_app/generated/l10n.dart';
import 'package:flutter_intl_plugin_sample_app/main.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en'),
      home: child,
    );
  }

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    // await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));
    await tester.pumpWidget(makeTestableWidget(child: const MyHomePage()));
    await tester.pump();

    // Create the Finders.
    final titleFinder = find.text('Some localized strings:');
    final example1Finder = find.text('Welcome John');
    final example2Finder = find.text('My name is Doe, John Doe');
    final example3Finder = find.text('You have 2 messages');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(example1Finder, findsOneWidget);
    expect(example2Finder, findsOneWidget);
    expect(example3Finder, findsOneWidget);
  });
}

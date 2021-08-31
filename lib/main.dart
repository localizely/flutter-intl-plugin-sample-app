import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var matApp = new MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: MyHomePage(),
    );
    return matApp;
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListTile(
              leading: ElevatedButton(
                onPressed: () {
                  setState(() {
                    S.load(Locale('en', 'US'));
                  });
                },
                child: Text('ENGLISH'),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    S.load(Locale('de', 'DE'));
                  });
                },
                child: Text('GERMAN'),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(S.of(context).pageHomeListTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(""),
                  Text(S.of(context).pageHomeSamplePlaceholder("John"), style: TextStyle(fontSize: 20)),
                  Text(S.of(context).pageHomeSamplePlaceholdersOrdered("John", "Doe"), style: TextStyle(fontSize: 20)),
                  Text(S.of(context).pageHomeSamplePlural(2), style: TextStyle(fontSize: 20)),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ))
        ],
      ),
    );
  }
}

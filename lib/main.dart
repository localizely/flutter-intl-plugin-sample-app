import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
                    S.load(const Locale('en'));
                  });
                },
                child: const Text('ENGLISH'),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    S.load(const Locale('de'));
                  });
                },
                child: const Text('GERMAN'),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).pageHomeListTitle,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(""),
                  Text(
                    S.of(context).pageHomeSamplePlaceholder('John'),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    S
                        .of(context)
                        .pageHomeSamplePlaceholdersOrdered('John', 'Doe'),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    S.of(context).pageHomeSamplePlural(2),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    S.of(context).pageHomeSampleTotalAmount(2500.0),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    S.of(context).pageHomeSampleCurrentDateTime(
                        DateTime.now(), DateTime.now()),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

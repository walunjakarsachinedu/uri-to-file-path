import 'package:flutter/material.dart' hide Intent;
import 'dart:async';

import 'package:receive_intent/receive_intent.dart';
import 'package:uri_to_file_path/uri_to_file_path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
	late StreamSubscription intentStream;
	String? _pdfFilePath;

	void handleIntent(Intent? intent) async {
		if(intent == null) return;
		if(intent.action == "android.intent.action.VIEW") _pdfFilePath = intent.data;
		if(intent.action == "android.intent.action.SEND") _pdfFilePath = intent.extra?["android.intent.extra.STREAM"];
		if(_pdfFilePath != null) _pdfFilePath = await UriToFilePath.getAbsolutePath(_pdfFilePath!);
		setState(() {});
	}

	@override
  void initState() {
    super.initState();
		intentStream = ReceiveIntent.receivedIntentStream.listen(handleIntent);
		ReceiveIntent.getInitialIntent().then(handleIntent);
  }

	@override
  void dispose() {
		intentStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(_pdfFilePath ?? "pdf viewer app"),
        )),
      ),
    );
  }
}

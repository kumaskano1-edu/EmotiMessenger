// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:messenger/main.dart';
import 'package:messenger/provider/FirebaseApi.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("api test", () async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    Map<String, dynamic> maps = await FirebaseApi.getSessionObjectsWithID("zHbIgcwB9lcitbf5SggTsM1iYOm1PWB3D3lbtrOfsmU8wfxzCmKmPx13");
  });
}

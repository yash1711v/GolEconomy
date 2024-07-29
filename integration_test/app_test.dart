import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '/Volumes/Yashverma/Flutter/FlutterProjects/gol_economy/lib/main.dart' as app;
void main() => run(_testMain);

run(void Function() testMain) {}

void _testMain() {
  testWidgets('end to end testing ', (tester) async {
    app.mainCommon();
    await tester.pumpAndSettle();
    await tester.allWidgets;
  });
}

import 'package:flutter_test/flutter_test.dart';
import '/Volumes/Yashverma/Flutter/FlutterProjects/gol_economy/lib/main.dart' as app;
void main() => run(_testMain);

run(void Function() testMain) {}

void _testMain() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    app.mainCommon();
  });
}

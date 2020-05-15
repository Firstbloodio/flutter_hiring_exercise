import 'package:flutter_test/flutter_test.dart';
import 'utils.dart';

void main() {
  testWidgets('Can navigate to profile tab', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(await TestUtils.createApp());

    // TODO: do the test
  });

  testWidgets('Can register with valid user', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(await TestUtils.createApp());

    // TODO: do the login test
  });

  testWidgets('Can login with a valid user', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(await TestUtils.createApp());

    // TODO: do the login test
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:share_prompt/main.dart';

void main() {
  testWidgets('아이디와 비밀번호를 입력할 수 있다', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final fields = find.byType(TextField);
    expect(fields, findsNWidgets(2));

    await tester.enterText(fields.at(0), 'test-user');
    await tester.enterText(fields.at(1), 'password');

    expect(
      tester.widget<TextField>(fields.at(0)).controller?.text,
      'test-user',
    );
    expect(tester.widget<TextField>(fields.at(1)).controller?.text, 'password');
    expect(tester.widget<TextField>(fields.at(1)).obscureText, isTrue);

    await tester.tap(find.byIcon(Icons.visibility_off_outlined));
    await tester.pump();

    expect(tester.widget<TextField>(fields.at(1)).obscureText, isFalse);
  });
}

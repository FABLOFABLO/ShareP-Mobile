import 'package:flutter/material.dart' show Size;
import 'package:flutter_test/flutter_test.dart';
import 'package:share_prompt/main.dart';
import 'package:share_prompt/page/onbording/on_bording1_page.dart';
import 'package:share_prompt/page/onbording/on_bording2_page.dart';

void main() {
  testWidgets('다음 버튼을 누르면 두 번째 온보딩 화면으로 이동한다', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(430, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    expect(find.byType(OnBording1), findsOneWidget);

    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();

    expect(find.byType(OnBording2Page), findsOneWidget);
  });
}

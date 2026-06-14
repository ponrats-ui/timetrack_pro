import 'package:flutter_test/flutter_test.dart';

import 'package:timetrack_pro/main.dart';

void main() {
  testWidgets('TimeTrack Pro starts on record screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TimeTrackPro());

    expect(find.text('TimeTrack Pro'), findsOneWidget);
    expect(find.text('บันทึกเวลาทำงาน'), findsOneWidget);
  });
}

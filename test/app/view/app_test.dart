import 'package:flutter_test/flutter_test.dart';
import 'package:ui_samples_practice/app/app.dart';
import 'package:ui_samples_practice/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}

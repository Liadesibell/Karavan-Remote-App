import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karavan_kontrol/main.dart';

void main() {
  testWidgets('dashboard shows all controls and toggles switches', (
    tester,
  ) async {
    await tester.pumpWidget(const KaravanApp());

    expect(find.text('KARAVAN KONTROL SİSTEMİ'), findsNothing);
    expect(find.text('Yol senin.'), findsNothing);
    expect(find.text('Her şey'), findsNothing);
    expect(find.text('kontrol altında.'), findsNothing);
    expect(find.text('CANLI'), findsNothing);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.semanticLabel == 'Makronix Teknoloji logosu',
      ),
      findsOneWidget,
    );
    expect(find.text('Akü seviyesi'), findsOneWidget);
    expect(find.text('TEMİZ SU'), findsOneWidget);
    expect(find.text('İÇ SICAKLIK'), findsOneWidget);
    expect(find.byType(Slider), findsNWidgets(4));
    expect(
      tester
          .widgetList<Slider>(find.byType(Slider))
          .map(
              (slider) => SliderTheme.of(tester.element(find.byWidget(slider))))
          .map((theme) => theme.activeTrackColor)
          .toList(),
      [
        const Color(0xFF94E8F9),
        const Color(0xFFA6E8AD),
        const Color(0xFFC979F2),
        const Color(0xFFFF8585),
      ],
    );

    await tester.scrollUntilVisible(
      find.text('Su ısıtıcısı'),
      400,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    expect(find.byType(Switch), findsNWidgets(16));

    final lastSwitch = find.byType(Switch).last;
    await tester.ensureVisible(lastSwitch);
    await tester.pumpAndSettle();
    await tester.tap(lastSwitch);
    await tester.pumpAndSettle();

    expect(tester.widget<Switch>(lastSwitch).value, isTrue);
  });
}

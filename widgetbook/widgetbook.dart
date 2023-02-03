import 'package:flutter/material.dart';
import 'package:ui_samples_practice/counter/counter.dart';
import 'package:ui_samples_practice/l10n/l10n.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      categories: [
        WidgetbookCategory(
          name: 'Real Estates Mobile App',
          widgets: [
            WidgetbookComponent(
              name: 'Home',
              useCases: [
                WidgetbookUseCase(
                  name: 'Featured',
                  builder: (context) {
                    return const Featured();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      appInfo: AppInfo(name: 'UI samples practice'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

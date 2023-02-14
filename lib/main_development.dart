import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_samples_practice/bootstrap.dart';
import 'package:ui_samples_practice/habitica/habitica.dart';

void main() {
  bootstrap(() => const ProviderScope(child: HabiticaApp()));
}

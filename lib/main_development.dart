import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_samples_practice/app/app.dart';
import 'package:ui_samples_practice/bootstrap.dart';

void main() {
  bootstrap(() => const ProviderScope(child: App()));
}

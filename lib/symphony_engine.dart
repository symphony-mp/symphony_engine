/// An open source music player that contains the main
/// local and offline features.
library;

import 'dart:developer';

import 'package:soft_metatags/soft_metatags.dart';

export 'entities.dart';
export 'repositories.dart';
export 'services.dart';

/// [SymphonyEngine] library;
final class SymphonyEngine {
  const SymphonyEngine._();

  /// Initializes the [SymphonyEngine] library.
  static Future<void> initialize() async {
    await SoftMetaTags.initialize();
    log('Initialized!', name: 'SymphonyEngine');
  }

  /// Disposes the [SymphonyEngine] library.
  static Future<void> dispose() async {
    SoftMetaTags.dispose();
    log('Disposed!', name: 'SymphonyEngine');
  }
}

import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:xdg_directories/xdg_directories.dart';

part 'macos_directory_service.dart';
part 'linux_directory_service.dart';
part 'windows_directory_service.dart';

/// Service to retrieve the user's main directories.
abstract final class DirectoryService {
  const DirectoryService();

  factory DirectoryService.create() => switch (Platform.operatingSystem) {
    'macos' => const MacOSDirectoryService(),
    'linux' => const LinuxDirectoryService(),
    'windows' => const WindowsDirectoryService(),
    String() => throw UnimplementedError(),
  };

  /// Get the user's music directory.
  Future<Directory?> getMusic();

  /// Get the user's downloads directory.
  Future<Directory?> getDownloads();
}

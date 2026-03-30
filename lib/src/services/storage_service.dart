import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:symphony_engine/src/domain/enums/file_extension_enum.dart';

/// Service to handle storage and common system paths.
abstract final class StorageService {
  /// Creates a new [StorageService].
  const StorageService();

  /// List files from a [Directory] by filtering by [FileExtensionEnum].
  Stream<File> getFiles(
    Directory directory, {
    List<FileExtensionEnum>? extensions,
  });
}

/// Default implementation of [StorageService].
final class DefaultStorageService extends StorageService {
  /// Creates a new [DefaultStorageService].
  const DefaultStorageService();

  @override
  Stream<File> getFiles(
    Directory directory, {
    List<FileExtensionEnum>? extensions,
  }) {
    final Stream<FileSystemEntity> stream;
    if (extensions == null || extensions.isEmpty) {
      stream = directory.list(recursive: true);
    } else {
      stream = directory.list(recursive: true).where((entity) {
        final ext = _getFileExtension(entity.path);
        return extensions.any((e) => ext == e.name);
      });
    }

    return stream.map((e) => File(e.path));
  }

  String _getFileExtension(String path) =>
      p.extension(path).replaceFirst('.', '').toLowerCase().trim();
}

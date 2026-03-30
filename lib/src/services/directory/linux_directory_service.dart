part of 'directory_service.dart';

/// Linux implementation of [DirectoryService].
final class LinuxDirectoryService extends DirectoryService {
  /// Creates a new [LinuxDirectoryService].
  const LinuxDirectoryService();

  @override
  Future<Directory?> getMusic() async => getUserDirectory('MUSIC');

  @override
  Future<Directory?> getDownloads() async => getUserDirectory('DOWNLOAD');
}

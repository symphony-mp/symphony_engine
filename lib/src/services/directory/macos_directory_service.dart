part of 'directory_service.dart';

/// macOS implementation of [DirectoryService].
final class MacOSDirectoryService extends DirectoryService {
  /// Creates a new [MacOSDirectoryService].
  const MacOSDirectoryService();

  @override
  Future<Directory?> getMusic() async => _getDir('Music');

  @override
  Future<Directory?> getDownloads() async => _getDir('Downloads');

  Future<Directory?> _getDir(String name) async {
    final result = await Process.run('echo', ['~/$name']);

    final stdout = result.stdout.toString();
    if (stdout.isEmpty) return null;

    return Directory(p.normalize(stdout));
  }
}

part of 'directory_service.dart';

/// Windows implementation of [DirectoryService].
final class WindowsDirectoryService extends DirectoryService {
  /// Creates a new [WindowsDirectoryService].
  const WindowsDirectoryService();

  @override
  Future<Directory?> getMusic() async => _getDir('MyMusic');

  @override
  Future<Directory?> getDownloads() async => _getDir('Downloads');

  Future<Directory?> _getDir(String name) async {
    final result = await Process.run('powershell.exe', [
      '--command',
      '[System.Environment]::GetFolderPath("$name")',
    ]);

    final stdout = result.stdout.toString();
    if (stdout.isEmpty) return null;

    return Directory(p.normalize(stdout));
  }
}

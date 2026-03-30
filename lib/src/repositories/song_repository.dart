import 'package:symphony_engine/src/domain/enums/file_extension_enum.dart';
import 'package:symphony_engine/symphony_engine.dart';

/// Repository to manage the music library.
abstract class SongRepository {
  /// Creates a new [SongRepository].
  const SongRepository();

  /// Returns the songs with metadata from the user's local library.
  Future<Iterable<SongEntity>?> getFromLibrary();
}

/// Default implementation of [SongRepository].
final class DefaultSongRepository implements SongRepository {
  /// Creates a new [DefaultSongRepository].
  const DefaultSongRepository(
    this._storage,
    this._metadata,
    this._directory,
  );

  final StorageService _storage;
  final MetadataService _metadata;
  final DirectoryService _directory;

  @override
  Future<Iterable<SongEntity>?> getFromLibrary() async {
    final musicDir = await _directory.getMusic();
    if (musicDir == null) return null;

    final files = await _storage
        .getFiles(musicDir, extensions: FileExtensionEnum.values)
        .toList();

    final songs = await _metadata.readAll(files);
    return songs.map(SongEntity.from);
  }
}

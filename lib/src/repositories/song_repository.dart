import 'package:symphony_engine/src/domain/enums/file_extension_enum.dart';
import 'package:symphony_engine/symphony_engine.dart';

/// [SongRepository] to manage the music library.
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
    this._storageService,
    this._metadataService,
  );

  final StorageService _storageService;
  final MetadataService _metadataService;

  @override
  Future<Iterable<SongEntity>?> getFromLibrary() async {
    final musicDir = await _storageService.getMusicDir();
    if (musicDir == null) return null;

    final files = await _storageService
        .getFiles(musicDir, extensions: FileExtensionEnum.values)
        .toList();

    final songs = await _metadataService.readAll(files);
    return songs.map(SongEntity.from);
  }
}

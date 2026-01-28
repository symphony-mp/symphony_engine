import 'package:symphony_engine/src/domain/entities/song_entity.dart';

/// Playlist entity.
final class PlaylistEntity {
  /// Creates a new [PlaylistEntity].
  const PlaylistEntity({
    required this.name,
    required this.description,
    this.songCount = 0,
    this.duration = .zero,
    this.songs = const [],
    this.cover,
  });

  /// Playlist name.
  final String name;

  /// Playlist description.
  final String description;

  /// Playlist song count.
  final int songCount;

  /// Playlist duration.
  final Duration duration;

  /// Playlist songs.
  final List<SongEntity> songs;

  /// Playlist cover.
  final Uri? cover;
}

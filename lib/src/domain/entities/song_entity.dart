import 'package:symphony_engine/src/domain/entities/album_entity.dart';
import 'package:symphony_engine/src/domain/entities/artist_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/song_meta_entity.dart';

/// Song entity.
final class SongEntity {
  /// Creates a new [SongEntity].
  const SongEntity({
    required this.title,
    this.duration = .zero,
    this.albums = const [],
    this.artists = const [],
  });

  /// Creates a new [SongEntity] from a [SongMetaEntity].
  factory SongEntity.from(SongMetaEntity song) => SongEntity(
    title: song.title,
    duration: song.duration,
    albums: song.albums?.map(AlbumEntity.from).toList() ?? [],
    artists: song.artists?.map(ArtistEntity.from).toList() ?? [],
  );

  /// Song title.
  final String title;

  /// Song duration.
  final Duration duration;

  /// Song albums.
  final List<AlbumEntity> albums;

  /// Song artists.
  final List<ArtistEntity> artists;

  /// Returns the artists as a string.
  String get artistsString => artists.map((a) => a.name).join(', ');

  /// Returns the main album.
  AlbumEntity? get mainAlbum => albums.isNotEmpty ? albums.first : null;

  /// Returns the main artist.
  ArtistEntity? get mainArtist => artists.isNotEmpty ? artists.first : null;
}

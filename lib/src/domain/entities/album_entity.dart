import 'package:symphony_engine/src/domain/entities/artist_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/album_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/song_entity.dart';

/// Album entity.
final class AlbumEntity {
  /// Creates a new [AlbumEntity].
  const AlbumEntity({
    this.title,
    this.artwork,
    this.songs = const [],
    this.artists = const [],
  });

  /// Creates a new [AlbumEntity] from a [AlbumMetaEntity].
  factory AlbumEntity.from(AlbumMetaEntity album) => AlbumEntity(
    title: album.title,
    artwork: album.artwork,
    artists: album.artists?.map(ArtistEntity.from).toList() ?? [],
  );

  /// Album title.
  final String? title;

  /// Album artwork.
  final Uri? artwork;

  /// Album songs.
  final List<SongEntity> songs;

  /// Album artists.
  final List<ArtistEntity> artists;

  /// Returns the artists as a string.
  String get artistsString => artists.map((a) => a.name).join(', ');

  /// Returns the main artist.
  ArtistEntity? get mainArtist => artists.isNotEmpty ? artists.first : null;
}

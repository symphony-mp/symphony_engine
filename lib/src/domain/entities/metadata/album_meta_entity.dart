import 'package:symphony_engine/src/domain/entities/metadata/artist_meta_entity.dart';

/// Album metadata entity.
final class AlbumMetaEntity {
  /// Creates a new [AlbumMetaEntity].
  const AlbumMetaEntity({
    this.title,
    this.artwork,
    this.artists,
  });

  /// Album title.
  final String? title;

  /// Album artwork.
  final Uri? artwork;

  /// Album artists.
  final List<ArtistMetaEntity>? artists;
}

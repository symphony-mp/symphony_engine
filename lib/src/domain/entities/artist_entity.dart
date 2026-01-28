import 'package:symphony_engine/src/domain/entities/album_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/artist_meta_entity.dart';

/// Artist entity.
final class ArtistEntity {
  /// Creates a new [ArtistEntity].
  const ArtistEntity({
    this.name,
    this.cover,
    this.picture,
    this.albums = const [],
  });

  /// Creates a new [ArtistEntity] from a [ArtistMetaEntity].
  factory ArtistEntity.from(ArtistMetaEntity artist) => ArtistEntity(
    name: artist.name,
    picture: artist.picture,
  );

  /// Artist name.
  final String? name;

  /// Artist cover.
  final Uri? cover;

  /// Artist picture.
  final Uri? picture;

  /// Artist albums.
  final List<AlbumEntity> albums;
}

/// Artist metadata entity.
final class ArtistMetaEntity {
  /// Creates a new [ArtistMetaEntity].
  const ArtistMetaEntity({
    this.name,
    this.picture,
  });

  /// Artist name.
  final String? name;

  /// Artist picture.
  final Uri? picture;
}

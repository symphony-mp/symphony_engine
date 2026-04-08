import 'dart:io';

import 'package:soft_metatags/soft_metatags.dart';
import 'package:symphony_engine/src/domain/entities/metadata/album_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/artist_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/disc_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/genre_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/song_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/track_meta_entity.dart';

/// Service for handling audio file metadata.
abstract final class MetadataService {
  /// Creates a new [MetadataService].
  const MetadataService();

  /// Reads the metadata from a [File].
  Future<SongMetaEntity?> read(File file);

  /// Reads the metadata from a [List] of [File].
  Future<Iterable<SongMetaEntity>> readAll(List<File> files);

  /// Disposes this [MetadataService].
  Future<void> dispose();
}

/// [DefaultMetadataService] is the implementation
/// based on the [SoftMetaTags] package.
final class DefaultMetadataService implements MetadataService {
  /// Creates a new [DefaultMetadataService].
  const DefaultMetadataService();

  @override
  Future<SongMetaEntity?> read(File file) async {
    final meta = await SoftMetaTags.instance.read(file);
    if (meta == null) return null;

    return SongMetaEntity(
      file: meta.file,
      bpm: meta.bpm,
      year: meta.year,
      date: meta.date,
      isrc: meta.isrc,
      mood: meta.mood,
      title: meta.title,
      label: meta.label,
      lyrics: meta.lyrics,
      comment: meta.comment,
      barcode: meta.barcode,
      composer: meta.composer,
      lyricist: meta.lyricist,
      duration: meta.duration,
      performer: meta.performer,
      conductor: meta.conductor,
      copyright: meta.copyright,
      encodedBy: meta.encodedBy,
      disc: _getDisc(meta.disc),
      track: _getTrack(meta.track),
      albums: _getAlbums(meta.albums),
      genres: _getGenres(meta.genres),
      catalogNumber: meta.catalogNumber,
      artists: _getArtists(meta.artists),
    );
  }

  @override
  Future<Iterable<SongMetaEntity>> readAll(List<File> files) async {
    final songs = await SoftMetaTags.instance.readAll(files);
    return songs.map(
      (s) => SongMetaEntity(
        file: s.file,
        bpm: s.bpm,
        year: s.year,
        date: s.date,
        isrc: s.isrc,
        mood: s.mood,
        title: s.title,
        label: s.label,
        lyrics: s.lyrics,
        comment: s.comment,
        barcode: s.barcode,
        composer: s.composer,
        lyricist: s.lyricist,
        duration: s.duration,
        performer: s.performer,
        conductor: s.conductor,
        copyright: s.copyright,
        encodedBy: s.encodedBy,
        disc: _getDisc(s.disc),
        track: _getTrack(s.track),
        albums: _getAlbums(s.albums),
        genres: _getGenres(s.genres),
        catalogNumber: s.catalogNumber,
        artists: _getArtists(s.artists),
      ),
    );
  }

  DiscMetaEntity? _getDisc(DiscMetaTag? disc) {
    if (disc == null) return null;
    return DiscMetaEntity(
      total: disc.total,
      number: disc.number,
    );
  }

  TrackMetaEntity? _getTrack(TrackMetaTag? track) {
    if (track == null) return null;
    return TrackMetaEntity(
      total: track.total,
      number: track.number,
    );
  }

  List<GenreMetaEntity>? _getGenres(Iterable<GenreMetaTag>? genres) {
    if (genres == null) return null;
    return genres.map((g) => GenreMetaEntity(name: g.name)).toList();
  }

  List<AlbumMetaEntity>? _getAlbums(Iterable<AlbumMetaTag>? albums) {
    if (albums == null) return null;
    return albums.map((a) {
      return AlbumMetaEntity(
        title: a.title,
        artwork: a.artwork,
        artists: _getArtists(a.artists)?.toList(),
      );
    }).toList();
  }

  List<ArtistMetaEntity>? _getArtists(Iterable<ArtistMetaTag>? artists) {
    if (artists == null) return null;
    return artists
        .map((a) => ArtistMetaEntity(name: a.name, picture: a.picture))
        .toList();
  }

  @override
  Future<void> dispose() async {}
}

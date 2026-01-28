import 'dart:io';

import 'package:symphony_engine/src/domain/entities/metadata/album_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/artist_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/disc_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/genre_meta_entity.dart';
import 'package:symphony_engine/src/domain/entities/metadata/track_meta_entity.dart';

/// Song metadata entity.
final class SongMetaEntity {
  /// Creates a new [SongMetaEntity].
  const SongMetaEntity({
    required this.file,
    required this.title,
    required this.duration,
    this.bpm,
    this.year,
    this.date,
    this.disc,
    this.isrc,
    this.mood,
    this.track,
    this.label,
    this.lyrics,
    this.albums,
    this.genres,
    this.comment,
    this.barcode,
    this.artists,
    this.composer,
    this.lyricist,
    this.performer,
    this.conductor,
    this.copyright,
    this.encodedBy,
    this.catalogNumber,
  });

  /// Song file.
  final File file;

  /// Song bpm.
  final int? bpm;

  /// Song year.
  final int? year;

  /// Song ISRC.
  final String? isrc;

  /// Song mood.
  final String? mood;

  /// Song title.
  final String title;

  /// Song label.
  final String? label;

  /// Song lyrics.
  final String? lyrics;

  /// Song date.
  final DateTime? date;

  /// Song comment.
  final String? comment;

  /// Song barcode.
  final String? barcode;

  /// Song composer.
  final String? composer;

  /// Song lyricist.
  final String? lyricist;

  /// Song performer.
  final String? performer;

  /// Song conductor.
  final String? conductor;

  /// Song duration.
  final Duration duration;

  /// Song copyright.
  final String? copyright;

  /// Song encoded by.
  final String? encodedBy;

  /// Song catalog number.
  final int? catalogNumber;

  /// Song disc.
  final DiscMetaEntity? disc;

  /// Song track.
  final TrackMetaEntity? track;

  /// Song genres.
  final List<GenreMetaEntity>? genres;

  /// Song albums.
  final List<AlbumMetaEntity>? albums;

  /// Song artists.
  final List<ArtistMetaEntity>? artists;

  /// Returns the main album.
  AlbumMetaEntity? get mainAlbum => albums?.firstOrNull;

  /// Returns the main genre.
  GenreMetaEntity? get mainGenre => genres?.firstOrNull;

  /// Returns the main artist.
  ArtistMetaEntity? get mainArtist => artists?.firstOrNull;
}

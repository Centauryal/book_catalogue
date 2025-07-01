import 'dart:convert';

import '../../../domain/entities/book_model.dart';
import '../../utils/json.dart';

class BooksResponse {
  const BooksResponse({this.count, this.next, this.previous, this.resultsBook});

  factory BooksResponse.fromJson(Map<String, dynamic> json) {
    final List<Book>? resultsBook = json['results'] is List ? <Book>[] : null;
    if (resultsBook != null) {
      for (final dynamic item in json['results']! as List<dynamic>) {
        if (item != null) {
          resultsBook.add(Book.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return BooksResponse(
      count: asT<int>(json['count']),
      next: asT<String>(json['next']),
      previous: asT<Object>(json['previous']),
      resultsBook: resultsBook,
    );
  }

  final int? count;
  final String? next;
  final Object? previous;
  final List<Book>? resultsBook;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'count': count,
    'next': next,
    'previous': previous,
    'results': resultsBook,
  };
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      count.hashCode ^
      next.hashCode ^
      previous.hashCode ^
      resultsBook.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is BooksResponse &&
            count == other.count &&
            next == other.next &&
            previous == other.previous &&
            resultsBook == other.resultsBook;
  }
}

class Book {
  const Book({
    this.id,
    this.title,
    this.authors,
    this.summaries,
    this.copyright,
    this.mediaType,
    this.downloadCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final List<Authors>? authors = json['authors'] is List ? <Authors>[] : null;
    if (authors != null) {
      for (final dynamic item in json['authors']! as List<dynamic>) {
        if (item != null) {
          authors.add(Authors.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }

    final List<String>? summaries = json['summaries'] is List
        ? <String>[]
        : null;
    if (summaries != null) {
      for (final dynamic item in json['summaries']! as List<dynamic>) {
        if (item != null) {
          summaries.add(asT<String>(item)!);
        }
      }
    }
    return Book(
      id: asT<int>(json['id']),
      title: asT<String>(json['title']),
      authors: authors,
      summaries: summaries,
      copyright: asT<bool>(json['copyright']),
      mediaType: asT<String>(json['media_type']),
      downloadCount: asT<int>(json['download_count']),
    );
  }

  final int? id;
  final String? title;
  final List<Authors>? authors;
  final List<String>? summaries;
  final bool? copyright;
  final String? mediaType;
  final int? downloadCount;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'authors': authors,
    'summaries': summaries,
    'copyright': copyright,
    'media_type': mediaType,
    'download_count': downloadCount,
  };
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      id.hashCode ^
      title.hashCode ^
      authors.hashCode ^
      summaries.hashCode ^
      copyright.hashCode ^
      mediaType.hashCode ^
      downloadCount.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Book &&
            id == other.id &&
            title == other.title &&
            authors == other.authors &&
            summaries == other.summaries &&
            copyright == other.copyright &&
            mediaType == other.mediaType &&
            downloadCount == other.downloadCount;
  }
}

class Authors {
  const Authors({this.name, this.birthYear, this.deathYear});

  factory Authors.fromJson(Map<String, dynamic> json) => Authors(
    name: asT<String>(json['name']),
    birthYear: asT<int>(json['birth_year']),
    deathYear: asT<int>(json['death_year']),
  );

  final String? name;
  final int? birthYear;
  final int? deathYear;

  AuthorsModel toAuthorModel() =>
      AuthorsModel(name: name, birthYear: birthYear, deathYear: deathYear);

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'birth_year': birthYear,
    'death_year': deathYear,
  };
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      name.hashCode ^
      birthYear.hashCode ^
      deathYear.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Authors &&
            name == other.name &&
            birthYear == other.birthYear &&
            deathYear == other.deathYear;
  }
}

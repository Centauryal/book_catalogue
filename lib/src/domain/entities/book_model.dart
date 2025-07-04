import 'package:book_catalogue/src/utils/string_extension.dart';

class ListBookModel {
  ListBookModel({this.count, this.data, this.next, this.previous});

  final int? count;
  final List<BookModel>? data;
  final String? next;
  final String? previous;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListBookModel &&
          runtimeType == other.runtimeType &&
          count == other.count &&
          data == other.data &&
          next == other.next &&
          previous == other.previous;

  @override
  int get hashCode =>
      count.hashCode ^ data.hashCode ^ next.hashCode ^ previous.hashCode;

  ListBookModel copyWith({
    int? count,
    List<BookModel>? data,
    String? next,
    String? previous,
  }) {
    return ListBookModel(
      count: count ?? this.count,
      data: data ?? this.data,
      next: next ?? this.next,
      previous: previous ?? this.previous,
    );
  }
}

class BookModel {
  const BookModel({
    this.id,
    this.title,
    this.authors,
    this.author,
    this.summaries,
    this.summary,
    this.copyright,
    this.mediaType,
    this.downloadCount,
  });

  final int? id;
  final String? title;
  final List<AuthorsModel>? authors;
  final String? author;
  final List<String>? summaries;
  final String? summary;
  final bool? copyright;
  final String? mediaType;
  final int? downloadCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          authors == other.authors &&
          author == other.author &&
          summaries == other.summaries &&
          summary == other.summary &&
          copyright == other.copyright &&
          mediaType == other.mediaType &&
          downloadCount == other.downloadCount;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      authors.hashCode ^
      author.hashCode ^
      summaries.hashCode ^
      summary.hashCode ^
      copyright.hashCode ^
      mediaType.hashCode ^
      downloadCount.hashCode;

  @override
  String toString() {
    return 'BookModel{'
        ' id: $id,'
        ' title: $title,'
        ' authors: $authors,'
        ' author: $author,'
        ' summaries: $summaries,'
        ' copyright: $copyright,'
        ' mediaType: $mediaType,'
        ' downloadCount: $downloadCount,'
        '}';
  }

  BookModel copyWith({
    int? id,
    String? title,
    List<AuthorsModel>? authors,
    String? author,
    List<String>? summaries,
    String? summary,
    bool? copyright,
    String? mediaType,
    int? downloadCount,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      author: author ?? this.author,
      summaries: summaries ?? this.summaries,
      summary: summary ?? this.summary,
      copyright: copyright ?? this.copyright,
      mediaType: mediaType ?? this.mediaType,
      downloadCount: downloadCount ?? this.downloadCount,
    );
  }

  Map<String, dynamic> toMap() {
    final authors = this.authors;
    final isAuthors = authors?.isEmpty == true || authors == null;
    final authorRemote = isAuthors ? '-' : authors.first.name;
    final authorValue = isAuthors ? author : authorRemote;

    final summaries = this.summaries;
    final isSummaries = summaries?.isEmpty == true || summaries == null;
    final summariesRemote = isSummaries ? '-' : summaries.first.decodeApiHtml();
    final summariesValue = isSummaries ? summary : summariesRemote;
    return {
      'id': id,
      'title': title,
      'authors': authorValue,
      'summaries': summariesValue,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] as int,
      title: map['title'] as String,
      author: map['authors'] as String,
      summary: map['summaries'] as String,
    );
  }
}

class AuthorsModel {
  const AuthorsModel({this.name, this.birthYear, this.deathYear});

  final String? name;
  final int? birthYear;
  final int? deathYear;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthorsModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          birthYear == other.birthYear &&
          deathYear == other.deathYear);

  @override
  int get hashCode => name.hashCode ^ birthYear.hashCode ^ deathYear.hashCode;

  @override
  String toString() {
    return 'AuthorsModel{'
        ' name: $name,'
        ' birthYear: $birthYear,'
        ' deathYear: $deathYear,'
        '}';
  }

  AuthorsModel copyWith({String? name, int? birthYear, int? deathYear}) {
    return AuthorsModel(
      name: name ?? this.name,
      birthYear: birthYear ?? this.birthYear,
      deathYear: deathYear ?? this.deathYear,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'birthYear': birthYear, 'deathYear': deathYear};
  }

  factory AuthorsModel.fromMap(Map<String, dynamic> map) {
    return AuthorsModel(
      name: map['name'] as String,
      birthYear: map['birthYear'] as int,
      deathYear: map['deathYear'] as int,
    );
  }
}

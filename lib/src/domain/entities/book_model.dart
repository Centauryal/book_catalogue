class ListBookModel {
  ListBookModel({this.data});
  final List<BookModel>? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListBookModel &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

class BookModel {
  BookModel({
    this.id,
    this.title,
    this.authors,
    this.summaries,
    this.copyright,
    this.mediaType,
    this.downloadCount,
  });

  final int? id;
  final String? title;
  final List<AuthorsModel>? authors;
  final List<String>? summaries;
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
          summaries == other.summaries &&
          copyright == other.copyright &&
          mediaType == other.mediaType &&
          downloadCount == other.downloadCount;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      authors.hashCode ^
      summaries.hashCode ^
      copyright.hashCode ^
      mediaType.hashCode ^
      downloadCount.hashCode;
}

class AuthorsModel {
  AuthorsModel({this.name, this.birthYear, this.deathYear});

  final String? name;
  final int? birthYear;
  final int? deathYear;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorsModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          birthYear == other.birthYear &&
          deathYear == other.deathYear;

  @override
  int get hashCode => name.hashCode ^ birthYear.hashCode ^ deathYear.hashCode;
}

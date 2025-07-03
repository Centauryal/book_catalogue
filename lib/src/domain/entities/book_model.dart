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

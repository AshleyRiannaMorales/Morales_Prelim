class Movie {
  final String title;
  final String genre;
  final int year;
  bool isWatched;
  int? rating;

  Movie({
    required this.title,
    required this.genre,
    required this.year,
    this.isWatched = false,
    this.rating,
  });

  // Custom toString() method to format output
  @override
  String toString() {
    return '''
\n${title} (${year})
Genre: ${genre}
Watched: ${isWatched ? 'Yes' : 'No'}
Rating: ${isWatched && rating != null ? '$rating out of 5 stars' : 'N/A'}
''';
  }
}

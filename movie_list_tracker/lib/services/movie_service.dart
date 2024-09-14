import 'package:movie_list_tracker/models/movie_model.dart';

class MovieService {
  final List<Movie> _movies = [];

  // Add a movie to the collection
  void addMovie(Movie movie) {
    _movies.add(movie);
    print('${movie.title} has been added.');
  }

  // Remove a movie by title
  void removeMovie(String title) {
    _movies.removeWhere((movie) => movie.title == title);
    print('$title has been removed.');
  }

  // Display all movies
  void displayMovies() {
    if (_movies.isEmpty) {
      print('No movies in the collection.');
    } else {
      print('\nMovies in your collection:');
      for (var movie in _movies) {
        print(movie.toString());
      }
    }
  }

  // Display movies by genre
  void displayMoviesByGenre(String genre) {
    final moviesByGenre = _movies
        .where((movie) => movie.genre.toLowerCase() == genre.toLowerCase())
        .toList();
    if (moviesByGenre.isEmpty) {
      print('No movies found in the genre: $genre');
    } else {
      print('\nMovies in the genre $genre:');
      for (var movie in moviesByGenre) {
        print(movie.toString());
      }
    }
  }

  // Update watch status
  void updateWatchStatus(String title, bool isWatched) {
    final movie = _movies.firstWhere((movie) => movie.title == title,
        orElse: () => Movie(title: '', genre: '', year: 0));
    if (movie.title != '') {
      movie.isWatched = isWatched;
      print(
          '${movie.title} watch status updated to ${isWatched ? 'Watched' : 'Unwatched'}.');
    } else {
      print('Movie not found.');
    }
  }

  // Search for a movie by title and return the Movie object
  Movie? searchMovieByTitle(String title) {
    try {
      return _movies.firstWhere(
        (movie) => movie.title.toLowerCase() == title.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  // Rate a movie
  void rateMovie(String title, int rating) {
    final movie = _movies.firstWhere((movie) => movie.title == title,
        orElse: () => Movie(title: '', genre: '', year: 0));
    if (movie.title != '') {
      if (movie.isWatched) {
        movie.rating = rating;
        print('${movie.title} has been rated $rating out of 5 stars.');
      } else {
        print('You can only rate watched movies.');
      }
    } else {
      print('Movie not found.');
    }
  }

  // Search for a movie by title
  void searchMovie(String title) {
    final movie = _movies.firstWhere(
        (movie) => movie.title.toLowerCase() == title.toLowerCase(),
        orElse: () => Movie(title: '', genre: '', year: 0));
    if (movie.title != '') {
      print('\nMovie found: ${movie.toString()}');
    } else {
      print('Movie not found.');
    }
  }
}

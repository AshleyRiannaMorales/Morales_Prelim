import 'dart:io';
import 'package:movie_list_tracker/models/movie_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:movie_list_tracker/providers.dart';

void main() {
  final container = ProviderContainer();
  final movieService = container.read(movieServiceProvider);

  while (true) {
    print('\n--- Movie Collection Tracker ---');
    print('1. Add a Movie');
    print('2. Remove a Movie');
    print('3. Display All Movies');
    print('4. Display Movies by Genre');
    print('5. Update Watch Status');
    print('6. Rate a Movie');
    print('7. Search for a Movie');
    print('8. Exit');
    print('--- Enter an option below.');

    var input = stdin.readLineSync();

    switch (input) {
      case '1':
        // Add a Movie
        stdout.write('\nEnter movie title: ');
        var title = stdin.readLineSync()!;
        stdout.write('Enter genre: ');
        var genre = stdin.readLineSync()!;
        stdout.write('Enter year: ');
        var year = int.parse(stdin.readLineSync()!);
        movieService.addMovie(Movie(title: title, genre: genre, year: year));

        stdout.write('\nHave you watched the movie? (Y/N): ');
        var isWatched = stdin.readLineSync();
        if (isWatched == 'Y') {
          movieService.updateWatchStatus(title, true);
        } else {
          movieService.updateWatchStatus(title, false);
        }
        break;

      case '2':
        // Remove a Movie
        stdout.write('\nEnter movie title to remove: ');
        var title = stdin.readLineSync()!;
        movieService.removeMovie(title);
        break;

      case '3':
        // Display all movies
        movieService.displayMovies();
        break;

      case '4':
        // Display movies by genre
        stdout.write('\nEnter genre: ');
        var genre = stdin.readLineSync()!;
        movieService.displayMoviesByGenre(genre);
        break;

      case '5':
        // Update watch status
        stdout.write('\nEnter movie title: ');
        var title = stdin.readLineSync()!;
        stdout.write('Have you watched the movie? (Y/N): ');
        var isWatched = stdin.readLineSync();
        movieService.updateWatchStatus(title, isWatched == 'Y');
        break;

      case '6':
        // Rate a movie
        stdout.write('\nEnter movie title: ');
        var title = stdin.readLineSync()!;

        // Search for the movie and check its watch status
        final movie = movieService.searchMovieByTitle(title);
        if (movie == null) {
          print('Movie not found.');
        } else if (movie.isWatched) {
          stdout.write('Enter your rating (1 - 5 stars): ');
          var rating = int.parse(stdin.readLineSync()!);
          movieService.rateMovie(title, rating);
        } else {
          print('You can only rate watched movies.');
        }
        break;

      case '7':
        // Search for a movie
        stdout.write('\nEnter movie title: ');
        var title = stdin.readLineSync()!;
        movieService.searchMovie(title);
        break;

      case '8':
        print('Exiting...');
        exit(0);

      default:
        print('Invalid option. Please try again.');
    }
  }
}

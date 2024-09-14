import 'package:riverpod/riverpod.dart';
import 'services/movie_service.dart'; // Import the MovieService

// Global provider for MovieService
final movieServiceProvider = Provider<MovieService>((ref) {
  return MovieService();
});

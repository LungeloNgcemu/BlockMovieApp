import 'package:equatable/equatable.dart';

class MovieDetailsState extends Equatable {
  final bool isLoading;
  final String? title;
  final String? overview;
  final String? error;

  const MovieDetailsState({
    this.isLoading = false,
    this.title,
    this.overview,
    this.error,
  });

  MovieDetailsState copyWith({
    bool? isLoading,
    String? title,
    String? overview,
    String? error,
  }) {
    return MovieDetailsState(
      isLoading: isLoading ?? this.isLoading,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        title,
        overview,
        error,
      ];
}

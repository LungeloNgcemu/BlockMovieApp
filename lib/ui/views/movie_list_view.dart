import 'package:block_movie_app/core/block/movie_details_block/movie_details_block.dart';
import 'package:block_movie_app/core/block/movie_list_block/movie_list_block.dart';
import 'package:block_movie_app/core/block/movie_list_block/movie_list_state.dart';
import 'package:block_movie_app/core/services/movie_service.dart';
import 'package:block_movie_app/ui/views/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key});

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieListBloc, MovieListState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Text('Movie List'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: 100,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => MovieDetailsBloc(
                                    id: state.movies[index].id.toString(),
                                    movieService: MovieService(),
                                  ),
                                  child: const MovieDetailsView(),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Movie ${state.movies[index].title}'),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

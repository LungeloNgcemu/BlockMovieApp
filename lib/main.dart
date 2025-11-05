import 'package:block_movie_app/core/block/movie_list_block/movie_list_block.dart';
import 'package:block_movie_app/core/block/movie_list_block/movie_list_event.dart';
import 'package:block_movie_app/core/services/movie_service.dart';
import 'package:block_movie_app/ui/views/movie_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                MovieListBloc(MovieService())..add(FetchMovies()),
          )
        ],
        child: MovieListView(),
      ),
    );
  }
}

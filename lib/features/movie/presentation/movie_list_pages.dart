import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:testcase/features/movie/presentation/components/movie_items.dart';

class MovieListPages extends StatefulWidget {
  MovieListPages({Key? key}) : super(key: key);

  @override
  State<MovieListPages> createState() => _MovieListPagesState();
}

class _MovieListPagesState extends State<MovieListPages> {
  bool isLastPage = false;

  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(const GetAllMoviesEvent(page: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Top Trending"),
      ),
      body: BlocConsumer<MovieBloc, MovieState>(
        listener: (context, state) {
          if (state is NextPageState) {
            isLastPage = false;
          } else if (state is LastPageState) {
            isLastPage = true;
          }
        },
        builder: (context, state) {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is MovieLoadingState)
                    Container(
                        child: const Center(child: CircularProgressIndicator()))
                  else if (state is MovieLoadedState)
                    Expanded(child: BuildMovieList(state))
                  else if (state is NoInternetConnectionState)
                    Container(
                      child: Center(
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const Icon(Icons.signal_wifi_off_rounded),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("No Internet Connection"),
                          const SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<MovieBloc>(context)
                                    .add(RefreshGetMovies());
                              },
                              child: Text('Refresh'))
                        ]),
                      ),
                    )
                ],
              ));
        },
      ),
    );
  }

  Widget BuildMovieList(MovieLoadedState state) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: state.movieResult.isEmpty ? 0 : state.movieResult.length,
        itemBuilder: (ctx, index) {
          return MovieItems(state.movieResult[index]);
        });
  }
}

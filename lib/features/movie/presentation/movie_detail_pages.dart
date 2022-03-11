import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase/features/movie/domain/entities/movie_detail.dart';

import 'package:testcase/features/movie/presentation/bloc/movie_detail_bloc.dart';

class MovieDetailPages extends StatefulWidget {
  final int id;
  const MovieDetailPages(this.id, {Key? key}) : super(key: key);

  @override
  State<MovieDetailPages> createState() => _MovieDetailPagesState();
}

class _MovieDetailPagesState extends State<MovieDetailPages> {
  @override
  void initState() {
    BlocProvider.of<MovieDetailBloc>(context)
        .add(GetDetailMovieEvent(idMovie: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Movie"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: BlocConsumer<MovieDetailBloc, MovieDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieDetailLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MovieDetailLoadedState) {
            return buildDetailMovies(state.movieDetail);
          }
          if (state is DetailNoInternetConnectionState) {
            return Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                      BlocProvider.of<MovieDetailBloc>(context)
                          .add(RefreshDetailMovieEvent(idMovie: widget.id));
                    },
                    child: const Text('Refresh'))
              ]),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget buildDetailMovies(MovieDetail movieDetail) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: FadeInImage(
                  placeholder: const AssetImage(
                      'assets/images/product_image_placeholder.jpeg'),
                  image: NetworkImage(
                    'http://image.tmdb.org/t/p/w500/${movieDetail.backdropPath!}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${movieDetail.originalTitle}',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    spaceVertical(4),
                    Text('Release Date : ${movieDetail.releaseDate}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    spaceVertical(12),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text('Popularity : ${movieDetail.popularity}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              size: 20,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('${movieDetail.voteAverage}',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    spaceVertical(12),
                    const Text('Overview',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    spaceVertical(4),
                    Text('${movieDetail.overview}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget spaceVertical(double space) {
  return SizedBox(
    height: space,
  );
}

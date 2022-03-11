import 'package:flutter/material.dart';
import 'package:testcase/features/movie/domain/entities/results.dart';
import 'package:testcase/features/movie/presentation/movie_detail_pages.dart';

class MovieItems extends StatefulWidget {
  final Results result;
  const MovieItems(this.result, {Key? key}) : super(key: key);

  @override
  State<MovieItems> createState() => _MovieItemsState();
}

class _MovieItemsState extends State<MovieItems> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        MovieDetailPages(widget.result.id!))));
          },
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.15,
                child: FadeInImage(
                  placeholder: const AssetImage(
                      'assets/images/product_image_placeholder.jpeg'),
                  image: NetworkImage(
                    'http://image.tmdb.org/t/p/w500/${widget.result.backdropPath!}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.result.originalTitle == null)
                    Text('${widget.result.originalName}',
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  else
                    Text('${widget.result.originalTitle}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${widget.result.mediaType}'),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

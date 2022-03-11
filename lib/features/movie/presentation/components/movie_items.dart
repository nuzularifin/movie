import 'package:flutter/material.dart';
import 'package:testcase/features/movie/domain/entities/results.dart';

class MovieItems extends StatelessWidget {
  final Results result;
  const MovieItems(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.15,
                child: FadeInImage(
                  placeholder: const AssetImage(
                      'assets/images/product_image_placeholder.jpeg'),
                  image: NetworkImage(
                    'http://image.tmdb.org/t/p/w500/${result.backdropPath!}',
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
                  if (result.originalTitle == null)
                    Text('${result.originalName}',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  else
                    Text('${result.originalTitle}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${result.mediaType}'),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

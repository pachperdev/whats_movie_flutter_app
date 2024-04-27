import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    print(size.width);

    double dynamicHeight() {
      if (size.width >= 2500) {
        return size.height * 0.6;
      } else if (size.width >= 2000) {
        return size.height * 0.5;
      } else if (size.width >= 1500) {
        return size.height * 0.4;
      } else if (size.width >= 1000) {
        return size.height * 0.3;
      } else if (size.width >= 700) {
        return size.height * 0.2;
      } else {
        return size.height * 0.15;
      }
    }

    return SizedBox(
      height: dynamicHeight(),
      width: double.infinity,
      child: FadeInDownBig(
        child: Swiper(
          viewportFraction: 0.5,
          scale: 0.7,
          pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
              activeColor: colors.primary,
              color: colors.secondary,
            ),
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) => _Slide(movie: movies[index]),
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

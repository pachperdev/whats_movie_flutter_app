import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/entities.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    double dynamicHeight(double width, double height) {
      if (width >= 2500) {
        return height * (0.6 - (width - 2500) * 0.00004);
      } else if (width >= 2000) {
        return height * (0.55 - (width - 2000) * 0.00025);
      } else if (width >= 1500) {
        return height * (0.3 + (2000 - width) * 0.00010);
      } else if (width >= 800) {
        return height * (0.21 + (1500 - width) * 0.00009);
      } else {
        return height * 0.21; // Valor constante para ancho menor de 800
      }
    }

    return SizedBox(
      height: dynamicHeight(size.width, size.height),
      width: double.infinity,
      child: Swiper(
        viewportFraction: size.width <= 900 ? 0.7 : 0.5,
        scale: 0.8,
        autoplay: true,
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
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
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
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => context.push('/home/0/movie/${movie.id}'),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder:
                      const AssetImage('assets/loaders/bottle-loader.gif'),
                  image: NetworkImage(movie.backdropPath!),
                ),
              ),
              // Adding a gradient overlay to ensure text visibility
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.transparent,
                        Colors.black54,
                      ],
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text(
                    movie.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyles.titleSmall?.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

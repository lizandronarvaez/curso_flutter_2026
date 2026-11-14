import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modulo_05_app_cinemapedia/domain/entities/movie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/constants/app_constants.dart';
import '../../../config/constants/number_constants.dart';

class MoviesSlideshow extends StatefulWidget {
  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  @override
  State<MoviesSlideshow> createState() => _MoviesSlideshowState();
}

class _MoviesSlideshowState extends State<MoviesSlideshow> {
  int _currentIndex = NumberConstants.NUMBER_0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: NumberConstants.NUMBER_210.toDouble(),
            viewportFraction: 0.8,
            autoPlay: AppConstants.boolFalse,
            autoPlayInterval: const Duration(seconds: NumberConstants.NUMBER_3),
            enlargeCenterPage: AppConstants.boolTrue,
            padEnds: AppConstants.boolTrue,
            onPageChanged: (index, reason) =>
                setState(() => _currentIndex = index),
          ),
          items: widget.movies.map((movie) => _Slide(movie: movie)).toList(),
        ),

        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.movies.length,
          effect: WormEffect(
            dotHeight: NumberConstants.NUMBER_8.toDouble(),
            dotWidth: NumberConstants.NUMBER_8.toDouble(),
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: NumberConstants.NUMBER_30.toDouble()),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          NumberConstants.NUMBER_20.toDouble(),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              NumberConstants.NUMBER_20.toDouble(),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: NumberConstants.NUMBER_10.toDouble(),
                offset: Offset(
                  NumberConstants.NUMBER_0.toDouble(),
                  NumberConstants.NUMBER_10.toDouble(),
                ),
              ),
            ],
          ),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            width: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              return loadingProgress == null
                  ? FadeIn(child: child)
                  : const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12),
                    );
            },
          ),
        ),
      ),
    );
  }
}

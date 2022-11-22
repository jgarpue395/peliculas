import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CardSwiper extends StatefulWidget {

  final List<Movie> movies;
  final Function onNextPage;
  
  const CardSwiper({super.key, required this.movies, required this.onNextPage});

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}


class _CardSwiperState extends State<CardSwiper> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if(widget.movies.isEmpty)
    {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: widget.movies.length,
        loop: false,
        onIndexChanged: (index) {
          setState(() {
            if(index == widget.movies.length - 1)
            {
              widget.onNextPage();
            }

            _currentIndex = index;
          });
        },
        index: _currentIndex,
        layout:  SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, index) {

          final Movie movie = widget.movies[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, "details", arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage("assets/loading.gif"), 
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover
              ),
            ),
          );
        },
      ),
    );
  }
}
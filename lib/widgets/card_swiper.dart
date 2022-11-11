import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;
  
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout:  SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, "details", arguments: "movie-instance"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/loading.gif"), 
                image: NetworkImage("https://via.placeholder.com/300x400.jpg"),
                fit: BoxFit.cover
              ),
            ),
          );
        },
      ),
    );
  }
}
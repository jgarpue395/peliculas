import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Populares", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) => const _MoviePoster(),
            ),
          )
        ]
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster();

  @override
  Widget build(BuildContext context) {
    return Container (
      width: 130,
      height: 190,
      color: Colors.green,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: const [
          FadeInImage(
            placeholder: AssetImage("assets/no-image.jpg"), 
            image: NetworkImage("https://via.placeholder.com/300x400"),
            width: 130,
            height: 190,
            fit: BoxFit.cover,
          ),

          Text(
            "Start Wars: El retorno del Jedi silvestre de Monte Cristo",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ]
      ),
    );
  }
}
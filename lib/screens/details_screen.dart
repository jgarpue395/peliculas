import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),

          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),

              _Overview(),
              _Overview(),
              _Overview(),

              const SizedBox(height: 10),

              const CastingCards()
            ])
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            "movie.title",
            style: TextStyle(fontSize: 16),
          )
        ),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"), 
          image: NetworkImage("https://via.placeholder.com/500x300"),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"), 
              image: NetworkImage("https://via.placeholder.com/200x300"),
              height: 150,
            ),
          ),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("movie.title", style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 3),
              Text("movie.originalTitle", style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2),

              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                  const SizedBox(width: 5),
                  Text("movie.voteAverage", style: textTheme.caption,)
                ],
              )
            ],
          )
        ]
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        "Ex consequat sunt anim adipisicing. Officia anim non dolore voluptate nostrud veniam sunt reprehenderit nulla incididunt nostrud voluptate adipisicing quis. Elit pariatur ex dolor magna est ad nostrud Lorem elit enim est eu elit quis. Et laborum id nisi minim adipisicing aliqua nostrud ad eiusmod. Mollit excepteur nostrud laboris laborum.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
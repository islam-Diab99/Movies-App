import 'package:flutter/material.dart';
import 'package:movie_app/DetailsScrean.dart';
import 'package:movie_app/Network/MoviesApi.dart';

import 'model/Movies_Model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    ) ;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  late Future<Movie>? futureMovie;
  @override



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffff262626),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Icon(
                      Icons.menu,
                      size: 25,
                    ),
                    Text('Flutter Movies',style: TextStyle(fontSize: 20),),
                    Icon(
                        Icons.search,
                      size: 25,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('New Movies',style: TextStyle(fontSize: 20),),
              ),

              FutureBuilder(
                future: Future.wait([MoviesApi(category: 'popular').fetchMovie(),MoviesApi(category: 'top_rated').fetchMovie(),MoviesApi(category: 'upcoming').fetchMovie()],),
                  builder: (context,AsyncSnapshot<dynamic> snapshot){
                  if (snapshot.hasData)
                    {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            height: 200,
                            child: ListView.builder(
                              itemExtent: 130,

                              itemCount:snapshot.data[0]!.results!.length,
                              scrollDirection: Axis.horizontal,

                                itemBuilder: (context,index){

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12)
                                              ),
                                              height: 150.0,
                                              width: 100.0,
                                              child: Image(
                                                height: 200,
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w500${snapshot.data[0]!.results![index].posterPath}",
                                                ),
                                              )

                                            ),
                                          ),
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScrean(
                                             backdropPath:snapshot.data[0]!.results![index].backdropPath,
                                              posterPath: snapshot.data[0]!.results![index].posterPath,
                                              originalTitle: snapshot.data[0]!.results![index].originalTitle,
                                              releaseDate:snapshot.data[0]!.results![index].releaseDate ,
                                              voteCount: snapshot.data[0]!.results![index].voteCount,
                                              voteAverage: snapshot.data[0]!.results![index].voteAverage,
                                              popularity: snapshot.data[0]!.results![index].popularity,
                                             originalLanguage: snapshot.data[0]!.results![index].originalLanguage,
                                              overview: snapshot.data[0]!.results![index].overview,

                                            )));
                                          },
                                        ),
                                        Text(snapshot.data[0]!.results![index].originalTitle),
                                      ],
                                    ),
                                  );

                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('May you like',style: TextStyle(fontSize: 20),),
                          ),
                          Container(
                            height: 170,
                            child: ListView.builder(


                                itemCount:snapshot.data[1]!.results!.length,
                                scrollDirection: Axis.horizontal,

                                itemBuilder: (context,index){

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12)
                                                ),
                                                height: 150.0,
                                                width: 300.0,
                                                child: Image(
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/w500${snapshot.data[1]!.results![index].posterPath}",
                                                  ),
                                                )

                                            ),
                                          ),
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScrean(
                                              backdropPath:snapshot.data[1]!.results![index].backdropPath,
                                              posterPath: snapshot.data[1]!.results![index].posterPath,
                                              originalTitle: snapshot.data[1]!.results![index].originalTitle,
                                              releaseDate:snapshot.data[1]!.results![index].releaseDate ,
                                              voteCount: snapshot.data[1]!.results![index].voteCount,
                                              voteAverage: snapshot.data[1]!.results![index].voteAverage,
                                              popularity: snapshot.data[1]!.results![index].popularity,
                                              originalLanguage: snapshot.data[1]!.results![index].originalLanguage,
                                              overview: snapshot.data[1]!.results![index].overview,

                                            )));
                                          },

                                        ),
                                        Text(snapshot.data[1]!.results![index].originalTitle),
                                      ],
                                    ),
                                  );

                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Up coming',style: TextStyle(fontSize: 20),),
                          ),
                          Container(
                            height: 200,
                            child: ListView.builder(
                                itemExtent: 130,

                                itemCount:snapshot.data[2]!.results!.length,
                                scrollDirection: Axis.horizontal,

                                itemBuilder: (context,index){

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12)
                                                ),
                                                height: 150.0,
                                                width: 100.0,
                                                child: Image(
                                                  height: 200,
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/w500${snapshot.data[2]!.results![index].posterPath}",
                                                  ),
                                                )

                                            ),
                                          ),
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScrean(
                                              backdropPath:snapshot.data[2]!.results![index].backdropPath,
                                              posterPath: snapshot.data[2]!.results![index].posterPath,
                                              originalTitle: snapshot.data[2]!.results![index].originalTitle,
                                              releaseDate:snapshot.data[2]!.results![index].releaseDate ,
                                              voteCount: snapshot.data[2]!.results![index].voteCount,
                                              voteAverage: snapshot.data[2]!.results![index].voteAverage,
                                              popularity: snapshot.data[2]!.results![index].popularity,
                                              originalLanguage: snapshot.data[2]!.results![index].originalLanguage,
                                              overview: snapshot.data[2]!.results![index].overview,

                                            )));
                                          },
                                        ),
                                        Text(snapshot.data[2]!.results![index].originalTitle),
                                      ],
                                    ),
                                  );

                                }),
                          ),
                        ],
                      );
                    }
                  else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Align(
                    alignment: Alignment.center,
                      child: CircularProgressIndicator());



              }
              ),




            ],
          ),
        ),
      )
    );
  }
}

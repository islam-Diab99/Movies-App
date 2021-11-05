
import 'package:flutter/material.dart';
import 'package:movie_app/components/Circles.dart';

class DetailsScrean extends StatelessWidget {
   DetailsScrean({Key? key, this.backdropPath, this.posterPath, this.originalTitle, this.releaseDate,this.voteCount,this.voteAverage,this.originalLanguage,this.popularity ,this.overview}) : super(key: key);

  bool? adult;
final  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
 final String? originalTitle;
  String? overview;
  var popularity;
   final String? posterPath;
  final String ?releaseDate;
  String ?title;
  bool ?video;
  var voteAverage;
 var voteCount;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xffff262626),
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage('https://image.tmdb.org/t/p/w500${backdropPath}'),
              

            ),
          ),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                color: Color(0xffff262626),
              ),
              margin: EdgeInsets.only(top: 250),
              width: double.infinity,
              height: 700,

              child: Column(
                children: [
                  Row(

                    children: [
                      Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          height: 250.0,
                          width: 150.0,
                          child: Image(
                            height: 200,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${posterPath}",
                            ),
                          ),
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(originalTitle!,style: TextStyle(
                                color: Colors.white,fontSize: 23
                              ),),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'released: ${releaseDate}',style: TextStyle(
                                color: Colors.white,fontSize: 16,
                            ),),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red
                              ),
                              child: Text('Reviews'),

                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 140,top: 90),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.red,
                                child: Icon(Icons.favorite,color: Colors.white,),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),

                  Divider(thickness: 1,),
                  Padding(
                    padding:  EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      Circle(title:'${voteCount}Votes',content:Text ('${voteAverage}'),),
                      Circle(title:'Action',content: Icon(Icons.movie),),
                      Circle(title:'Popularity',content: Text ('${popularity}',style: TextStyle(fontSize: 12),),),
                      Circle(title:'Language',content: Text ('${originalLanguage}'),),

                    ],),
                  ),
                  Divider(thickness: 1,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(overview!,style: TextStyle(
                      fontSize: 15
                    ),),
                  ),

                ],
              ),
            ),
          )
        ],),
      ),
    );
  }
}

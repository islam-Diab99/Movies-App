import 'dart:convert';

import 'package:movie_app/model/Movies_Model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MoviesApi{
 String ?category;

  MoviesApi({this.category});

Future<Movie>fetchMovie ()async{
  Response response= await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$category?api_key=8f4521f0a9ad43d61322a43dc3055e3a'));
  if (response.statusCode==200)
    {
      return Movie.fromJson(jsonDecode(response.body));
    }
  else
    {
      throw Exception('failed to load Api');
    }

}
}
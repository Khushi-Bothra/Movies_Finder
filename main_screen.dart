import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movies_app/trending.dart';
import 'package:movies_app/toprated.dart';
import 'package:movies_app/nowplaying.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => _MainScreen();
}
class _MainScreen extends State<MainScreen> {

  List trendingmovies=[];
  List topratedmovies=[];
  List nowplayingmovies=[];

  final String apikey='723ac2322d217e4137c7fa30b12721dc';
  final readaccesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MjNhYzIzMjJkMjE3ZTQxMzdjN2ZhMzBiMTI3MjFkYyIsInN1YiI6IjYzYzNkOTM0ODcxYjM0MDBjM2IwOGJmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pN8waGaow2bvfbYBJG-9BpV-A2ULoE2csRm9SO4HnUU';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies()async{
    TMDB tmdbWithCustomLogs =TMDB(ApiKeys(apikey,readaccesstoken),
    logConfig:ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map nowplaying = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    setState((){
      trendingmovies= trendingresult['results'];
      topratedmovies= topratedresult['results'];
      nowplayingmovies = nowplaying['results'];
    });
    //print(trendingmovies);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Movies Finder"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children:[
            NowplayingMovies(nowplaying:nowplayingmovies),
            TrendingMovies(trending:trendingmovies),
            TopRated(toprated:topratedmovies),
          ]
        )

      ),
    );
  }
}
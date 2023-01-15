import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget{
  final List trending;

  const TrendingMovies({super.key, required this.trending});
  //const TrendingMovies({required Key key,required this.trending}): super(key:key);
  @override
  Widget build(BuildContext context){
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Trending Movies",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blueGrey[200]),),
              Container(height:270,
              child: ListView.builder(itemCount:trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
              return InkWell(
              onTap:(){

              },
              child: Container(
              width: 140,
              child:Column(
              children: [
                Container(
                height: 200,
                decoration:BoxDecoration(image:DecorationImage(
                image:NetworkImage(
                'https://image.tmdb.org/t/p/w500'+ trending[index]['poster_path']
                )
                )),
                ),
                Container(child: Text(trending[index]['title']!=null? trending[index]['title']:'Loading',style:TextStyle(fontSize: 15,color: Colors.blueGrey[200])),)
                ],
                ),
                ),
              );
              }),)
            ],
          ),
        );
  }
}
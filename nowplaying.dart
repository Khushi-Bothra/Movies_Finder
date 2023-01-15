import 'package:flutter/material.dart';

class NowplayingMovies extends StatelessWidget{
  final List nowplaying;

  const NowplayingMovies({super.key, required this.nowplaying});
  //const TrendingMovies({required Key key,required this.trending}): super(key:key);
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Now Playing",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blueGrey[200]),),
          Container(height:270,
            child: ListView.builder(itemCount:nowplaying.length,
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
                                    'https://image.tmdb.org/t/p/w500'+ nowplaying[index]['poster_path']
                                )
                            )),
                          ),
                          Container(child: Text(nowplaying[index]['title']!=null? nowplaying[index]['title']:'Loading',style:TextStyle(fontSize: 15,color: Colors.blueGrey[200])),)
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
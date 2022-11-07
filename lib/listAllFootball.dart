import 'dart:ui';
import 'package:belajar_listview/PremierLeagueModel.dart';
import 'package:belajar_listview/detailPage.dart';
import 'package:belajar_listview/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'db_movie.dart';

class ListAllFootbal extends StatefulWidget {
  const ListAllFootbal({Key? key}) : super(key: key);

  @override
  State<ListAllFootbal> createState() => _ListAllFootbalState();
}

class _ListAllFootbalState extends State<ListAllFootbal> {
  db_movie? apiMovie;
  bool isloaded = true;

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?api_key=d038edb7b2873891d413a5e084727e66&language=en-US&page=1"),
    );
    // print("status code " + res.statusCode.toString());
    apiMovie = db_movie.fromJson(json.decode(res.body.toString()));
    // print("team 0 : " + premiereLeagueModel!.teams![0].strTeam.toString());
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllListPL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222535),
      appBar: AppBar(
        title: Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'image/logo.jpeg',
            width: 100,
            height: 500,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: isloaded
              ? ListView.builder(
                  itemCount: apiMovie!.results!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailPage(movie: apiMovie!.results![index]);
                        }));
                      },
                      child: Container(
                        color: Color.fromARGB(255, 34, 37, 53),
                        margin: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 150,
                              height: 200,
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'image/loading.gif',
                                  placeholderCacheWidth: 20,
                                  placeholderCacheHeight: 120,
                                  image: "https://themoviedb.org/t/p/w500/" +
                                      apiMovie!.results![index].posterPath
                                          .toString()),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 160,
                                  child: Text(
                                    apiMovie!.results![index].originalTitle
                                        .toString()
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: (FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      star(),
                                      star(),
                                      star(),
                                      star(),
                                      star(),
                                      Text(
                                        " " +
                                            apiMovie!.results![index].popularity
                                                .toString()
                                                .toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Release Date :  ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: (FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        apiMovie!.results![index].releaseDate
                                            .toString()
                                            .toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 50, right: 20),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Favmviepge()));
          },
          child: Icon(Icons.favorite),
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:maicomic/model/Comic.dart';
import 'package:maicomic/model/Favorite.dart';
import 'package:restart_app/restart_app.dart';
import '../../model/User.dart';

import '../../service/maicomic_services.dart';
import '../profile/profile.dart';

class DetailComic extends StatefulWidget {
  final ComicModel comic;
  int user;
  Future<List<ComicModel>> fetchcomic;
  DetailComic(
      {Key? key,
      required this.comic,
      required this.user,
      required this.fetchcomic})
      : super(key: key);

  @override
  State<DetailComic> createState() => _DetailComicState();
}

class _DetailComicState extends State<DetailComic> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    Widget IconFavoriteModels = FutureBuilder<List<FavoriteModelDetail>>(
        future: ComicService()
            .fetchDataFavorite(widget.comic.id_comic, widget.user),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              Color favcolor = Color.fromARGB(255, 124, 192, 23);

              if (snapshot.data!.length > 0) {
                favcolor = Colors.red;
                return IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: favcolor,
                  ),
                  onPressed: () async {
                    dio.delete(
                        '${ComicService().baseUrlApi}/bookmark/${snapshot.data![0].id_bookmark}');

                    setState(() {
                      favcolor = Colors.black;
                    });

                    // Restart.restartApp();
                  },
                );
              } else {
                favcolor = Colors.black;
                return IconButton(
                  icon: Icon(
                    Icons.bookmark_add,
                    color: favcolor,
                  ),
                  onPressed: () async {
                    Map<String, dynamic> uploadBookmark = {
                      "comic_id": widget.comic.id_comic,
                      "user_id": widget.user,
                    };

                    var responseApi = await dio.post(
                        '${ComicService().baseUrlApi}/bookmark',
                        data: uploadBookmark);
                    debugPrint(responseApi.data.toString());

                    setState(() {
                      favcolor = Colors.red;
                    });
                    // Restart.restartApp();
                  },
                );
              }
            }
          }
        });

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[IconFavoriteModels],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              width: 395,
              height: 470,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16),
              //     image: DecorationImage(
              //       fit: BoxFit.fill,
              //       // fit: BoxFit.cover,
              //       image: AssetImage("${comic.cover}"),
              //     )),
              child: Image.asset(
                widget.comic.cover,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("${widget.comic.comic_name}",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Text(
                        "Episode : ${widget.comic.episode}",
                        style:
                            TextStyle(color: Color.fromARGB(255, 49, 49, 49)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Chapter : ${widget.comic.author_name}",
                        style:
                            TextStyle(color: Color.fromARGB(255, 49, 49, 49)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Status : ${widget.comic.status}",
                        style:
                            TextStyle(color: Color.fromARGB(255, 49, 49, 49)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Type : ${widget.comic.type}",
                        style:
                            TextStyle(color: Color.fromARGB(255, 49, 49, 49)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                "${widget.comic.description}",
                style: Theme.of(context).textTheme.bodyText1,
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        )));
  }
}

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   child: Icon(Icons.favorite, color: favIconcolor),
      //   onPressed: () {
      //     setState(() {
      //       if (favIconcolor == Colors.grey) {
      //         favIconcolor = Colors.red.shade700;
      //       } else {
      //         favIconcolor = Colors.grey;
      //       }
      //     });
      //   },
      // ),


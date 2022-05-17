import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:neeeeeeeeeeeetfilx/constract.dart';
import 'package:neeeeeeeeeeeetfilx/view/homescreen.dart';
import 'package:neeeeeeeeeeeetfilx/view/myapp.dart';

class DesScreen extends StatefulWidget {
  int id;
  num vote_average;
  String name;
  String original_name;
  String poster_path;
  String release_date;
  String backdrop_path;
  String overview;

  @override
  State<DesScreen> createState() => _DesScreenState();

  DesScreen({
    required this.id,
    required this.vote_average,
    required this.name,
    required this.original_name,
    required this.poster_path,
    required this.release_date,
    required this.backdrop_path,
    required this.overview,

  });
}

class _DesScreenState extends State<DesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Image.network(
              image_url + widget.poster_path,
              fit: BoxFit.fill,
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.8),
            child: Container(
              color: Colors.transparent.withOpacity(0.3),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/20,),
                  Container(

                    alignment: Alignment.topLeft,
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios,color: textcolor,),
                        label: Text("Back",
                          style: TextStyle(
                            fontSize: fontLarge,
                            color: textcolor,
                            fontWeight: FontWeight.w900
                          ),
                        )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                  FlipCard(
                    fill: Fill.fillFront,
                      direction: FlipDirection.VERTICAL,
                      front: Container(
                        height: MediaQuery.of(context).size.height/1.5,
                        width:MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                             image: NetworkImage(
                                image_url + widget.poster_path,
                              ),fit: BoxFit.cover
                          )

                        ),
                      ),
                      back: Container(
                        height: MediaQuery.of(context).size.height/1.5,
                        width:MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  image_url + widget.backdrop_path,
                                ),fit: BoxFit.fill
                            )
                        ),
                      ),),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                  Row(
                    children: [
                      Expanded(
                        flex:80,
                        child: Text(
                            "${widget.name}",style:TextStyle(
                            fontSize: fontXXxLarge,
                            color: textcolor
                        )),
                      ),
                      Expanded(
                        flex:20,
                        child: Text(
                            "${widget.vote_average}/10",style:TextStyle(
                            fontSize: fontLarge,
                            color: textcolor
                        )),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  Text(
                      "${widget.overview}",style:TextStyle(
                    fontSize: fontLarge,
                    color: textcolor
                  )),

                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Container(

          child: GestureDetector(
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return MyAppApp(widget.name,widget.id);
            }));
          },
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: 160,
              height: 50,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: navbar,
              ),
              child: Row(
                children: [
                  Text("watch in TMDB",style: TextStyle(
                    color: textcolor,
                    fontSize: fontXXSmaller
                  ),),
                  Icon(Icons.play_arrow_outlined,color: textcolor,),
                ],
              ),
            ),
          ),

      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neeeeeeeeeeeetfilx/controller/getdatafromapi.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:neeeeeeeeeeeetfilx/view/desScreen.dart';
import '../constract.dart';
import '../controller/getpopuler.dart';

class HomeScreen extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgorundBody,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backgorundBody,
          elevation: 0,
          actions: [
            Icon(
              Icons.search_rounded,
              size: 30,
            ),
            Padding(padding: EdgeInsets.only(right: 20.0)),
          ],
          title: Row(
            children: [
              Icon(
                Icons.remove_red_eye,
                size: 28,
              ),
              SizedBox(
                width: 10,
              ),
              Center(
                child: Text(
                  "EYE PLAY",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontLarge,
                      color: textcolor,
                      letterSpacing: 1.2),
                ),
              )
            ],
          ),
          titleSpacing: 80,
          leading: IconButton(
            onPressed: () {},
            // Icon(Icons.remove_red_eye,size: 30,),
            iconSize: 30,
            icon: Icon(Icons.menu),
          ),
          leadingWidth: 50,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff031a57),
                  Color(0xff042b93),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                // text top reated
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: const Text(
                    "Top Reated",
                    style: TextStyle(fontSize: fontXLarge, color: textcolor),
                  ),
                ),
                const SizedBox(height: 20),
                // card top reated
                Consumer(
                  builder: (context, watch, child) {
                    final viewmodeltoprated = watch(getdata);
                    return CarouselSlider.builder(
                      itemCount: viewmodeltoprated.listDataModel.length,
                      itemBuilder: (context, index, realIndex) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return DesScreen(
                                    original_name:
                                    '${viewmodeltoprated.listDataModel[index]
                                        .original_name}',
                                    name:
                                    '${viewmodeltoprated.listDataModel[index]
                                        .name}',
                                    poster_path:
                                    '${viewmodeltoprated.listDataModel[index]
                                        .poster_path}',
                                    backdrop_path:
                                    '${viewmodeltoprated.listDataModel[index]
                                        .backdrop_path}',
                                    release_date:
                                    '${viewmodeltoprated.listDataModel[index]
                                        .release_date}',
                                    vote_average: viewmodeltoprated
                                        .listDataModel[index].vote_average,
                                    id: viewmodeltoprated.listDataModel[index]
                                        .id,
                                    overview:
                                    '${viewmodeltoprated.listDataModel[index]
                                        .overview}',
                                  );
                                }));
                          },
                          child: GridTile(
                            //ClipRRect علشان اقدر اعمل بوردر علي الصوره دا زاي الكونتينر كدا
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0)),
                              child: Image.network(
                                image_url +
                                    viewmodeltoprated
                                        .listDataModel[index].poster_path,
                                fit: BoxFit.fill,
                                color: Colors.white.withOpacity(1),
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ),

                            footer: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff031a57).withOpacity(.5),
                                        Color(0xff031a57),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )),
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(19),
                                // color: backgorundBody2.withOpacity(.25),
                                child: Text(
                                  viewmodeltoprated.listDataModel[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: textcolor.withOpacity(1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 3.5,
                          aspectRatio: 15 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(
                              milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal),
                    );
                  },
                ),
                const SizedBox(height: 15),

              ],
            ),
          ),
        ));
  }

  _myStylePage() {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            children: [

              Expanded(child: Consumer(
                builder: (context, watch, child) {
                  final getvediopop = watch(getdata);
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getvediopop.listDataModel.length,
                    itemBuilder: (Context, int index) {
                      return Container(
                        width: 200,
                        color: boxshadocard.withOpacity(0.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return DesScreen(
                                original_name:
                                    '${getvediopop.listDataModel[index].original_name}',
                                name:
                                    '${getvediopop.listDataModel[index].name}',
                                poster_path:
                                    '${getvediopop.listDataModel[index].poster_path}',
                                backdrop_path:
                                    '${getvediopop.listDataModel[index].backdrop_path}',
                                release_date:
                                    '${getvediopop.listDataModel[index].release_date}',
                                vote_average: getvediopop
                                    .listDataModel[index].vote_average,
                                id: getvediopop.listDataModel[index].id,
                                overview:
                                    '${getvediopop.listDataModel[index].overview}',
                              );
                            }));
                          },
                          child: Card(
                            color: Color(0x11f8c),
                            elevation: 100,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x11f8c),
                                    Color(0x11f8c),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: Image.network(
                                      image_url +
                                          getvediopop
                                              .listDataModel[index].poster_path,
                                      fit: BoxFit.fill,
                                      color: Colors.white.withOpacity(1),
                                      colorBlendMode: BlendMode.modulate,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )),
              

            ],
          ),
        )

    );
  }
}
// Expanded(child: Consumer(
// builder: (context, watch, child) {
// final getvediopop = watch(getdata);
// return ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: getvediopop.listDataModel.length,
// itemBuilder: (Context, int index) {
// return Container(
// width: 200,
// color: boxshadocard.withOpacity(0.0),
// child: GestureDetector(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (BuildContext context) {
// return DesScreen(
// original_name:
// '${getvediopop.listDataModel[index].original_name}',
// name: '${getvediopop.listDataModel[index].name}',
// poster_path:
// '${getvediopop.listDataModel[index].poster_path}',
// backdrop_path:
// '${getvediopop.listDataModel[index].backdrop_path}',
// release_date:
// '${getvediopop.listDataModel[index].release_date}',
// vote_average:
// getvediopop.listDataModel[index].vote_average,
// id: getvediopop.listDataModel[index].id,
// overview:
// '${getvediopop.listDataModel[index].overview}',
// );
// }));
// },
// child: Card(
// color: Color(0x11f8c),
// elevation: 100,
// child: Container(
// decoration: const BoxDecoration(
// gradient: LinearGradient(
// colors: [
// Color(0x11f8c),
// Color(0x11f8c),
// ],
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// ),
// ),
// child: Column(
// children: [
// ClipRRect(
// borderRadius:
// BorderRadius.all(Radius.circular(10.0)),
// child: Image.network(
// image_url +
// getvediopop
//     .listDataModel[index].poster_path,
// fit: BoxFit.fill,
// color: Colors.white.withOpacity(1),
// colorBlendMode: BlendMode.modulate,
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// );
// },
// );
// },
// )),
// Expanded(child: Consumer(
// builder: (context, watch, child) {
// final getvediopop = watch(getdata);
// return ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: getvediopop.listDataModel.length,
// itemBuilder: (Context, int index) {
// return Container(
// width: 200,
// color: boxshadocard.withOpacity(0.0),
// child: GestureDetector(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (BuildContext context) {
// return DesScreen(
// original_name:
// '${getvediopop.listDataModel[index].original_name}',
// name: '${getvediopop.listDataModel[index].name}',
// poster_path:
// '${getvediopop.listDataModel[index].poster_path}',
// backdrop_path:
// '${getvediopop.listDataModel[index].backdrop_path}',
// release_date:
// '${getvediopop.listDataModel[index].release_date}',
// vote_average:
// getvediopop.listDataModel[index].vote_average,
// id: getvediopop.listDataModel[index].id,
// overview:
// '${getvediopop.listDataModel[index].overview}',
// );
// }));
// },
// child: Card(
// color: Color(0x11f8c),
// elevation: 100,
// child: Container(
// decoration: const BoxDecoration(
// gradient: LinearGradient(
// colors: [
// Color(0x11f8c),
// Color(0x11f8c),
// ],
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// ),
// ),
// child: Column(
// children: [
// ClipRRect(
// borderRadius:
// BorderRadius.all(Radius.circular(10.0)),
// child: Image.network(
// image_url +
// getvediopop
//     .listDataModel[index].poster_path,
// fit: BoxFit.fill,
// color: Colors.white.withOpacity(1),
// colorBlendMode: BlendMode.modulate,
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// );
// },
// );
// },
// )),
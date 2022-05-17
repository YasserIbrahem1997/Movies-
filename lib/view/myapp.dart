import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:neeeeeeeeeeeetfilx/constract.dart';

class MyAppApp extends StatefulWidget {

String name;
int id;

MyAppApp(this.name,this.id);

@override
_MyAppAppState createState() => new _MyAppAppState();
}

class _MyAppAppState extends State<MyAppApp> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );
  late ContextMenu contextMenu;

  @override
  void initState() {
    super.initState();

    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
              androidId: 1,
              iosId: "1",
              title: "Special",
              action: () async {
                final snackBar = SnackBar(
                  content: Text("Special clicked!"),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              })
        ],
        onCreateContextMenu: (hitTestResult) async {
          String selectedText =
              await webViewController?.getSelectedText() ?? "";
          final snackBar = SnackBar(
            content: Text(
                "Selected text: '$selectedText', of type: ${hitTestResult.type.toString()}"),
            duration: Duration(seconds: 1),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        onContextMenuActionItemClicked: (menuItem) {
          var id = (Platform.isAndroid) ? menuItem.androidId : menuItem.iosId;

          final snackBar = SnackBar(
            content: Text(
                "Menu item with ID $id and title '${menuItem.title}' clicked!"),
            duration: Duration(seconds: 1),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgorundBody,
          title: const Text('Just Select Watch any Chantal',style: TextStyle(
fontSize: fontXXSmaller,
          ),),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: InAppWebView(
                key: webViewKey,
                initialUrlRequest:
                URLRequest(url: Uri.parse("https://www.themoviedb.org/movie/${widget.id}-${widget.name}/")),
                contextMenu: contextMenu,
                initialOptions: options,
                onWebViewCreated: (InAppWebViewController controller) {
                  webViewController = controller;
                },
              )),
        ]));
  }
}
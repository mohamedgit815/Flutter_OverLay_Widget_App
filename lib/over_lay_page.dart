import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverLayPage extends StatefulWidget {
  const OverLayPage({Key? key}) : super(key: key);

  @override
  State<OverLayPage> createState() => _OverLayPageState();
}

class _OverLayPageState extends State<OverLayPage> {
  OverlayEntry? entry;
  late Offset offset;

  @override
  void initState() {
    super.initState();
    offset = const Offset(0.0 , 0.0);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   overLay();
    // });
  }

  @override
  void dispose() {
    super.dispose();
    entry?.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [

            MaterialButton(onPressed: () {

              if(entry == null) {
                  overLay();
              } else {
                if(entry?.mounted == false) {
                  overLay();
                }
              }
            },color: Colors.white,child: const Text("Show")),


            MaterialButton(onPressed: () {
              removeOverLay();
            },color: Colors.white,child: const Text("Hide")),


            MaterialButton(onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (_) => const OverLayTestPage()));
            },color: Colors.white,child: const Text("OverLayTestPage")),

          ],
        ),
      ),


    );


  }


  void overLay(){
    final OverlayState state = Overlay.of(context);

    entry = OverlayEntry(builder: (context) {
      return Positioned(
        left: offset.dx ,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate:  _penUpdate ,
          child: ElevatedButton.icon(
            onPressed: (){},
            icon: const Icon(Icons.stop_circle_rounded),
            label: const Text("Record"),
          ),
        ),
      );
    });
    return state.insert(entry!);
  }

  void _penUpdate(DragUpdateDetails details) {
    offset += details.delta;
    entry?.markNeedsBuild();
  }

  void removeOverLay(){
    if(entry != null){
      if(entry?.mounted == true) {
        entry!.remove();
        entry = null;
      }
    }
  }
}


/// OverLayTestPage
class OverLayTestPage extends StatelessWidget {
  const OverLayTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OverLayTestPage"),
      ),
      body: MaterialButton(onPressed: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (_) => const OverLayPage()));
      },color: Colors.white,child: const Text("OverLayPage")),

    );
  }
}

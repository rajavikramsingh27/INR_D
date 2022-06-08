import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Views/SplashScreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);



  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'INR(D)',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
      // home: TestDropDown(),
    );
  }
}

class TestDropDown extends StatefulWidget {
  @override
  _TestDropDownState createState() => _TestDropDownState();
}

class _TestDropDownState extends State<TestDropDown> {
  late OverlayEntry _overlayEntry;
  Timer? _debounce;
  _showOverlay(BuildContext context) {
    OverlayState? state = Overlay.of(context);
    final RenderBox? box = key.currentContext!.findRenderObject() as RenderBox;
    Size size = box!.size;
    Offset position = box.localToGlobal(Offset.zero);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: size.height + position.dy,
        left: position.dx,
        child: Card(
          child: Container(
              height: 200,
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    child: IconButton(
                      onPressed: () {
                        if (_overlayEntry.mounted) {
                          _overlayEntry.remove();
                        }
                      },
                      icon: Icon(Icons.close),
                      alignment: Alignment.topRight,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: []..addAll(List.generate(
                          200, (index) => Text(index.toString()))),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
    state!.insert(_overlayEntry);
  }
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              key: key,
              onChanged: (String searchText) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  print(searchText);
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _showOverlay(context);
              },
              child: Text('Press Me'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_overlayEntry.mounted) {
            _overlayEntry.remove();
          }
        },
      ),
    );
  }
}

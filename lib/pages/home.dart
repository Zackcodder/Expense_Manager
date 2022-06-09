// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:tflite_flutter_plugin_example/classifier.dart';
// import 'package:tflite/tflite.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

import 'classifier.dart';

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  late Classifier _classifier;
  late List<Widget> _children;
  
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _classifier = Classifier();
    _children = [];
    _children.add(Container());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Fake News Predictor'),
        ),
        body: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                itemCount: _children.length,
                itemBuilder: (_, index) {
                  return _children[index];
                },
              )),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orangeAccent)),
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: 'Write the news here'),
                      controller: _controller,
                    ),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    child: const Text('Predict'),
                    onPressed: () {
                      final text = _controller.text;
                      final prediction = _classifier.classify(text);
                      setState(() {
                        _children.add(Dismissible(
                          key: GlobalKey(),
                          onDismissed: (direction) {},
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              color: prediction[1] > prediction[0]
                                  ? Colors.lightGreen
                                  : Colors.redAccent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Input: $text",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text("Output:"),
                                  Text("   Positive: ${prediction[1]}"),
                                  Text("   Negative: ${prediction[0]}"),
                                ],
                              ),
                            ),
                          ),
                        ));
                        _controller.clear();
                      });
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// // ignore_for_file: prefer_const_constructors

// import 'dart:ui';

// import 'package:flutter/material.dart';


// //this is my own package import

// import 'package:tflite/tflite.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   // List _outputs;
//   TextEditingController customController = TextEditingController();

  
// @override
//   void initState() {
//     super.initState();
//     loadModel().then((value) {setState((){});});
//   }

// // pickImage() async {
// //     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
// //     if (image == null) return null;
// //     setState(() {
// //       _image = image;
// //     });
// //     classifyImage(image);
// //   }
// // classifyImage(File image) async {
// //     var output = await Tflite.runModelOnImage(
// //       path: image.path,
// //     );
// //     print("predict = "+output.toString());
// //     setState(() {
// //       _outputs = output;
// //     });
// //   }
// loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/model.tflite",
//       labels: "assets/labels.txt",
//     );
//   }
// @override
//   void dispose() {
//     Tflite.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         shadowColor: Colors.transparent,
//         title: Text(
//           'Fake News Predictor',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 350,
//             width: 450,
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Output Result:',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 200,
//           ),
//           Container(
//             height: 70,
//             color: Colors.white,
//             child: Row(
//               // ignore: prefer_const_literals_to_create_immutables
//               children: [
//                 Text(
//                   "Enter Statement",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 200),
//                   child: Container(
//                     alignment: Alignment.centerLeft,
//                     child: MaterialButton(
//                       color: Colors.blue,
//                       onPressed: () {},
//                       child: const Text(
//                         "Predict",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22.0,
//                             fontStyle: FontStyle.italic),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:io';

// import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
// import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
// import 'package:ar_flutter_plugin/datatypes/node_types.dart';
// import 'package:ar_flutter_plugin/models/ar_node.dart';
// import 'package:flutter/services.dart';
// import 'package:vector_math/vector_math_64.dart';
// import 'dart:math';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_archive/flutter_archive.dart';

// class LocalAndWebObjectsWidget extends StatefulWidget {
//   LocalAndWebObjectsWidget({Key? key}) : super(key: key);
//   @override
//   _LocalAndWebObjectsWidgetState createState() =>
//       _LocalAndWebObjectsWidgetState();
// }

// class _LocalAndWebObjectsWidgetState extends State<LocalAndWebObjectsWidget> {
//   ARSessionManager? arSessionManager;
//   ARObjectManager? arObjectManager;
//   //String localObjectReference;
//   ARNode? localObjectNode;
//   //String webObjectReference;
//   ARNode? webObjectNode;
//   ARNode? fileSystemNode;
//   HttpClient? httpClient;

//   @override
//   void dispose() {
//     super.dispose();
//     arSessionManager!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Local & Web Objects'),
//         ),
//         body: Container(
//             child: Stack(children: [
//           ARView(
//             onARViewCreated: onARViewCreated,
//             planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
//           ),
//           Align(
//               alignment: FractionalOffset.bottomCenter,
//               child:
//                   Column(mainAxisAlignment: MainAxisAlignment.end, children: [

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         onPressed: onLocalObjectAtOriginButtonPressed,
//                         child: Text("Add/Remove Local\nObject at Origin")),
//                     ElevatedButton(
//                         onPressed: onWebObjectAtOriginButtonPressed,
//                         child: Text("Add/Remove Web\nObject at Origin")),
//                   ],
//                 ),
        
//               ]))
//         ])));
//   }

//   void onARViewCreated(
//       ARSessionManager arSessionManager,
//       ARObjectManager arObjectManager,
//       ARAnchorManager arAnchorManager,
//       ARLocationManager arLocationManager) {
//     this.arSessionManager = arSessionManager;
//     this.arObjectManager = arObjectManager;

//     this.arSessionManager!.onInitialize(
//           showFeaturePoints: false,
//           showPlanes: true,
//           customPlaneTexturePath: "assets/images/logo.png",
//           showAnimatedGuide: true,
//           showWorldOrigin: false,
//           handleTaps: true,
//         );
//     this.arObjectManager!.onInitialize();

//   }


//   Future<void> onLocalObjectAtOriginButtonPressed() async {
//     if (this.localObjectNode != null) {
//       this.arObjectManager!.removeNode(this.localObjectNode!);
//       this.localObjectNode = null;
//     } else {
//       var newNode = ARNode(
//           type: NodeType.localGLTF2,
//           uri: "Models/Chicken_01/Chicken_01.gltf",
//           scale: Vector3(0.2, 0.2, 0.2),
//           position: Vector3(0.0, 0.0, 0.0),
//           rotation: Vector4(1.0, 0.0, 0.0, 0.0));
//       bool? didAddLocalNode = await this.arObjectManager!.addNode(newNode);
//       this.localObjectNode = (didAddLocalNode!) ? newNode : null;
//     }
//   }

//   Future<void> onWebObjectAtOriginButtonPressed() async {
//     if (this.webObjectNode != null) {
//       this.arObjectManager!.removeNode(this.webObjectNode!);
//       this.webObjectNode = null;
//     } else {
//       var newNode = ARNode(
//           type: NodeType.webGLB,
//           uri:
//               "https://github.com/hernan74/ejemplo_realidad_aumentada/blob/main/assets/adobe_ejemplo.glb?raw=true",
//           scale: Vector3(0.2, 0.2, 0.2));
//       bool? didAddWebNode = await this.arObjectManager!.addNode(newNode);
//       this.webObjectNode = (didAddWebNode!) ? newNode : null;
//     }
//   }

// }

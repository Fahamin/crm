import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../controllers/myhuman_controller.dart';

class MyhumanCollectionView extends StatelessWidget {
  final MyhumanController controller = Get.put(MyhumanController());

  MyhumanCollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('My Human Collection'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return  Center(child: CircularProgressIndicator());
        }

   
          return ListView.builder(
            itemCount: controller.collection.length,
            itemBuilder: (context, index) {
              final item = controller.collection[index];

              return Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 300,
                  child: ModelViewer(
                    backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                    src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                    alt: 'A 3D model of an astronaut',
                    ar: true,
                    arModes: ['scene-viewer', 'webxr', 'quick-look'],
                    autoRotate: true,
                    iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                    disableZoom: false,
                  )),
              );
            },
          );
        }),
     
    );
  }
}
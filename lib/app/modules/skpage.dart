import 'dart:convert';

import 'package:crm/app/modules/ww.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/model/skmodel.dart';

class SketchfabListScreen extends StatefulWidget {
  const SketchfabListScreen({super.key});

  @override
  _SketchfabListScreenState createState() => _SketchfabListScreenState();
}

class _SketchfabListScreenState extends State<SketchfabListScreen> {
  List<SketchfabModel> models = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchModels();
  }

  Future<void> fetchModels() async {
    const apiUrl =
        'https://api.sketchfab.com/v3/search?type=models&q=human'; // Change query if needed
    const token =
        '78de742f49984130b1074b4ef82bcf6a'; // Replace with your Sketchfab token

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Token $token'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> results = jsonData['results'];

      setState(() {
        models = results
            .map((modelJson) => SketchfabModel.fromJson(modelJson))
            .toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load models');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) {
                final model = models[index];
                return ListTile(
                  leading: Image.network(model.thumbnailUrl, width: 60),
                  title: Text(model.name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ModelViewerScreen(modelUid: model.uid),
                        ));
                  },
                );
              },
            ),
    );
  }
}

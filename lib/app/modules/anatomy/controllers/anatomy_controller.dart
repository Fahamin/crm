import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../data/model/anatomy_model.dart';

class AnatomyController extends GetxController {
  var isLoading = true.obs;
  var collection = <AnatomyContent>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyHumanCollection();
  }

  Future<void> fetchMyHumanCollection() async {
    try {
      isLoading(true);
      errorMessage('');

      final tokenData = await fetchBioDigitalToken();

      final storage = FlutterSecureStorage();

      await storage.write(
          key: 'biodigital_token',
          value: tokenData['access_token']);

      var tokern = tokenData['access_token'];
      //write
      String? tokenre =
      await storage.read(key: 'biodigital_token');


      final response = await http.get(
        Uri.parse(
            'https://apis.biodigital.com/services/v2/content/collections/myhuman'),
        headers: {
          'Authorization': 'Bearer $tokern',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> items = data['myhuman'];
        collection.assignAll(
            items.map((json) => AnatomyContent.fromJson(json)).toList());
      } else {
        throw Exception('Failed to load collection: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }


  Future<Map<String, dynamic>> fetchBioDigitalToken() async {
    const tokenEndpoint = 'https://apis.biodigital.com/oauth2/v2/token';
    const clientId = 'a4b94ae1ebe92f83f477b40ccc1bb85074fe8b95';
    const clientSecret = '0572c034f3bd931ab332a22710c79e3803fb7d01';


    try {
      // Step 1: Prepare the Basic Auth credentials
      final credentials = '$clientId:$clientSecret';
      final bytes = utf8.encode(credentials);
      final base64Str = base64.encode(bytes);

      // Step 2: Prepare the request headers
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json;charset=UTF-8',
        'Authorization': 'Basic $base64Str',
      };

      // Step 3: Prepare the request body
      final body = jsonEncode({
        'grant_type': 'client_credentials',
        'scope': 'contentapi',
      });

      // Step 4: Make the POST request
      final response = await http.post(
        Uri.parse(tokenEndpoint),
        headers: headers,
        body: body,
      );

      // Step 5: Handle the response
      if (response.statusCode == 200) {
        // Success - parse the JSON response
        return jsonDecode(response.body);
      } else {
        // Error - parse the error response
        final errorResponse = jsonDecode(response.body);
        throw Exception(
            'Error ${errorResponse['error_status_code']}: ${errorResponse['error_message']}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching token: $e');
      }
      rethrow;
    }
  }


}

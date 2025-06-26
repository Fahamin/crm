import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:http/http.dart' as http;

import '../../../../core/colors.dart';
import '../../../../wigets/home_appbar.dart';
import '../../../../wigets/fedback.dart';
import '../../../../wigets/image_slider.dart';
import '../../../../wigets/red_dialog.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            DrAppbar(title: "Dr. Albert Stevano", image: "imagelink"),
            Expanded(
              // <-- Takes remaining space
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.toNamed(Routes.FEEDBACK);
                        },
                        child: FeedBack(
                            "assets/images/mes.png",
                            "FeedBack",
                            ""
                                "Share your thoughts, report issues, or suggest improvements to help us make the app better for you.")),
                    InkWell(
                        onTap: () async {

                          Get.toNamed(Routes.MYHUMAN);

                          /*const yourDeveloperKey =
                              'a4b94ae1ebe92f83f477b40ccc1bb85074fe8b95';
                          const yourDeveloperSecret =
                              '0572c034f3bd931ab332a22710c79e3803fb7d01';

                          final tokenData = await fetchBioDigitalToken(
                            clientId: yourDeveloperKey,
                            clientSecret: yourDeveloperSecret,
                          );

                          print('Access Token: ${tokenData['access_token']}');

                          final storage = FlutterSecureStorage();

                          await storage.write(
                              key: 'biodigital_token',
                              value: tokenData['access_token']);

                          //write
                          String? token =
                              await storage.read(key: 'biodigital_token');

                         fetchMyHumanCollection(tokenData['access_token']);

                          print(
                              'Expires in: ${tokenData['expires_in']} seconds');*/
                        },
                        child: FeedBack(
                            "assets/images/infoi.png",
                            "Information Bank",
                            ""
                                "Find all the details you need in one convenient place, organized, easy to access, and always available when you need them..")),
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => ConfirmationDialog(
                              onYes: () {
                                debugPrint("Yes clicked");
                                // Do Yes action
                              },
                              onNo: () {
                                debugPrint("No clicked");
                                // Do No action
                              },
                            ),
                          );
                        },
                        child: FeedBack(
                            "assets/images/flag.png",
                            "Red Flag",
                            ""
                                "Notice an issue or unusual activity? Use the red flag feature to report it instantly so we can respond promptly..")),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Center(child: Image.asset("assets/images/np.png", width: 130)),
            BannerSlider(), // <-- Stays fixed at the bottom
            SizedBox(height: 10), // Extra bottom spacing
          ],
        ),
      ),
    );
  }
}

Future<void> fetchMyHumanCollection(var token) async {
  if (token == null) {
    print('Failed to get access token');
    return;
  }

  try {
    final response = await http.get(
      Uri.parse(
          'https://apis.biodigital.com/services/v2/content/collections/myhuman'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('MyHuman Collection: $data');
      // Process your data here
    } else {
      print('API Error: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('API Exception: $e');
  }
}

Future<Map<String, dynamic>> fetchBioDigitalToken({
  required String clientId,
  required String clientSecret,
}) async {
  // API endpoint
  const tokenEndpoint = 'https://apis.biodigital.com/oauth2/v2/token';

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

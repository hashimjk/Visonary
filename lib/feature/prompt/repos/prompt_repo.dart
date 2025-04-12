import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PromptRepo {
  ///A bearer token that authenticates the user for making the request.
  String authorization;

  PromptRepo({required this.authorization});
  static Future<Uint8List?> generateImage(String prompt) async {
    try {
      String url = 'https://api.vyro.ai/v1/imagine/api/generations';
      Map<String, dynamic> header = {
        'Authorization':
            'Bearer vk-U3XGXBcKY2c31TQxBlnRxtGNj8kakDyMfwAkDLPgGoRTrL',
      };

      Map<String, dynamic> payload = {
        'prompt': prompt,
        'style_id': '122',
        'aspect_ratio': '1:1',
        'cfg': '0',
        'seed': '0',
        'high_res_results': '1',
      };

      FormData formData = FormData.fromMap(payload);
      Dio dio = Dio();
      dio.options = BaseOptions(
        headers: header,
        responseType: ResponseType.bytes,
      );

      final response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        Uint8List uint8list = Uint8List.fromList(response.data);
        return uint8list;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

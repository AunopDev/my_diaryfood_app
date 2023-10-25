// ไฟล์นี้เป็นไฟล์เรียกใช้ Api ต่างๆ

// ignore_for_file: unused_import

import 'dart:convert';

import 'package:my_diaryfood_app/models/diaryfood.dart';
import 'package:http/http.dart' as http;

class CallApi {
  // เมธอดเรียกใช้ API : getall --------------------------------------------
  static Future<List<Diaryfood>> callAPIGetAllDiaryfood() async {
    final response = await http.get(
      Uri.parse('http://192.168.91.1/diaryfoodapi/api/api_getall_diaryfood.php'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอป เก็ยไว้ในตัวแปร
      final responseData = jsonDecode(response.body);

      // แปลงข้อมูลที่เก็บในตัวแปรให้อยู่ในรูปของ List เพื่อนำไปใช้งาน
      final diaryfooddataList = await responseData.map<Diaryfood>((json) {
        return Diaryfood.fromJson(json);
      }).toList();

      return diaryfooddataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // เมธอดเรียกใช้ API : insert --------------------------------------------
  static Future<String> callAPIInsertDiaryfood(Diaryfood diaryfood) async {
    // เรียกใช้ API
    final response = await http.post(
      Uri.parse('http://localhost/diaryfoodapi/api/api_insert_diaryfood.php'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอป เก็ยไว้ในตัวแปร
      final responseData = jsonDecode(response.body);

      // ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return responseData['massage'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // เมธอดเรียกใช้ API : update --------------------------------------------
  static Future<String> callAPIUpdateDiaryfood(Diaryfood diaryfood) async {
    // เรียกใช้ API
    final response = await http.post(
      Uri.parse('http://localhost/diaryfoodapi/api/api_update_diaryfood.php'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอป เก็ยไว้ในตัวแปร
      final responseData = jsonDecode(response.body);

      // ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return responseData['massage'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // เมธอดเรียกใช้ API : delete --------------------------------------------
  static Future<String> callAPIDeleteDiaryfood(Diaryfood diaryfood) async {
    // เรียกใช้ API
    final response = await http.post(
      Uri.parse('http://localhost/diaryfoodapi/api/api_delete_diaryfood.php'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอป เก็ยไว้ในตัวแปร
      final responseData = jsonDecode(response.body);

      // ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return responseData['massage'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

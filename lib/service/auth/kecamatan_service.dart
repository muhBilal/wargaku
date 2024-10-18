import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wargaku/model/kecamatan.dart';
import 'package:wargaku/utils/repository.dart';

class KecamatanService {
  final ResourcesRepository repo = ResourcesRepository();

  Future<List<Kecamatan>> fetchKecamatan() async {
    final String apiUrl = repo.getFunMasterKecamatan;
    print("debug: Fetching kecamatan from: $apiUrl");

    try {
      final response = await http.get(Uri.parse("https://api-mc.surabaya.go.id/api/mediacenter/kecamatan"), headers: {
        // 'Content-Type': 'application/json',
        // 'Accept': 'application/json',
      });
      debugPrint("debug: Response status: ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print('debug: Fetched kecamatan data: $data');
        return data.map((json) => Kecamatan.fromJson(json)).toList();
      } else {
        print("debug: Failed to fetch kecamatan: ${response.body}");
        throw Exception('Failed to load kecamatan: ${response.statusCode}');
      }
    } catch (e) {
      print("debug: Error occurred: $e");
      throw Exception('An error occurred while fetching kecamatan: $e');
    }
  }
}

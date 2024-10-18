import 'package:flutter/material.dart';
import 'package:wargaku/model/kecamatan.dart';
import 'package:wargaku/service/auth/kecamatan_service.dart';

class KecamatanProvider extends ChangeNotifier {
  List<Kecamatan> _kecamatan = [];
  bool _isLoading = false;

  List<Kecamatan> get kecamatan => _kecamatan;
  bool get isLoading => _isLoading;

  final KecamatanService _kecamatanService = KecamatanService();

  Future<void> loadKecamatan() async {
    _isLoading = true;
    // notifyListeners();
    print("kecamatan provider");
    _kecamatan = await _kecamatanService.fetchKecamatan();
    print(_kecamatan);
    _isLoading = false;
    notifyListeners();
  }
}
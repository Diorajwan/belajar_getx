// lib/app/services/formulir_service.dart
class AlbumService {
  // Simulasi database lokal
  final List<Map<String, dynamic>> _pendaftaranList = [];

  void simpanPendaftaran(Map<String, dynamic> data) {
    _pendaftaranList.add(data);
  }

  List<Map<String, dynamic>> getAllPendaftaran() {
    return _pendaftaranList;
  }
}

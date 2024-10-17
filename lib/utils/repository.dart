import 'dart:convert';

// import 'package:wargaku/utils/provider.dart';
// import 'package:wargaku/view/utils/provider.dart';
const String _url = "https://api-mc.surabaya.go.id/api";
String get getMainUrl => _url;

final String _urlMenu = '$getMainUrl/menu';
String get getUrlMenu => _urlMenu;

class ResourcesRepository {
  // final _apiProvider = ResourcesProvider();

  // -----------------------------------------------------------------------------

  // MENU STATIS -----------------------------------------------------------------

  final String _funMenuStatisKependudukan = "$getUrlMenu/kependudukan";
  String get getFunMenuStatisKependudukan => _funMenuStatisKependudukan;

  // -----------------------------------------------------------------------------

  // CEK LOGIN -------------------------------------------------------------------

  final String _funLogin = "$getMainUrl/mediacenter/login";
  String get getFunLogin => _funLogin;

  final String _funSignUp = "$getMainUrl/mediacenter/register";
  String get getFunSignUp => _funSignUp;

  final String _funProfile = "$getMainUrl/mediacenter/profile";
  String get getFunProfile => _funProfile;

  final String _funGantiPassword = "$getMainUrl/mediacenter/gantipassword";
  String get getFunGantiPassword => _funGantiPassword;

  final String _funMobileVersion = "$getMainUrl/mediacenter/mobile_version";
  String get getFunMobileVersion => _funMobileVersion;

  // ----------------------------------------------------------------------------

  // MASTER ---------------------------------------------------------------------

  final String _funMasterKecamatan = "$getMainUrl/mediacenter/kecamatan";
  String get getFunMasterKecamatan => _funMasterKecamatan;

  final String _funMasterKelurahan = "$getMainUrl/mediacenter/kelurahan";
  String get getFunMasterKelurahan => _funMasterKelurahan;

  final String _funMasterChannel = "$getMainUrl/mediacenter/channel";
  String get getFunMasterChannel => _funMasterChannel;

  final String _funMasterStatus = "$getMainUrl/mediacenter/status_list";
  String get getFunMasterStatus => _funMasterStatus;

  final String _funMasterTopik = "$getMainUrl/mediacenter/topik";
  String get getFunMasterTopik => _funMasterTopik;

  final String _funMasterKategori = "$getMainUrl/mediacenter/kategori";
  String get getFunMasterKategori => _funMasterKategori;

  final String _funMasterInstansi = "$getMainUrl/mediacenter/get_instansi";
  String get getFunMasterInstansi => _funMasterInstansi;

  final String _funMasterUKM = "$getMainUrl/locont/list_ukm";
  String get getFunMasterUKM => _funMasterUKM;

  // ----------------------------------------------------------------------------

  // PENGADUAN ------------------------------------------------------------------

  final String _funPengaduanKeluhan = "$getMainUrl/mediacenter/keluhan";
  String get getFunPengaduanKeluhan => _funPengaduanKeluhan;

  final String _funPengaduanDetailKeluhan = "$getMainUrl/mediacenter/keluhan";
  String get getFunPengaduanDetailKeluhan => _funPengaduanDetailKeluhan;

  final String _funPengaduanTambah = "$getMainUrl/mediacenter/bikin_keluhan";
  String get getFunPengaduanTambah => _funPengaduanTambah;

  final String _funPengaduanTanggapan = "$getMainUrl/mediacenter/tanggapan";
  String get getFunPengaduanTanggapan => _funPengaduanTanggapan;

  final String _funPengaduanTambahTanggapan =
      "$getMainUrl/mediacenter/balas_riwikan";
  String get getFunPengaduanTambahTanggapan => _funPengaduanTambahTanggapan;

  final String _funPengaduanSelesaikan =
      "$getMainUrl/mediacenter/keluhan_selesai";
  String get getFunPengaduanSelesaikan => _funPengaduanSelesaikan;

  final String _funPengaduanHapus = "$getMainUrl/mediacenter/hapus_keluhan";
  String get getFunPengaduanHapus => _funPengaduanHapus;

  // ----------------------------------------------------------------------------

  // WALIKOTA -------------------------------------------------------------------

  final String _funWalikotaTopTopik = "$getMainUrl/mediacenter/top_five_topic";
  String get getFunWalikotaTopTopik => _funWalikotaTopTopik;

  final String _funWalikotaTotal = "$getMainUrl/mediacenter/total";
  String get getFunWalikotaTotal => _funWalikotaTotal;

  final String _funWalikotaTotalPerinstansi =
      "$getMainUrl/mediacenter/total_perinstansi?instansi_id=";
  String get getFunWalikotaTotalPerinstansi => _funWalikotaTotalPerinstansi;

  final String _funWalikotaKeluhanBelumDitanggapi =
      "$getMainUrl/mediacenter/total_belum_ditanggapi_instansi";
  String get getFunWalikotaKeluhanBelumDitanggapi =>
      _funWalikotaKeluhanBelumDitanggapi;

  final String _funWalikotaResponPerTopik =
      "$getMainUrl/mediacenter/avgresponpertopik";
  String get getFunWalikotaResponPerTopik => _funWalikotaResponPerTopik;

  final String _funWalikotaPushNotif = "$getMainUrl/mediacenter/push_notif";
  String get getFunWalikotaPushNotif => _funWalikotaPushNotif;

  final String _funWalikotaTopikWaktuRespon =
      "$getMainUrl/mediacenter/topikwakturespon";
  String get getFunWalikotaTopikWaktuRespon => _funWalikotaTopikWaktuRespon;

  // ----------------------------------------------------------------------------

  // PENGADUAN ------------------------------------------------------------------

  final String _funGetMBRStatus =
      "https://api.surabaya.go.id/integrasi/api/sigamis/cek-mbr";
  String get getFunGetMBRStatus => _funGetMBRStatus;

  // ----------------------------------------------------------------------------

  // SUMBANG SARAN ------------------------------------------------------------------

  final String _funGetSumbangSaranKategori =
      "$getMainUrl/eplanning/bidang_urusan";
  String get getFunGetSumbangSaranKategori => _funGetSumbangSaranKategori;

  final String _funGetSumbangSaranSimpan = "$getMainUrl/eplanning/simpan_saran";
  String get getFunGetSumbangSaranSimpan => _funGetSumbangSaranSimpan;

  final String _funGetSumbangSaranJumlah =
      "$getMainUrl/eplanning/jumlah_saran_bidang_urusan";
  String get getFunGetSumbangSaranJumlah => _funGetSumbangSaranJumlah;

  final String _funGetSumbangSaran =
      "$getMainUrl/eplanning/saran_bidang_urusan";
  String get getFunGetSumbangSaran => _funGetSumbangSaran;

  final String _funGetSumbangSaranVisiMisi = "$getMainUrl/eplanning/visi_misi";
  String get getFunGetSumbangSaranVisiMisi => _funGetSumbangSaranVisiMisi;

  // --------------------------------------------------------------------------------

  // OJK ------------------------------------------------------------------

  final String _funGetPDFOJK = "$getMainUrl/ojk-pdf";
  String get getFunGetPDFOJK => _funGetPDFOJK;

  // --------------------------------------------------------------------------------

  // Sayang Warga ------------------------------------------------------------------

  final String _funPostSayang =
      "https://api.surabaya.go.id/integrasi/api/sayang-warga/role-user";
  String get getFunPostSayang => _funPostSayang;

  // --------------------------------------------------------------------------------

  // Maintain ------------------------------------------------------------------

  final String _funGetAsetMaintain = "$getMainUrl/banner";
  String get getFunGetAsetMaintain => _funGetAsetMaintain;

  // FUNCTION REQUEST POST OR GET -----------------------------------------------

  // Future getOrPost(String _getOrPost, String _functionUrl,
  //     Map<String, String> header, Map<String, dynamic> body) async {
  //   var request;
  //   if (_getOrPost == "POST") {
  //     request = await _apiProvider.postRequest(_functionUrl, header, body);
  //   } else {
  //     request = await _apiProvider.getRequest(_functionUrl, header);
  //   }

  //   return jsonDecode(request);
  // }

  // Future postMultipart(String _functionUrl, Map<String, String> header,
  //     Map<String, String> body, List<Map> photo) async {
  //   var request =
  //       await _apiProvider.postMultipart(_functionUrl, header, body, photo);
  //   return jsonDecode(request);
  // }
}

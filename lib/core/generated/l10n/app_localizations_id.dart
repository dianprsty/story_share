// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get name => 'Nama';

  @override
  String get password => 'Kata Sandi';

  @override
  String get login => 'Masuk';

  @override
  String get loginTitle => 'Selamat datang Kembali';

  @override
  String get loginSubtitle => 'Masuk dan mulai bagikan ceritamu!';

  @override
  String get dontHaveAccount => 'Belum punya akun?';

  @override
  String get createAccount => 'Buat akun baru';

  @override
  String get nameEmptyValidation => 'Nama tidak boleh kosong';

  @override
  String get passwordEmptyValidation => 'Kata sandi tidak boleh kosong';

  @override
  String get passwordLengthValidation => 'Kata sandi minimal 8 karakter';

  @override
  String get emailEmptyValidation => 'Email tidak boleh kosong';

  @override
  String get failedLoginMessage => 'Email atau kata sandi salah, silahkan coba lagi';

  @override
  String get successLoginMessage => 'Login berhasil';

  @override
  String get registerTitle => 'Yuk buat akun Story Share';

  @override
  String get registerSubtitle => 'Buat akun dan mulai bagikan ceritamu!';

  @override
  String get register => 'Daftar';

  @override
  String get haveAccount => 'Sudah punya akun?';

  @override
  String get uploadStory => 'Unggah Cerita';

  @override
  String get chooseImage => 'Pilih Gambar';

  @override
  String get upload => 'Unggah';

  @override
  String get description => 'Deskripsi';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galeri';

  @override
  String get uploadValidation => 'Gambar dan deskripsi tidak boleh kosong';

  @override
  String get uploadSuccess => 'Berhasil mengunggah cerita';

  @override
  String get logout => 'Keluar';

  @override
  String get logoutConfirmation => 'Apakah kamu yakin ingin keluar?';

  @override
  String get cancel => 'Batal';

  @override
  String get justNow => 'Baru saja';

  @override
  String minutesAgo(int time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time menit yang lalu',
      one: '$time menit yang lalu',
    );
    return '$_temp0';
  }

  @override
  String hoursAgo(int time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time jam yang lalu',
      one: '$time jam yang lalu',
    );
    return '$_temp0';
  }

  @override
  String daysAgo(int time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time hari yang lalu',
      one: '$time hari yang lalu',
    );
    return '$_temp0';
  }

  @override
  String get emptyStories => 'Belum ada cerita';

  @override
  String get storyNotFound => 'Cerita tidak ditemukan';

  @override
  String get seeOnMap => 'Lihat di Peta';

  @override
  String get permissionDenied => 'Izin akses okasi ditolak';

  @override
  String get failedToGetLocation => 'Gagal mendapatkan lokasi';

  @override
  String get failedToGetLocationInfo => 'Gagal mendapatkan info lokasi';

  @override
  String get noMoreStories => 'Semua cerita telah ditampilkan';

  @override
  String get storiesNotFound => 'Cerita tidak ditemukan';

  @override
  String get retry => 'Coba lagi';
}

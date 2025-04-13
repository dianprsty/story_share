import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// Text untuk nama
  ///
  /// In id, this message translates to:
  /// **'Nama'**
  String get name;

  /// Text untuk kata sandi
  ///
  /// In id, this message translates to:
  /// **'Kata Sandi'**
  String get password;

  /// Text untuk tombol login
  ///
  /// In id, this message translates to:
  /// **'Masuk'**
  String get login;

  /// Judul utama halaman login
  ///
  /// In id, this message translates to:
  /// **'Selamat datang Kembali'**
  String get loginTitle;

  /// Sub judul halaman login
  ///
  /// In id, this message translates to:
  /// **'Masuk dan mulai bagikan ceritamu!'**
  String get loginSubtitle;

  /// Text konfirmasi belum punya akun
  ///
  /// In id, this message translates to:
  /// **'Belum punya akun?'**
  String get dontHaveAccount;

  /// Text untuk tombol buat akun
  ///
  /// In id, this message translates to:
  /// **'Buat akun baru'**
  String get createAccount;

  /// Text validasi nama kosong
  ///
  /// In id, this message translates to:
  /// **'Nama tidak boleh kosong'**
  String get nameEmptyValidation;

  /// Text validasi kata sandi kosong
  ///
  /// In id, this message translates to:
  /// **'Kata sandi tidak boleh kosong'**
  String get passwordEmptyValidation;

  /// Text validasi kata sandi minimal 8 karakter
  ///
  /// In id, this message translates to:
  /// **'Kata sandi minimal 8 karakter'**
  String get passwordLengthValidation;

  /// Text validasi email kosong
  ///
  /// In id, this message translates to:
  /// **'Email tidak boleh kosong'**
  String get emailEmptyValidation;

  /// Text validasi email atau kata sandi salah
  ///
  /// In id, this message translates to:
  /// **'Email atau kata sandi salah, silahkan coba lagi'**
  String get failedLoginMessage;

  /// Text validasi berhasil login
  ///
  /// In id, this message translates to:
  /// **'Login berhasil'**
  String get successLoginMessage;

  /// Text judul halaman register
  ///
  /// In id, this message translates to:
  /// **'Yuk buat akun Story Share'**
  String get registerTitle;

  /// Text sub judul halaman register
  ///
  /// In id, this message translates to:
  /// **'Buat akun dan mulai bagikan ceritamu!'**
  String get registerSubtitle;

  /// Text untuk tombol daftar
  ///
  /// In id, this message translates to:
  /// **'Daftar'**
  String get register;

  /// Text konfirmasi sudah punya akun
  ///
  /// In id, this message translates to:
  /// **'Sudah punya akun?'**
  String get haveAccount;

  /// Text title halaman unggah cerita
  ///
  /// In id, this message translates to:
  /// **'Unggah Cerita'**
  String get uploadStory;

  /// Text untuk widget gambar saat kosong
  ///
  /// In id, this message translates to:
  /// **'Pilih Gambar'**
  String get chooseImage;

  /// Text untuk tombol unggah
  ///
  /// In id, this message translates to:
  /// **'Unggah'**
  String get upload;

  /// Text untuk label field deskripsi
  ///
  /// In id, this message translates to:
  /// **'Deskripsi'**
  String get description;

  /// Text untuk tombol kamera
  ///
  /// In id, this message translates to:
  /// **'Kamera'**
  String get camera;

  /// Text untuk tombol galeri
  ///
  /// In id, this message translates to:
  /// **'Galeri'**
  String get gallery;

  /// Text validasi field gambar dan deskripsi harus diidi
  ///
  /// In id, this message translates to:
  /// **'Gambar dan deskripsi tidak boleh kosong'**
  String get uploadValidation;

  /// Text validasi unggah berhasil
  ///
  /// In id, this message translates to:
  /// **'Berhasil mengunggah cerita'**
  String get uploadSuccess;

  /// Text untuk judul dan tombol logout
  ///
  /// In id, this message translates to:
  /// **'Keluar'**
  String get logout;

  /// Text konfirmasi keluar
  ///
  /// In id, this message translates to:
  /// **'Apakah kamu yakin ingin keluar?'**
  String get logoutConfirmation;

  /// Text untuk tombol batal
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get cancel;

  /// Text post baru dibawah 1 menit
  ///
  /// In id, this message translates to:
  /// **'Baru saja'**
  String get justNow;

  /// Text post baru dibawah 1 jam
  ///
  /// In id, this message translates to:
  /// **'{time, plural, one {{time} menit yang lalu} other {{time} menit yang lalu}}'**
  String minutesAgo(int time);

  /// Text post baru dibawah 1 hari
  ///
  /// In id, this message translates to:
  /// **'{time, plural, one {{time} jam yang lalu} other {{time} jam yang lalu}}'**
  String hoursAgo(int time);

  /// Text post baru dibawah 1 minggu
  ///
  /// In id, this message translates to:
  /// **'{time, plural, one {{time} hari yang lalu} other {{time} hari yang lalu}}'**
  String daysAgo(int time);

  /// Text informasi belum ada cerita
  ///
  /// In id, this message translates to:
  /// **'Belum ada cerita'**
  String get emptyStories;

  /// Text informasi cerita tidak ditemukan
  ///
  /// In id, this message translates to:
  /// **'Cerita tidak ditemukan'**
  String get storyNotFound;

  /// Text untuk tombol lihat di peta
  ///
  /// In id, this message translates to:
  /// **'Lihat di Peta'**
  String get seeOnMap;

  /// Text informasi izin ditolak
  ///
  /// In id, this message translates to:
  /// **'Izin akses okasi ditolak'**
  String get permissionDenied;

  /// Text informasi gagal mendapatkan lokasi
  ///
  /// In id, this message translates to:
  /// **'Gagal mendapatkan lokasi'**
  String get failedToGetLocation;

  /// Text informasi gagal mendapatkan info lokasi
  ///
  /// In id, this message translates to:
  /// **'Gagal mendapatkan info lokasi'**
  String get failedToGetLocationInfo;

  /// Text informasi tidak ada cerita lagi
  ///
  /// In id, this message translates to:
  /// **'Semua cerita telah ditampilkan'**
  String get noMoreStories;

  /// Text informasi cerita tidak ditemukan
  ///
  /// In id, this message translates to:
  /// **'Cerita tidak ditemukan'**
  String get storiesNotFound;

  /// Text untuk tombol coba lagi
  ///
  /// In id, this message translates to:
  /// **'Coba lagi'**
  String get retry;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

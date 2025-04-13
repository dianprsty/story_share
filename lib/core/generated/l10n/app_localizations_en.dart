// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get name => 'Name';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get loginTitle => 'Welcome Back';

  @override
  String get loginSubtitle => 'Log in and start sharing your stories with the world!';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get createAccount => 'Create an account';

  @override
  String get nameEmptyValidation => 'Name cannot be empty';

  @override
  String get passwordEmptyValidation => 'Password cannot be empty';

  @override
  String get passwordLengthValidation => 'Password must be at least 8 characters';

  @override
  String get emailEmptyValidation => 'Email cannot be empty';

  @override
  String get failedLoginMessage => 'Email or password is incorrect';

  @override
  String get successLoginMessage => 'Login Success';

  @override
  String get registerTitle => 'Let\'s join Story Share';

  @override
  String get registerSubtitle => 'Create an account and start your journey!';

  @override
  String get register => 'Register';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get uploadStory => 'Upload Story';

  @override
  String get chooseImage => 'Choose an Image';

  @override
  String get upload => 'Upload';

  @override
  String get description => 'Description';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get uploadValidation => 'Image and description cannot be empty';

  @override
  String get uploadSuccess => 'Upload Success';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get cancel => 'Cancel';

  @override
  String get justNow => 'Just now';

  @override
  String minutesAgo(int time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time minutes ago',
      one: '$time minute ago',
    );
    return '$_temp0';
  }

  @override
  String hoursAgo(int time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time hours ago',
      one: '$time hour ago',
    );
    return '$_temp0';
  }

  @override
  String daysAgo(int time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time days ago',
      one: '$time day ago',
    );
    return '$_temp0';
  }

  @override
  String get emptyStories => 'No stories yet';

  @override
  String get storyNotFound => 'Story not found';

  @override
  String get seeOnMap => 'See on Map';

  @override
  String get permissionDenied => 'Location permission denied';

  @override
  String get failedToGetLocation => 'Failed to get location';

  @override
  String get failedToGetLocationInfo => 'Failed to get location info';

  @override
  String get noMoreStories => 'All stories have been displayed';

  @override
  String get storiesNotFound => 'Stories not found';

  @override
  String get retry => 'Retry';
}

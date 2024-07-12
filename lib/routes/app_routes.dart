part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const QR = _Paths.QR;
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const SERIALNUM = _Paths.SERIALNUM;

}

abstract class _Paths {
  static const HOME = '/home';
  static const QR = '/qr';
  static const SPLASH = '/splash';
  static const SERIALNUM = '/serialNum';

}
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const DOCTOR_PROFILE = _Paths.DOCTOR_PROFILE;
  static const FEEDBACK = _Paths.FEEDBACK;
  static const MYHUMAN = _Paths.MYHUMAN;
  static const DMODELVIEW = _Paths.DMODELVIEW;
  static const JOURNAL = _Paths.JOURNAL;
  static const TABPAGE = _Paths.TABPAGE;
  static const PUBMED = _Paths.PUBMED;
  static const EUROPMC = _Paths.EUROPMC;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const DOCTOR_PROFILE = '/doctor-profile';
  static const FEEDBACK = '/feedback';
  static const MYHUMAN = '/anatomy';
  static const DMODELVIEW = '/modelview3d';
  static const JOURNAL = '/journal';
  static const TABPAGE = '/tabpage';
  static const PUBMED = '/pubmed';
  static const EUROPMC = '/europmc';
}

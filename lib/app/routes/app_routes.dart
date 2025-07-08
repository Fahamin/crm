part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const DOCTOR_PROFILE = _Paths.DOCTOR_PROFILE;
  static const FEEDBACK = _Paths.FEEDBACK;
  static const MYHUMAN = _Paths.MYHUMAN;
  static const DMODELVIEW = _Paths.DMODELVIEW;
  static const INFORMATION = _Paths.INFORMATION;
  static const TABPAGE = _Paths.TABPAGE;
  static const PUBMED = _Paths.PUBMED;
  static const EUROPMC = _Paths.EUROPMC;
  static const JOURNALCHOSE = _Paths.JOURNALCHOSE;
  static const BOOKS = _Paths.BOOKS;
  static const PDF_READ = _Paths.PDF_READ;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const DOCTOR_PROFILE = '/doctor-profile';
  static const FEEDBACK = '/feedback';
  static const MYHUMAN = '/anatomy';
  static const DMODELVIEW = '/modelview3d';
  static const INFORMATION = '/information';
  static const TABPAGE = '/tabpage';
  static const PUBMED = '/pubmed';
  static const EUROPMC = '/europmc';
  static const JOURNALCHOSE = '/journalchoose';
  static const BOOKS = '/books';
  static const PDF_READ = '/pdf-read';
}

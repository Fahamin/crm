import 'package:get/get.dart';

import '../modules/Pubmed/bindings/pubmed_binding.dart';
import '../modules/Pubmed/views/pubmed_view.dart';
import '../modules/anatomy/bindings/anatomy_binding.dart';
import '../modules/anatomy/views/anatomy_view.dart';
import '../modules/books/bindings/books_binding.dart';
import '../modules/books/views/books_view.dart';
import '../modules/doctor_profile/bindings/doctor_profile_binding.dart';
import '../modules/doctor_profile/views/doctor_profile_view.dart';
import '../modules/europmc/bindings/europmc_binding.dart';
import '../modules/europmc/views/europmc_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information/bindings/information_binding.dart';
import '../modules/information/views/information_view.dart';
import '../modules/journal_chosse_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/model_3d_screen.dart';
import '../modules/pdf_read/bindings/pdf_read_binding.dart';
import '../modules/pdf_read/views/pdf_read_view.dart';
import '../modules/pdfdownload/bindings/pdfdownload_binding.dart';
import '../modules/pdfdownload/views/pdfdownload_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/studenbook/bindings/studenbook_binding.dart';
import '../modules/studenbook/views/studenbook_view.dart';
import '../modules/tabpage/bindings/tabpage_binding.dart';
import '../modules/tabpage/views/tabpage_view.dart';
import '../modules/video/bindings/video_binding.dart';
import '../modules/video/views/video_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_PROFILE,
      page: () => DoctorProfileView(),
      binding: DoctorProfileBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.MYHUMAN,
      page: () => AnatomyView(),
      binding: AnatomyBinding(),
    ),
    GetPage(
      name: _Paths.DMODELVIEW,
      page: () => MyhumanDetailView(),
    ),
    GetPage(
      name: _Paths.INFORMATION,
      page: () => InformationView(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _Paths.TABPAGE,
      page: () => TabpageView(),
      binding: TabpageBinding(),
    ),
    GetPage(
      name: _Paths.PUBMED,
      page: () => PubmedView(),
      binding: PubmedBinding(),
    ),
    GetPage(
      name: _Paths.EUROPMC,
      page: () => EuropmcView(),
      binding: EuropmcBinding(),
    ),
    GetPage(
      name: _Paths.JOURNALCHOSE,
      page: () => JournalChosse(),
    ),
    GetPage(
      name: _Paths.BOOKS,
      page: () => BooksView(),
      binding: BooksBinding(),
    ),
    GetPage(
      name: _Paths.PDF_READ,
      page: () => PdfReadView(),
      binding: PdfReadBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.PDFDOWNLOAD,
      page: () => const PdfDownloadView(),
      binding: PdfdownloadBinding(),
    ),
    GetPage(
      name: _Paths.STUDENBOOK,
      page: () => const StudenbookView(),
      binding: StudenbookBinding(),
    ),
  ];
}

import 'package:desafio_vsaude/app/modules/register/register_binding.dart';
import 'package:desafio_vsaude/app/modules/register/register_page.dart';
import 'package:get/route_manager.dart';

import '../modules/home/home.dart';

import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}

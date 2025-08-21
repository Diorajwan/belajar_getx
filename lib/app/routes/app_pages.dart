import 'package:get/get.dart';

import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/formulir/bindings/formulir_binding.dart';
import '../modules/formulir/views/formulir_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pengejualan/bindings/pengejualan_binding.dart';
import '../modules/pengejualan/views/pengejualan_view.dart';
import '../modules/penjualan/bindings/penjualan_binding.dart';
import '../modules/penjualan/views/penjualan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.FORMULIR,
      page: () => const FormulirView(),
      binding: FormulirBinding(),
    ),
    GetPage(
      name: _Paths.PENGEJUALAN,
      page: () => const PengejualanView(),
      binding: PengejualanBinding(),
    ),
    GetPage(
      name: _Paths.PENJUALAN,
      page: () => const PenjualanView(),
      binding: PenjualanBinding(),
    ),
  ];
}

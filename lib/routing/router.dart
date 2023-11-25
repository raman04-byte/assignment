import 'package:assignment/features/home/screen/home.dart';
import 'package:assignment/features/search/screen/search.dart';
import 'package:get/get.dart';
import 'name_routes.dart';

class AppRouting {
  List<GetPage<dynamic>> getPages() {
    return [
      GetPage(
        name: NamesRoutes.home,
        page: () => const Home(),
      ),
      GetPage(
        name: NamesRoutes.search,
        page: () => const Search(),
      ),
    ];
  }
}

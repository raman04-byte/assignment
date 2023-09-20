import 'package:assignment/features/event_detail/screen/event_detail.dart';
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
      GetPage(
        name: NamesRoutes.event_detail,
        page: () => const EventDetail(),
      ),
    ];
  }
}

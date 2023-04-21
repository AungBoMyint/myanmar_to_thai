import 'package:get/get.dart';

import '../../view/pages/home_page.dart';
import '../../view/pages/profile_page.dart';

const String homePage = "/";
const String profilePage = "/profile";

List<GetPage> routes = [
  GetPage(name: homePage, page: () => const HomePage()),
  GetPage(name: profilePage, page: () => const ProfilePage()),
];

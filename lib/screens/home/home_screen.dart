import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saoirse_app/screens/home/home_controller.dart';
import 'package:saoirse_app/widgets/app_loader.dart';

class HomeScreen extends StatefulWidget {
  final void Function(Locale locale)? onLocaleChange;
  const HomeScreen({
    super.key,
    this.onLocaleChange,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                widget.onLocaleChange?.call(const Locale('hi'));
              },
            ),
          ],
        ),
        body: Obx(
          () => Stack(
            children: [
              Visibility(
                visible: homeController.loading.value,
                child: appLoader(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:erp_employee_app/core/domain/providers/root_provider.dart';
import 'package:erp_employee_app/core/presentation/components/loading_wrapper/loading_wrapper.dart';
import 'package:erp_employee_app/core/presentation/screen_provider_wrappers.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeScreenIndex = 0;
  List<Widget> screens = [
    ScreenProviderWrappers.attendance,
    ScreenProviderWrappers.employeeRequest(),
    ScreenProviderWrappers.notifications,
    Container()
  ];

  void changePage(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWrapper(
      isLoading: context.watch<RootProvider>().loading,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Paddings.screen),
            child: screens[activeScreenIndex],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          setIndex: changePage,
          index: activeScreenIndex,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linkedin/src/core/app_routes.dart';
import 'package:linkedin/src/core/constants/app_strings.dart';
import 'package:linkedin/src/services/navigation_service.dart';

import 'src/features/root/views/root_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      // theme: AppTheme.lightTheme,
      home: const RootView(),
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: ref.read(navigationService).navigatorKey,
    );
  }
}

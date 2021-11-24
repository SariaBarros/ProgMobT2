import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _loginManager = LoginManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(loginManager: _loginManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return ChangeNotifierProvider(
      create: (context) => _loginManager,
      child: MaterialApp(
        title: 'ReadingCount',
        theme: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
          primary: Colors.black,
          secondary: Colors.pink,
        )),
        home: Router(
          routerDelegate: _appRouter,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}

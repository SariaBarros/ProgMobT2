import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/livro_dao.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _loginManager = LoginManager();
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      loginManager: _loginManager,
      appStateManager: _appStateManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _loginManager),
        ChangeNotifierProvider(create: (context) => _appStateManager),
        Provider<LivroDAO>(create: (context) => LivroDAO()),
      ],
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

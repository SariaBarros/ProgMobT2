import 'package:flutter/material.dart';
import 'dart:async';
import '../models/models.dart';
import '../telas/telas.dart';
import 'rotas.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final LoginManager loginManager;

  AppRouter({required this.loginManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    loginManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    loginManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (!loginManager.logado) TelaLogin.page(),
        if (loginManager.tocouCadastro) TelaCadastro.page(),
      ],
      onPopPage: _handlePopPage,
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == Rotas.cadastro) {
      loginManager.sairCadastro();
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
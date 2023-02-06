import 'package:config/bootstrap/app_injection.dart';
import 'package:config/bootstrap/app_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget/todos/todos_screen.dart';
import 'package:config/injectable/app_injector.dart';
import '../focus_bloc_cubit.dart';
import '../location_provider.dart';
import '../page_route/pop_scope_dismiss_route.dart';
import '../sign/signin_screen.dart';

class AppCommon extends AppRegister {
  @override
  Future<void> dependencies(AppInjection injection) async {
    injection.factory<LocaleProvider>(() => LocaleProvider());
    injection.factory<FocusBlocCubit>(() => FocusBlocCubit());
  }

  static const String home = '/home';
  static const String launcher = '/launcher';
  static const String todoScreen = '/todoScreen';
  @override
  List<String> routers = [home, launcher, todoScreen];

  @override
  Route? onGenerate(AppInjection injection, RouteSettings settings) {
    switch (settings.name) {
      case home:
        return popScopeDismissRoute(
          settings: settings,
          child: () => MultiBlocProvider(providers: [
            BlocProvider<FocusBlocCubit>(
                create: (_) => AppInjector.I.get()..registerFocusSignIn())
          ], child: const SignInScreen()),
        );

      case launcher:
        return popScopeDismissRoute(
          settings: settings,
          child: () =>  const LauncherPage(),
        );

      case todoScreen:
        return popScopeDismissRoute(
          settings: settings,
          child: () =>  const TodoScreen(title: "todos"),
        );
      default:
        return null;
    }
  }
}

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 288,
          width: 288,
          child: Icon(Icons.more),
        ),
      ),
    );
  }
}

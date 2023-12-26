import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vid_share/bloc/auth/auth_bloc.dart';
import 'package:vid_share/bloc_observer.dart';
import 'package:vid_share/firebase_options.dart';
import 'package:vid_share/repository/auth/auth_repository.dart';
import 'package:vid_share/route_config/router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = CustomBlocObserver();
  final AuthRepository authRepository = AuthRepository();
  final bool isLoggedIn = authRepository.checkLogin();

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    authRepository: authRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key, required this.isLoggedIn, required this.authRepository});

  final bool isLoggedIn;
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(loginRepository: authRepository))
      ],
      child: MaterialApp.router(
        title: "VidShare",
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouterConfig.getRoutes(isLoggedIn),
      ),
    );
  }
}

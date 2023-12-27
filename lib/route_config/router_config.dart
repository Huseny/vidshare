import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vid_share/presentation/screens/homepage.dart';
import 'package:vid_share/presentation/screens/login_page.dart';
import 'package:vid_share/presentation/screens/record_video.dart';
import 'package:vid_share/presentation/screens/verify_otp.dart';
import 'package:vid_share/presentation/screens/video_detailed_view.dart';
import 'package:vid_share/route_config/route_constants.dart';

class AppRouterConfig {
  static GoRouter getRoutes(bool isLoggedIn) {
    GoRouter routes = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => MaterialPage(
              child:
                  // isLoggedIn ? HomePage() : const LoginPage()
                  HomePage()),
        ),
        GoRoute(
          path: '/home',
          name: RouteConstants.HOME,
          pageBuilder: (context, state) => MaterialPage(child: HomePage()),
        ),
        GoRoute(
          path: "/login",
          name: RouteConstants.LOGIN,
          pageBuilder: (context, state) => const MaterialPage(
            child: LoginPage(),
          ),
        ),
        GoRoute(
          path: "/verifyOtp/:verificationId",
          name: RouteConstants.VERIFYOTP,
          pageBuilder: (context, state) => MaterialPage(
            child: VerifyOtp(
              verificationId: state.pathParameters["verificationId"]!,
            ),
          ),
        ),
        GoRoute(
          path: "/videodetails/:id",
          name: RouteConstants.VIDEODETAILS,
          pageBuilder: (context, state) => MaterialPage(
            child: VideoDetailedView(
              id: state.pathParameters["id"]!,
            ),
          ),
        ),
        GoRoute(
          path: "/recordvideo",
          name: RouteConstants.RECORDVIDEO,
          pageBuilder: (context, state) => const MaterialPage(
            child: RecordVideo(),
          ),
        ),
      ],
    );
    return routes;
  }
}

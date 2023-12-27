import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vid_share/presentation/screens/homepage.dart';
import 'package:vid_share/presentation/screens/login_page.dart';
import 'package:vid_share/presentation/screens/post_video.dart';
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
          pageBuilder: (context, state) =>
              MaterialPage(child: isLoggedIn ? const HomePage() : const LoginPage()),
        ),
        GoRoute(
          path: '/home',
          name: RouteConstants.HOME,
          pageBuilder: (context, state) =>
              const MaterialPage(child: HomePage()),
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
        GoRoute(
            path: "/postvideo/:path/:location",
            name: RouteConstants.POSTVIDEO,
            pageBuilder: (context, state) => MaterialPage(
                  child: PostVideo(
                    path: state.pathParameters["path"]!,
                    location: state.pathParameters["location"]!,
                  ),
                )),
      ],
    );
    return routes;
  }
}

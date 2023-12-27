
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vid_share/route_config/route_constants.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            [Permission.camera, Permission.microphone, Permission.location]
                .request()
                .then((value) {
              if (value[Permission.camera]!.isGranted &&
                  value[Permission.microphone]!.isGranted && value[Permission.location]!.isGranted) {
                GoRouter.of(context).pushNamed(RouteConstants.RECORDVIDEO);
              }
            });
          },
          child: const Icon(
            Icons.add_circle,
            color: Colors.red,
            size: 50,
          ),
        ),
      ),
    );
  }
}

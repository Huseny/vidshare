
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/camera_logo.svg",
                semanticsLabel: "VidShare Logo",
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "VidShare",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(255, 255, 255, 1)),
            child: SvgPicture.asset("assets/bell.svg"),
          )
        ],
      ),
    );
  }
}

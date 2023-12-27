import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vid_share/presentation/components/home_body.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(246, 237, 245, 1),
            body: Column(children: [
              Container(
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
                          color: Colors.white),
                      child: SvgPicture.asset("assets/bell.svg"),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      hintText: "Search",
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.black, width: 1.5))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              HomeBody()
            ])));
  }
}

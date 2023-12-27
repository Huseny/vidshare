import 'package:flutter/material.dart';
import 'package:vid_share/presentation/components/custom_bottom_sheet.dart';
import 'package:vid_share/presentation/components/custom_topbar.dart';
import 'package:vid_share/presentation/components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomSheet: const CustomBottomSheet(),
            backgroundColor: const Color.fromRGBO(246, 237, 245, 1),
            body: Column(children: [
              const CustomTopBar(),
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

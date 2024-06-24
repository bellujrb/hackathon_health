import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/home/presenter/widgets/triagem_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiary,
      appBar: AppBar(
        title: SizedBox(
          height: 25,
          width: 25,
          child: Image.asset("assets/icon_appbar.png"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Modular.to.navigate("triagecreate");
            },
            child: Container(
              alignment: Alignment.center,
              height: 56,
              width: context.mediaWidth * 1.0,
              decoration: BoxDecoration(color: AppColors.primary),
              child: Text(
                "Fazer uma nova triagem",
                style: GoogleFonts.lato(
                    textStyle: context.appTextStyles.smallWhite),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Triagens realizadas",
                  style: GoogleFonts.lato(
                      textStyle: context.appTextStyles.mediumBlack),
                ),
                const SizedBox(
                  height: 20,
                ),
                triageModel(context)
              ],
            ),
          )
        ],
      ),
    );
  }
}

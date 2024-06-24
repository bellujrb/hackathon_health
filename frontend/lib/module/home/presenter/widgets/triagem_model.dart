import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

Widget triageModel(BuildContext context) {
  return InkWell(
    onTap: () {
      Modular.to.navigate("triageinfo");
    },
    child: Container(
      height: 88,
      width: context.mediaWidth * 0.9,
      decoration: BoxDecoration(color: AppColors.onTertiary),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            alignment: Alignment.center,
            height: 64,
            width: 64,
            decoration: BoxDecoration(color: AppColors.tertiary),
            child: Image.asset("assets/icon-warn.png"),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Triagem #1",
                style: GoogleFonts.lato(
                    textStyle: context.appTextStyles.mediumBlack),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    "23/06/2024",
                    style: GoogleFonts.lato(),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("-", style: GoogleFonts.lato()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("ALTO RISCO",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(color: Colors.red)))
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/home/presenter/widgets/triagem_model.dart';
import 'package:google_fonts/google_fonts.dart';

class TriageInfoScreen extends StatelessWidget {
  const TriageInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String overview =
        "Cotação total é de 8-20; é aceitável prescindir da Entrevista de Seguimento e encaminhar a criança para avaliação de diagnóstico e possível sinalização para intervenção precoce.";

    String analysis =
        "O usuário que realizou a triagem optou por utilizar os seguintes dados";

    return Scaffold(
      backgroundColor: AppColors.tertiary,
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Modular.to.navigate("/");
          },
          child: Row(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/back-icon.png"),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Triagem #1",
                style: context.appTextStyles.mediumBlack,
              )
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 56,
              width: context.mediaWidth * 1.0,
              decoration: BoxDecoration(color: AppColors.primary),
              child: Text(
                "Marcar Consulta",
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
                triageModel(context),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Resumo",
                  style: GoogleFonts.lato(
                      textStyle: context.appTextStyles.mediumBlack),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  overview,
                  style: GoogleFonts.lato(
                      textStyle: context.appTextStyles.smallGray),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Analise",
                  style: GoogleFonts.lato(
                      textStyle: context.appTextStyles.mediumBlack),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  analysis,
                  style: GoogleFonts.lato(
                      textStyle: context.appTextStyles.smallGray),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset("assets/icon-check.png"),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "M-Chat",
                      style: GoogleFonts.lato(
                          textStyle: context.appTextStyles.smallBlack),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      color: AppColors.onTertiary,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Historico Medico",
                      style: GoogleFonts.lato(
                          textStyle: context.appTextStyles.smallBlack),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

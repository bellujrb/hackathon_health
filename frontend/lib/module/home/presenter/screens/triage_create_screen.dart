import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/home/infra/data/questions.dart';
import 'package:frontend/module/home/presenter/widgets/question_model.dart';
import 'package:google_fonts/google_fonts.dart';

class TriageCreateScreen extends StatefulWidget {
  const TriageCreateScreen({super.key});

  @override
  State<TriageCreateScreen> createState() => _TriageCreateScreenState();
}

class _TriageCreateScreenState extends State<TriageCreateScreen> {
  @override
  Widget build(BuildContext context) {
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
                "Nova Triage",
                style: context.appTextStyles.mediumBlack,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Historico Medico (Opcional)",
              style: GoogleFonts.lato(
                  textStyle: context.appTextStyles.mediumBlack),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: context.mediaWidth * 1.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 96,
                    width: 96,
                    child: Image.asset("assets/upload.png"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Carregue sua imagem localmente",
                    style: GoogleFonts.lato(
                        textStyle: context.appTextStyles.mediumBlack),
                  ),
                  const SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    "Tamanho máximo: 5mb, Formato: pdf",
                    style: GoogleFonts.lato(
                        textStyle: context.appTextStyles.smallGray),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Perguntas (Obrigatório)",
              style: GoogleFonts.lato(
                  textStyle: context.appTextStyles.mediumBlack),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      QuestionModelWidget(question: questions[index]),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                int yesCount = questions.where((q) => q.isYes).length;

                String title, content;

                if (yesCount <= 2) {
                  title = 'Baixo Risco';
                  content =
                      'Cotação total é de 0-2; se a criança tiver menos de 24 meses, repetir o M-CHAT-R aos 24 meses. Não é necessária nenhuma outra medida, a não ser que a vigilância indique risco de PEA.';
                } else if (yesCount <= 7) {
                  title = 'Risco Moderado';
                  content =
                      'Cotação total é 3-7; administrar a Entrevista de Seguimento (segunda etapa do M-CHAT-R/F) para conseguir informação adicional sobre as respostas de risco. Se a cotação do M-CHAT-R/F continuar a ser igual ou superior a 2, a criança cota positivo no despiste. Medidas necessárias: encaminhar a criança para avaliação de diagnóstico e possível sinalização para intervenção precoce. Se a cotação da Entrevista de Seguimento for 0-1, a criança cota negativo. Nenhuma outra medida é necessária, a não ser que a vigilância indique risco de PEA. A criança deverá voltar a fazer o despiste posteriormente.';
                } else {
                  title = 'Alto Risco';
                  content =
                      'Cotação total é de 8-20; é aceitável prescindir da Entrevista de Seguimento e encaminhar a criança para avaliação de diagnóstico e possível sinalização para intervenção precoce.';
                }

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      title,
                      style: GoogleFonts.lato(),
                    ),
                    content: Text(
                      content,
                      style: GoogleFonts.lato(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => {
                          for (var question in questions)
                            {question.isYes = false},
                          setState(() {}),
                          Modular.to.navigate("/")
                        },
                        child: Text(
                          'Continuar',
                          style: GoogleFonts.lato(),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 56,
                width: context.mediaWidth * 1.0,
                decoration: BoxDecoration(color: AppColors.primary),
                child: Text(
                  "Continuar",
                  style: GoogleFonts.lato(
                      textStyle: context.appTextStyles.smallWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

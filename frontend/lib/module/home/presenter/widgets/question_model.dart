import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/home/infra/model/questions_model.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionModelWidget extends StatefulWidget {
  final QuestionModel question;

  const QuestionModelWidget({super.key, required this.question});

  @override
  State<QuestionModelWidget> createState() => _QuestionModelWidgetState();
}

class _QuestionModelWidgetState extends State<QuestionModelWidget> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue =
        widget.question.isYes; 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: context.mediaWidth * 0.9,
      decoration: BoxDecoration(
        color: AppColors.onTertiary,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.mediaWidth * 0.7,
              child: Text(
                widget.question.question,
                style: GoogleFonts.lato(
                  textStyle: context.appTextStyles.smallBlack,
                ),
              ),
            ),
            Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                  widget.question.isYes = value;
                });
              },
              activeColor: AppColors.tertiary,
              activeTrackColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

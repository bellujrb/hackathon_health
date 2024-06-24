class QuestionModel {
  final String question;
  final String help;
  bool isYes;

  QuestionModel(
      {required this.question, required this.help, this.isYes = false});
}

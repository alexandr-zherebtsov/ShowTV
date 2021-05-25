import 'package:get/get.dart';

class QuestionModel {
  int id;
  String question;
  List<AnswerModel> answers;
  RxInt? result;
  QuestionModel({required this.id, required this.question, required this.answers, required this.result});
}

class AnswerModel {
  int id;
  String answer;
  int num;
  AnswerModel({required this.id, required this.answer, required this.num});
}

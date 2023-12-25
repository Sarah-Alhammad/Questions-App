import 'package:questionsapp/features/question/domain/entities/question.dart';

class QuestionModel extends Question{
  QuestionModel(super.id, super.questionText, super.answer);

factory QuestionModel.fromJson(Map<String,dynamic> json){
 return QuestionModel(json["id"], json["questionText"], json["answer"]);

}

Map<String,dynamic> toJson(){
 return ({
  'id': id,
  "question": questionText,
  "answer": answer
 }
 );

}
}
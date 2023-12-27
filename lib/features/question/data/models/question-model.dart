import 'package:questionsapp/features/question/domain/entities/question.dart';

class QuestionModel extends Question{
  QuestionModel({ super.id, required super.questionText, required super.answer});

factory QuestionModel.fromJson(Map<String,dynamic> json){
 return QuestionModel( id :json["id"], questionText: json["questionText"],answer: json["answer"]);

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
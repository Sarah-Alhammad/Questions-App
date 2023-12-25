
import 'package:equatable/equatable.dart';
class Question extends Equatable{
int ? id;
String questionText;
String answer;

Question( { this.id,required this.questionText,required this.answer});

  @override
  // TODO: implement props
  List<Object?> get props => [id,questionText,answer];

}
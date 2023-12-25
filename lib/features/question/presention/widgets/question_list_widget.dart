import 'package:flutter/material.dart';
import '../screen/question_detail_screen.dart';
import 'question_detail_widget.dart';
import '../../domain/entities/question.dart';
class QuestionListWidget extends StatelessWidget {
  List<Question> questions;
   QuestionListWidget({Key? key,required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
      return ListTile(
        leading: Text(questions[index].id.toString(),),
        title: Text(questions[index].questionText,style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(questions[index].answer,style: TextStyle(fontSize: 19),),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (_)=>QuestionDetailScreen()));
        },
      );
    },
        separatorBuilder:(context,index){
      return Divider();
        } ,
        itemCount: questions.length);
  }
}

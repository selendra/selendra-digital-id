import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/models/dashboard_m.dart';

class Info extends StatefulWidget{

  final DashBoardModel? model;

  Info({this.model});

  @override
  InfoState createState() => InfoState();
}

class InfoState extends State<Info>{
  
  @override
  Widget build(BuildContext context) {

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.only(bottom: 5),

              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  label: MyText(text: "Name", color2: greyColor),
                  floatingLabelBehavior: FloatingLabelBehavior.always,

                  //Style
                  labelStyle: TextStyle(color: greyColor),
                  enabledBorder: widget.model!.isEditing == false ? UnderlineInputBorder(borderSide: BorderSide.none) : UnderlineInputBorder(),
                  border: widget.model!.isEditing == false ? UnderlineInputBorder(borderSide: BorderSide.none) : UnderlineInputBorder(),
                  
                  enabled: widget.model!.isEditing,
                ),
                controller: widget.model!.nameController,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  label: MyText(text: "Email", color2: greyColor),
                  floatingLabelBehavior: FloatingLabelBehavior.always,

                  //Style
                  labelStyle: TextStyle(color: greyColor),
                  enabledBorder: widget.model!.isEditing == false ? UnderlineInputBorder(borderSide: BorderSide.none) : UnderlineInputBorder(),
                  border: widget.model!.isEditing == false ? UnderlineInputBorder(borderSide: BorderSide.none) : UnderlineInputBorder(),

                  enabled: widget.model!.isEditing,
                ),
                controller: widget.model!.emailController,
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  label: MyText(text: "Nationality", color2: greyColor),
                  floatingLabelBehavior: FloatingLabelBehavior.always,

                  //Style
                  labelStyle: TextStyle(color: greyColor),
                  enabledBorder: widget.model!.isEditing == false ? UnderlineInputBorder(borderSide: BorderSide.none) : UnderlineInputBorder(),
                  border: widget.model!.isEditing == false ? UnderlineInputBorder(borderSide: BorderSide.none) : UnderlineInputBorder(),

                  enabled: widget.model!.isEditing,
                ),
                controller: widget.model!.nationalityController,
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  label: MyText(text: "Phone Number", color2: greyColor),
                  floatingLabelBehavior: FloatingLabelBehavior.always,

                  //Style
                  labelStyle: TextStyle(color: greyColor),
                  enabledBorder: widget.model!.isEditing == false ? UnderlineInputBorder(borderSide: BorderSide.none) : UnderlineInputBorder(),
                  border: widget.model!.isEditing == false ? UnderlineInputBorder(borderSide: BorderSide.none) : UnderlineInputBorder(),

                  enabled: widget.model!.isEditing,
                ),
                controller: widget.model!.phoneNumController,
              )
            ),
          ],
        )
      )
    );
  }
}
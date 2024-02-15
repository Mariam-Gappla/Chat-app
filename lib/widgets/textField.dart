import 'package:flutter/material.dart';
class CustomFormfield extends StatelessWidget {
  CustomFormfield(this.hint,this.onchanged) ;
 String hint;
 Function(String)? onchanged;
 TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 70,
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 8),
      child: TextFormField(
        controller: controller,
        onChanged: onchanged,
        validator: (data){
          if(data!.isEmpty)
            {
              return "required";
            }
          else
            {
              return null;
            }
        },
        style:TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )
          ),
          ),
    );
  }
}

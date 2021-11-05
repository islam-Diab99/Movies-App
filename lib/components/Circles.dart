
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
   Circle({Key? key, this.title,this.content}) : super(key: key);
  final String? title;
  var content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: Alignment.center,
                child: content,
              ),),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red,width: 2),

              ),

            ),

          ],
        ),
        Text(
          title!,),
      ],
    );
  }
}

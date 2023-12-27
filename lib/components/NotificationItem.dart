import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.orange, width: 1),
            borderRadius: BorderRadius.circular(80),
          ),
          child: const CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 35,
            child: Icon(Icons.date_range,
              color: Colors.white, size: 35,)

          ),),

        Container(
          width: 170,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Smiley's Store marked your order #1982984 as Shipped",
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 16
                ),),
              // SizedBox(width: 170,
              //   child: Divider(height: 35,
              //     thickness: 1,
              //     color: Colors.grey,),
              // ),
            ],
          ),
        ),
        Text('9:20 AM'),
      ],);
  }
}

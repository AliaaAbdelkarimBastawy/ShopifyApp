import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationItem extends StatelessWidget {
  String title;
  String description;
  DateTime time;
   NotificationItem({Key? key, required this.title, required this.description, required this.time}) : super(key: key);

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
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 4,),
              Text(description,
                maxLines: 2,
                style: const TextStyle(fontWeight: FontWeight.bold,
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
        Text('${time.hour}: ${time.minute} ${ DateFormat('a').format(time)}'),
      ],);
  }
}



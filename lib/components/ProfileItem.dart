import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  String txt;
  IconData icon;
   ProfileItem({Key? key,
    required this.icon, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0,
                left: 16,
                right: 16,
                bottom: 4
            ),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 16,),
                Text(txt, style: const TextStyle(fontSize: 16),),
                const Spacer(),
                const CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.arrow_forward_ios_outlined,
                    color: Colors.white, size: 14,),)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 56.0, right:16 ),
            child: Divider(color: Colors.grey, thickness: 1,),
          )
        ],
      ),
    );
  }
}

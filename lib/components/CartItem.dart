import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(80),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: Image.asset('assets/images/dresses.png',
              height: 70,
              width: 70,),

          ),),
        const SizedBox(width: 20,),
        const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Faux Sued Ankle Boots',
              style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 18
              ),),
            SizedBox(height: 4,),
            Row(children: [
              Text('4.5,', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 18
              )),
              SizedBox(width: 4,),
              Text('Hot pink', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 18
              )),
            ],),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(r'$49.99', style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFBBBBBB),
                  radius: 15,
                  child: Icon(Icons.remove, color: Colors.white,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('1', style: TextStyle(fontSize: 18),),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xFFBBBBBB),
                  radius: 15,
                  child: Icon(Icons.add, color: Colors.white,),),
              ],),
            SizedBox(width: 220,
              child: Divider(height: 35,
                thickness: 1,
                color: Colors.grey,),
            ),

          ],
        ),

      ],);
  }
}

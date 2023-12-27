import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ProfileItem.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const CircleAvatar(backgroundColor: Colors.white, radius: 40,child: Icon(Icons.person,
                color: Colors.black,size: 48,
              ),),
              const SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Jane Doe', style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 24),),
                  const SizedBox(height: 8,),
                  const Text('jane@gmail.com', style: TextStyle(fontSize: 16),),
                 const SizedBox(height: 8,),
                  SizedBox(width: 135,
                      child: Card(
                        color: const Color(0xFFF5F6F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(width: 1,
                              color: Color(0xFFE3E5E7),)
                        ),
                        elevation:5, child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child:
                        Text('EDIT PROFILE',
                          style: TextStyle(color: Colors.black54,
                            fontWeight: FontWeight.bold),)),
                      ),)),

                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0,
              left: 16, right: 16,
              bottom: 4),
          child: Container(
            height: 300,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              color: Colors.white,
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical:16,
                    horizontal: 16.0),
                child: Column(children: [
                  ProfileItem(icon: Icons.menu_sharp, txt: 'All My Orders',),
                  ProfileItem(icon: Icons.local_shipping, txt: 'Pending Shipments',),
                  ProfileItem(icon: Icons.credit_card, txt: 'Pending Payment',),
                  ProfileItem(icon: FontAwesomeIcons.bagShopping, txt: 'Finished Orders',),


                ],),
              ),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0,
              left: 16, right: 16, bottom: 8),
          child: Container(
            height: 300,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              elevation: 8,
              color: Colors.white,
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical:16,
                    horizontal: 16.0),
                child: Column(children: [
                  ProfileItem(icon: Icons.message_rounded, txt: 'Invite Friends',),
                  ProfileItem(icon: Icons.safety_check_rounded, txt: 'Customer Support',),
                  ProfileItem(icon: Icons.star, txt: 'Rate Our App',),
                  ProfileItem(icon: Icons.book_online_sharp, txt: 'Make a Suggestion',),

                ],),
              ),),
          ),
        ),
      ],
    );
  }
}

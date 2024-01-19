import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopify_app/Views/LoginView.dart';

import '../Views/CreditCardInfoView.dart';
import 'ProfileItem.dart';

class ProfileViewBody extends StatelessWidget {
  String email;
   ProfileViewBody({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 48,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                     email.split('@').first,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              )
            ],
          ),
        ),

        const SizedBox(
          height: 28,
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 16.0, left: 16, right: 16, bottom: 4),
          child: Container(
            height: 120,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
                child: Column(
                  children: [

                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 10,
                                  title: const Text(
                                    "Do you want to logout?",
                                    style:
                                        TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text("Yes", style: TextStyle(color: Colors.red),),
                                      onPressed: () async {
                                        try{
                                          await FirebaseAuth.instance.signOut();
                                          if(context.mounted)
                                          {
                                            Navigator.pushNamed(context, LoginView.id);
                                          }


                                        }
                                        on FirebaseAuthException catch(e)
                                        {
                                          if(context.mounted)
                                          {
                                            showDialog(context: context, builder: (context)
                                            {
                                              return AlertDialog(
                                                backgroundColor: Colors.red,
                                                content: Text(e.message.toString(), style: const TextStyle(color: Colors.white),),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                              );
                                            });
                                          }
                                        }
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("No", style: TextStyle(color: Colors.green),),
                                      onPressed: ()  {
                                        Navigator.pop(context);
                                        }
                                    ),
                                  ],
                                );
                              });
                        },
                        child: ProfileItem(
                          icon: Icons.logout_outlined,
                          txt: 'Logout',
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}

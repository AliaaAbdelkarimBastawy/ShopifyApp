import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/models/CartModel.dart';

import '../main.dart';

class CartItem extends StatefulWidget {
  CartModel model;
  CartItem({super.key, required this.model});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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
            child: Image.network(
              widget.model.image,
              height: 70,
              width: 70,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.model.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(widget.model.size,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 18)),
                const SizedBox(
                  width: 4,
                ),
                Text(widget.model.color,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 18)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "\$ ${widget.model.price}",
                style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Consumer<Model>(
                builder: (BuildContext context, Model value, Widget? child) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      value.decreaseQuantityOfProduct(widget.model);
                      setState(() {

                      });

                    },
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFFBBBBBB),
                      radius: 15,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${widget.model.quantity}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      value.increaseQuantityOfProduct(widget.model);
                      setState(() {

                      });

                    },
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFFBBBBBB),
                      radius: 15,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(
              width: 220,
              child: Divider(
                height: 35,
                thickness: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

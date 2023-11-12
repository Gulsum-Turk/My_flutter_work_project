import 'package:flutter/material.dart';

class Urunler extends StatelessWidget {
  const Urunler({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(children: [
        Row(children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Önceki sayfa')),
        ],),
        Text('Ürünlerin sayfası')
      ],)
    );
  }
}
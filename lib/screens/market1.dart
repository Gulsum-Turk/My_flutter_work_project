import 'package:flutter/material.dart';

class Market1 extends StatelessWidget {
  const Market1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(children: [
        Row(children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Önceki sayfa')),
        ],),
        Text('Market 1 in sayfası')
      ],)
    );
  }
}

class Market2 extends StatelessWidget {
  const Market2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(children: [
        Row(children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Önceki sayfa')),
        ],),
        Text('Market 2 in sayfası')
      ],)
    );
  }
}

class Market3 extends StatelessWidget {
  const Market3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(children: [
        Row(children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Önceki sayfa')),
        ],),
        Text('Market 3 in sayfası')
      ],)
    );
  }
}


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
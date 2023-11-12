import 'package:flutter/material.dart';

class Market1 extends StatelessWidget {


  @override
  List<Card> cards =[
    cardDesign(),
    cardDesign(),
    cardDesign(),
    cardDesign(),
    cardDesign(),
    cardDesign(),
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 242, 242, 242),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 150, 205),
            title: Card(
              color: Color.fromRGBO(213, 231, 255, 0.929),
              child: Center(
                  child: Text(
                'Market1 indirimleri',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  letterSpacing: 2,
                  color: const Color.fromARGB(255, 22, 21, 20),
                ),
              )),
            ),
            centerTitle: true,
            actions: [Icon(Icons.share)],
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: Container(
              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(8)),
              child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Builder(builder: (context) {
                 
                  return GestureDetector(
                      child: cards[index],
                      onTap: () => print('basıldı'));
                });
              },
              itemCount: cards.length,
            ),
              
              
              
              
              
              )),
    );
  }
}

Card cardDesign() {
  return Card(
    clipBehavior: Clip.hardEdge,
    child: InkWell(
      splashColor: Color.fromARGB(255, 252, 236, 188),
      onTap: () => debugPrint('basıldı'),
      child: SizedBox(
        child: Text('ürün1'),
        height: 200,
        width: 100,
      ),
    ),
  );
}
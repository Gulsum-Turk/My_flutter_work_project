import 'package:flutter/material.dart';
import 'package:my_study_project/screens/market1.dart';
import 'package:my_study_project/screens/market2.dart';
import 'package:my_study_project/screens/market3.dart';
import 'package:my_study_project/screens/urunler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int taraf=0;
  List<Card> cards = [
    kartlar(
        'Market1',
        'İndirimler, yeni gelen ürünler...',
        Icon(
          Icons.shopping_bag_outlined,
          size: 40,
        )),
    kartlar(
        'Market2',
        'İndirimler, yeni gelen ürünler...',
        Icon(
          Icons.shopping_bag_outlined,
          size: 40,
        )),
    kartlar(
        'Market3',
        'İndirimler, yeni gelen ürünler...',
        Icon(
          Icons.shopping_bag_outlined,
          size: 40,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          
          children: [
            Expanded(
              
              child: TextButton(
                  onPressed: () {
                    taraf=0;
                    setState(() {
                      
                      cards = [
                        kartlar(
                            'Market1',
                            'İndirimler, yeni gelen ürünler...',
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 40,
                            )),
                        kartlar(
                            'Market2',
                            'İndirimler, yeni gelen ürünler...',
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 40,
                            )),
                        kartlar(
                            'Market3',
                            'İndirimler, yeni gelen ürünler...',
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 40,
                            )),
                      ];
                    });
                  },
                  child: Text('Marketler'),
                  ),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    taraf=1;
                    setState(() {
                      
                      cards = [
                        kartlar(
                            'LİKİD RUJ',
                            'sadece 89.99 tl',
                            Icon(
                              Icons.add_alarm_sharp,
                              size: 40,
                            )),
                        kartlar(
                            'EYELİNER',
                            'sadece 155.45 tl',
                            Icon(
                              Icons.add_alarm_sharp,
                              size: 40,
                            )),
                        kartlar(
                            'CONSİDER',
                            'sadece 245.90 tl',
                            Icon(
                              Icons.add_alarm_sharp,
                              size: 40,
                            )),
                        kartlar(
                            'EL KREMİ',
                            'sadece 245.90 tl',
                            Icon(
                              Icons.add_alarm_sharp,
                              size: 40,
                            )),
                      ];
                    });
                  },
                  child: Text('Son Eklenenler')),
            )
          ],
        ),
        Expanded(
          child: Container(
            //color: Color.fromARGB(255, 214, 217, 223),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 40, bottom: 0, left: 50, right: 50),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Builder(builder: (context) {
                  return GestureDetector(
                      child: cards[index],
                      onTap: () => sayfabulucu(index));
                });
              },
              itemCount: cards.length,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('2023-demo')],
        )
      ]),
    );
  }
  
  sayfabulucu(int index) {
    
    if(taraf==0){
      if(index==0){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Market1()));
    }
    if(index==1){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Market2()));
    }
    if(index==2){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Market3()));
    }
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Urunler()));
    }
  }
}


Card kartlar(String deger, String aciklama, Icon bir) {
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          bir,
          //Icon(Icons.shopping_cart, size: 50, color: Color.fromARGB(255, 141, 145, 147)),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  deger,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  aciklama,
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

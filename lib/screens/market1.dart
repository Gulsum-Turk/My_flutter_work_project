import 'package:flutter/material.dart';
import 'package:my_study_project/models/data.dart';

class Market1 extends StatefulWidget {
 const Market1({Key? key}) : super(key: key);

  @override
  State<Market1> createState() => _Market1State();
}

class _Market1State extends State<Market1> {
  List<Map<String,dynamic>> veriler=[];
  void _yenile()async{
    final data = await DatabaseHelper.getir1();
    setState(() {
      veriler = data;
    });
  }
  @override
  void initState() {
    super.initState();
    _yenile(); // uygulama açıldığında datayı çeker
  }

  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _fiyatController = TextEditingController();

  void eklemeEkrani(){
    showModalBottomSheet(context: context, 
    elevation: 5,
    isScrollControlled:true,
    builder: (_)=>Container(
      padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _isimController,
            decoration: InputDecoration(hintText: 'ürün ismi'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _fiyatController,
            decoration: InputDecoration(hintText: 'fiyat giriniz'),
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            onPressed:()async{
              ekle();
              Navigator.of(context).pop();
              _isimController.text = '';
              _fiyatController.text = '';
            }, 
            child: Text('ürün ekle'))
        ],
      ),
    
    ));
  }


  void sil(int id)async{
    await DatabaseHelper.silme1(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted!'),
      backgroundColor: Colors.green,
    ));
  }


  Future<void>ekle()async{
    await DatabaseHelper.ekleme1(_isimController.text, _fiyatController.text);
    _yenile();
  }

  @override
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
          body: veriler.isEmpty ?  Column(children: [Center(child: Text('İndirimde ürün bulunamadı'),),
          FloatingActionButton(
            child: Text('ekle'),
            onPressed: () => eklemeEkrani())
          ],)
          
          
          :Container(
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
                      child:  ListTile(
                        title: Text(veriler[index]['urun_ismi']),
                        subtitle: Text(veriler[index]['urun_fiyat']),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    sil(veriler[index]['id']),
                              ),
                            ],
                          ),
                        )),
                      onTap: () => print('basıldı'));
                });
              },
              itemCount: veriler.length,
            ),
                  
              
              
              
              
              )),
   
    );
  }
}


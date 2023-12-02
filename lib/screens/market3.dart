import 'package:flutter/material.dart';
import 'package:my_study_project/models/data.dart';

class Market3 extends StatefulWidget {
 const Market3({Key? key}) : super(key: key);

  @override
  State<Market3> createState() => _Market3State();
}

class _Market3State extends State<Market3> {
  List<Map<String,dynamic>> veriler=[];
  void _yenile()async{
    final data = await DatabaseHelper.getir3();
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

  void eklemeEkrani(int? id){
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
               await ekle();
              
              
              _isimController.text = '';
              _fiyatController.text = '';
              Navigator.of(context).pop();
            }, 
            child: Text('ürün ekle'))
        ],
      )
    
    ));
  }


  void sil(int id)async{
    await DatabaseHelper.silme3(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted!'),
      backgroundColor: Colors.green,
    ));
    _yenile();
  }


  Future<void>ekle()async{
   await DatabaseHelper.ekleme3(_isimController.text, _fiyatController.text);
   _yenile(); // Ekleme işleminden sonra verileri yenilemek için eklendi
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
                'Market3 indirimleri',
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
          body: veriler.isEmpty?Column(children: [Center(child: Text('İndirimde ürün bulunamadı'),),
          FloatingActionButton(
            child: Text('ekle'),
            onPressed: () => eklemeEkrani(null))
          ],)
          
          
          :Container(
              margin: EdgeInsets.only(top:40, left:40, right:40, bottom:80),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(8)),
              child: ListView.builder(


              itemBuilder: (BuildContext context, int index) {
                return Builder(builder: (context) {
                 
                  return GestureDetector(
                      child:  Card(
                        color: index%2==0?Color.fromARGB(255, 249, 205, 205):Color.fromARGB(255, 253, 237, 189),

                        child: ListTile(
                            
                          title: Text(veriler[index]['urun_ismi'], style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text(veriler[index]['urun_fiyat'], style: TextStyle(fontWeight: FontWeight.w700),),
                          trailing: SizedBox(
                            width: 40,
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
                      ),
                      onTap: () => print('basıldı'));
                });
              },
              itemCount: veriler.length,
            ),
                  
              
              
              
              
              ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: ()=> eklemeEkrani(null)),),
   
    );
  }
}


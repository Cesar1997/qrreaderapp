import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){
              print('Click sobre delete forever');
            },
          )
        ],
      ),
      body: _callPage(paginaActual),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _sancQr,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

 Widget _crearBottomNavigationBar() {
   return BottomNavigationBar(
     currentIndex: paginaActual,
      onTap: (index){
        setState(() {
          paginaActual = index;  
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas'),
        ),
        BottomNavigationBarItem(
          icon : Icon(Icons.brightness_5),
          title: Text('Direcciones')
        )
      ],
   );
 }

 Widget _callPage(int paginaActual) {
   switch(paginaActual){
     case 0: return MapasPage();
     case 1: return DireccionesPage();
     default:
      return MapasPage();
   }
 }

  _sancQr() async {
    //http://dev.entersa.cc
    //geo:40.67529934257729,-73.8686121984375
    
    String futureString = '';
    try { 
      futureString = await new QRCodeReader().scan(); 
    } catch (e) {
      futureString = e.toString();
    }
    print('Future String $futureString');

    if(futureString != null){
      print('TENEMOS INFORMACION');
    }
  }
}
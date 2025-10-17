import 'package:film_app/Filmler.dart';
import 'package:flutter/material.dart';

class Detaysayfa extends StatefulWidget {
  Filmler film;
  Detaysayfa({required this.film});

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Filmler"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resmi}"),
            Text(widget.film.film_adi,style: TextStyle(fontSize: 50,color: Colors.deepPurple),),
            Text("${widget.film.film_fiyati} \u{20BA}",style:TextStyle(fontSize: 30,color: Colors.black)),
            TextButton(
              child: Text("Satın Al",style: TextStyle(fontSize: 30,color: Colors.redAccent),),
              onPressed: (){
                print("${widget.film.film_adi} satın alındı");
              },
            ),
          ],
        ),
      )
    );
  }
}

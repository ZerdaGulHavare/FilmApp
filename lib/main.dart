import 'package:film_app/DetaySayfa.dart';
import 'package:film_app/Filmler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Filmler>> filmleriGetir() async{

    var filmListesi = <Filmler>[];
    
    var f1 =Filmler(film_id: 1,film_adi: "Anadoluda", film_resmi: "anadoluda.png", film_fiyati:45.5);
    var f2 =Filmler(film_id: 2,film_adi: "Django", film_resmi: "django.png", film_fiyati:64.7);
    var f3 =Filmler(film_id: 3,film_adi: "İnception", film_resmi: "inception.png", film_fiyati:30.99);
    var f4 =Filmler(film_id: 4,film_adi: "İnterstellar", film_resmi: "interstellar.png", film_fiyati:72.50);
    var f5 =Filmler(film_id: 5,film_adi: "The Hateful Eight", film_resmi: "thehatefuleight.png", film_fiyati:95.25);
    var f6 =Filmler(film_id: 6,film_adi: "The Pianist", film_resmi: "thepianist.png", film_fiyati:75.5);

    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);

    return filmListesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            var filmListesi = snapshot.data!;
            return GridView.builder(
              itemCount: filmListesi.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5,
              ),

              itemBuilder: (context,indeks){
                var film = filmListesi[indeks];
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 200,
                    height: 150,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(film: film,) ));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.asset("resimler/${film.film_resmi}"),
                            Text(film.film_adi,style: TextStyle(color: Colors.black,fontSize: 20),),
                            Text("${film.film_fiyati} \u{20BA} ",style: TextStyle(color: Colors.black,fontSize: 20),),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );


          }else{
            return Center();
          }
        },
      ),

    );
  }
}

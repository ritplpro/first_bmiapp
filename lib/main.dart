import 'package:first_bmiapp/splash_screen.dart';
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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var  feetss=TextEditingController();
  var inche=TextEditingController();
  var  weightt=TextEditingController();
  var result="";
  var bgColor=Colors.red.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffabecd6),Color(0xfffbed96)
              ]
            )
          ),
        ),
        title: Center(
          child: Text('BMI CALCULATER',style: TextStyle(
              color:Colors.black ,
              fontSize: 19,
              fontWeight: FontWeight.w800
          ),
          ),
        ),
          backgroundColor: bgColor,
      ),

      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffabecd6),Color(0xfffbed96)
            ]
          )
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Text('Enter details',style: TextStyle(
                      color:Colors.black ,
                      fontSize: 19,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 40,),
                  TextField(
                    controller:weightt ,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),),

                      label: Text('Enter your weight in kg'),
                      prefixIcon: Icon(Icons.monitor_weight_outlined)


                    ),
                  ),
                  SizedBox(height: 40,),
                  TextField(
                    controller:feetss ,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),),

                        label: Text('Enter your Height in feet'),
                        prefixIcon: Icon(Icons.man)


                    ),
                  ),
                  SizedBox(height: 40,),
                  TextField(
                    controller:inche ,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),),


                        label: Text('Enter your Height inches'),
                        prefixIcon: Icon(Icons.man_outlined)


                    ),
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(


                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      backgroundColor:Colors.black87,
                      fixedSize: Size(300, 50),

                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(12)
                      )

                    ),

                      onPressed: (){
                      var wt=weightt.text.toString();
                      var ft=feetss.text.toString();
                      var inc=inche.text.toString();


                      if(wt!="" && ft!="" && inc!=""){

                        var iwt=int.parse(wt);
                        var ift=int.parse(ft);
                        var inmc=int.parse(inc);


                       var  tinc=(ift*12) + inmc;
                       var  tcm=tinc*2.54;
                       var  tm=tcm/100;
                       var  bmi=iwt/(tm*tm);
                       var msg="";
                       if(bmi>28){
                         msg='You are overweight';
                         bgColor=Colors.red.shade200;

                       }else if(bmi<22){
                         msg='you are under weight';
                         bgColor=Colors.yellow.shade100;

                       }else{
                         msg='You are Healthy';
                         bgColor=Colors.green;

                       }

                        setState(() {
                          result='$msg \n Your BMI is :${bmi.toStringAsFixed(2)}';
                        });


                      } else {

                        setState(() {
                          result='Please Fill All Reqired  Values';
                        });
                      }


                      }, child: Text('CHECK BMI',style: TextStyle(
                    color: Colors.white,
                  ),)),
                  SizedBox(height: 70,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(result,style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

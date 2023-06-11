import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  var weightController = TextEditingController();
  var footController = TextEditingController();
  var inchesController = TextEditingController();
  var result= "";
  var bgColor = Colors.blue.shade50;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI APP"),
      ),
       body: Container(
         color: bgColor,
         child: Center(
           child: Container(
             width: 300,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("BMI",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.blue)),
                 SizedBox(height: 30,),
                 TextField(
                   controller: weightController,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: 'Enter your weight ( in Kgs )',
                     prefixIcon: Icon(Icons.line_weight),
                     prefixIconColor: Colors.blue
                   ),
                 ),
                 SizedBox(height: 15,),
                 TextField(
                   controller: footController,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       labelText: 'Enter your height ( in foots )',
                       prefixIcon: Icon(Icons.height),
                       prefixIconColor: Colors.blue
                   ),
                 ),
                 SizedBox(height: 15,),
                 TextField(
                   controller: inchesController,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       labelText: 'Enter your height ( in inches )',
                       prefixIcon: Icon(Icons.height_sharp),
                       prefixIconColor: Colors.blue
                   ),
                 ),

                 SizedBox(height: 30),
                 ElevatedButton(
                   child: Padding(
                     padding: const EdgeInsets.all(11.0),
                     child: Text("Calculate",style: TextStyle(fontSize: 20),),
                   ),
                   onPressed: (){
                     var wt = weightController.text.toString();
                     var ft = footController.text.toString();
                     var inch = inchesController.text.toString();

                     if(wt=="" || ft =="" || inch==""){
                       result = "Please fill all required blanks !!";
                       setState(() {
                       });
                     }
                     else{
                       //BMI CALCULATION
                       double num_wt = double.parse(wt);
                       double num_ft = double.parse(ft);
                       double num_inch = double.parse(inch);

                       double total_inch = num_ft*12 + num_inch;
                       double total_cm = total_inch*2.54;
                       double total_m = total_cm/100;
                       double bmi = num_wt/(total_m*total_m);



                       var msg ="";
                       if(bmi>25){
                          msg = "You are Overweight!!";
                          bgColor = Colors.orange.shade200;

                       }
                       else if(bmi<18){
                         msg = "You are Underweight!!";
                         bgColor = Colors.red.shade200;
                       }
                       else{
                         msg = "You are Healthy";
                         bgColor = Colors.green.shade200;
                       }

                       setState(() {
                         result = "$msg \n Your BMI : ${bmi.toStringAsFixed(2)}";
                       });
                     }
                   },
                 ),
                 SizedBox(height: 30),
                 //result shown here
                 Text(result,style: TextStyle(fontSize: 20,color: Colors.blue),),
               ],
             ),
           ),
         ),
       ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class prueba extends StatefulWidget {
  const prueba({Key? key}) : super(key: key);

  @override
  State<prueba> createState() => _pruebaState();
}

class _pruebaState extends State<prueba> {
  bool fullSize = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pruebaaaaa'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          color: Colors.amberAccent,
          height: fullSize ? MediaQuery.of(context).size.height: 200,
            width: fullSize ? MediaQuery.of(context).size.width: 200,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                setState((){
                  fullSize=!fullSize;
                });
              },
                child: Text('Vamoh a animar', style: TextStyle(color: Colors.white) ,))),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:listareas/Nueva.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5AC8FA),
          title: Text(
            'Ingreso Usuario',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container( padding: EdgeInsets.only(left: 1, right: 1, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50), topRight: Radius.circular(50))),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Ingrese Usuario",

                      ),

                    ),

                  ),

                  MaterialButton(
                    onPressed: () {  Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext contex) => prueba()

                        )
                    ); },
                    child:  Text ('Crear', style: TextStyle(color: Colors.white, fontSize: 20),),color: Color(0xFF5AC8FA),
                  )
                ],
              )
          ),
        )
    );
  }
}
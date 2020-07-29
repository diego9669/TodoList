import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listareas/Nueva.dart';


class NewTodo extends StatefulWidget {
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController _Titulo = TextEditingController();
  TextEditingController _Descripcion = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AC8FA),
        title: Text(
          'Nueva Tarea',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          key: _form,
          child: Column(
            children: [
              Container(

                child: TextFormField(

                  controller: _Titulo,
                  decoration: InputDecoration(labelText: 'Titulo'),
                  style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'El campo esta vacio';
                    }
                    return null;
                  },

                ),

              ),

              TextFormField(

                controller: _Descripcion,
                decoration: InputDecoration(labelText: 'Descripción'),
                style: TextStyle(
                    color: Colors.black45, fontSize: 15, fontWeight: FontWeight.bold),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo esta vacio';
                  }
                  return null;

                },

              ),
              Padding(
                padding:  EdgeInsets.only(left: 290,right: 16,top: 0,bottom: 8),
                child: IconButton(
                    icon: Icon(Icons.calendar_today,
                      color:  Color(0xFF5AC8FA),
                    ),
                    onPressed: (){
                    }
                ),
              ),

              RaisedButton(

                onPressed: () {
                  Firestore.instance.collection('ToDoList').document().setData({
                    'Titulo': _Titulo.text,
                    'Descripción': _Descripcion.text
                  }).whenComplete(() {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => prueba()));
                    _Titulo.clear();
                    _Descripcion.clear();
                  });


                },
                child: Text ('Crear', style: TextStyle(color: Colors.white, fontSize: 20),),color: Color(0xFF5AC8FA),
              ),


            ],

          ),


        ),

      ),

    );
  }
}

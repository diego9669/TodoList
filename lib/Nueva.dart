import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listareas/formulario/New.dart';

class prueba extends StatefulWidget {
  @override
  _pruebaState createState() => _pruebaState();
}

class _pruebaState extends State<prueba> {
  Future<void> _showDialog({String idNotaDoc, String notausuario}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Borrar Nota'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Desea borrar nota?'),
                Text(notausuario)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                Firestore.instance
                    .collection('ToDoList')
                    .document(idNotaDoc)
                    .delete();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Volver'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AC8FA),
        title: Text(
          'Mis Tareas',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: 800,
        padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('ToDoList').snapshots(),
            builder: (context, datos) {
              if (datos.hasError)
                return Center(
                  child: Text(datos.error.toString()),
                );
              switch (datos.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                default:
                  return Container(
                    child: ListView.builder(
                        itemCount: datos.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot DatoTitulo =
                              datos.data.documents[index];

                          return Container(
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            padding: EdgeInsets.all(0.9),
                            height: 70,
                            decoration: BoxDecoration(
                                color: Color(0xFF5AC8FA),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0, 5),
                                      color: Colors.black12,
                                      blurRadius: 6)
                                ]),
                            //color: Colors.white,
                            child: ListTile(
                              leading: Text(index.toString()),
                              trailing: Container(
                                width: 100,
                                child: Row(

                                  children: [
                                    /*Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: IconButton(
                                          icon: Icon(Icons.edit,
                                          color: Colors.white,
                                          ),
                                          onPressed: (){}
                                          ),
                                    ),*/
                                    Padding(
                                      padding:  EdgeInsets.only(left: 35,right: 16,top: 5,bottom: 8),
                                      child: IconButton(
                                          icon: Icon(Icons.delete,
                                            color: Colors.white,
                                          ),
                                          onPressed: (){
                                            _showDialog(
                                              idNotaDoc: DatoTitulo.documentID,
                                              notausuario:
                                              '${DatoTitulo['Titulo']} ${DatoTitulo['Descripción']}'
                                            );
                                          }
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text(
                                DatoTitulo['Titulo'],
                                style: TextStyle(
                                    color: Colors.white,fontWeight:FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text(
                                DatoTitulo['Descripción'],
                                style: TextStyle(
                                    color: Colors.black38, fontWeight:FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          );
                        }),
                  );
              }
            }),
      ),
      backgroundColor: Color(0xFFEFEFF4),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewTodo(),
          ));
        },
      ),
    );
  }
}

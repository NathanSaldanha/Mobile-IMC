import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String mensagem = "preencha peso e altura";
  TextEditingController pesocontrolador = TextEditingController();
  TextEditingController alturacontrolador = TextEditingController();
  GlobalKey<FormState> formcontrolador = GlobalKey<FormState>();

  void apagar() {
    setState(() {
      pesocontrolador.clear();
      alturacontrolador.clear();
      formcontrolador= GlobalKey<FormState>();
      mensagem = "Informe os dados";
    });
  }

  void calcular() {
    setState(() {
      if (formcontrolador.currentState.validate()) {
        double peso = double.parse(pesocontrolador.text);
        double altura = double.parse(alturacontrolador.text);
        double imc = peso / (altura * altura);

        mensagem = "Seu IMC ${imc.toStringAsPrecision(4)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("IMC"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: apagar)
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              key: formcontrolador,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 120,
                    color: Colors.brown,
                  ),
                  TextFormField(
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return "Campo Obrigatorio";
                      }
                    },
                    controller: pesocontrolador,
                    style: TextStyle(color: Colors.brown, fontSize: 15),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso (KG): ",
                        labelStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                        )),
                  ),
                  TextFormField(
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return "Campo Obrigatorio";
                      }
                    },
                    controller: alturacontrolador,
                    style: TextStyle(color: Colors.brown, fontSize: 15),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura (KG): ",
                        labelStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 35,
                    child: RaisedButton(
                        onPressed: calcular,
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.black),
                  ),
                  Text(
                    mensagem,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            )));
  }
}

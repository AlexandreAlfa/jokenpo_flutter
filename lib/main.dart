import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Jokenpo(),
));


class Jokenpo extends StatefulWidget {
  @override
  _JokenpoState createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {

var _imgEscolha = AssetImage('img/padrao.png');
var _imgOp = AssetImage('img/padrao.png');

var _resultado = '';

_mudaImg(String path){
  setState(() {
    this._imgEscolha = AssetImage(path);
  });
}

String _jogo(String escolha){
  List joken = ['pedra', 'papel', 'tesoura'];
  var rd = Random();
  
  int esc = rd.nextInt(3);

  if(escolha == joken[esc]){
    _resultado = 'Empate';
  }else{
    if(escolha == 'pedra' && joken[esc] == 'tesoura'){
      _resultado = 'You win Miserave.';
    }else if (escolha == 'papel' && joken[esc] == 'pedra'){
      _resultado = 'You win Miseravi';
    }else if (escolha == 'tesoura' && joken[esc] == 'papel'){
      _resultado = 'You win Miseravi';
    }else{
      _resultado = 'Se deu mal Misera!!!';
    }
  }
  return joken[esc];
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JOKENPO'),
      ),
      body: Container(alignment: Alignment.center,
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: 
            Text('Escolha do App:',
            style: TextStyle(
              fontSize: 20
            ),
            )),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              Padding(padding: EdgeInsets.all(10),
              child: Image(image: this._imgEscolha, width: 100,)
            ),
            Padding(padding: EdgeInsets.all(10),
            child: Image(image: this._imgOp, width: 100,)
            ),
            ],),
          Padding(padding: EdgeInsets.all(10),
          child:Text(_resultado,
          style: TextStyle(
            fontSize: 20
          ),)
          ,),
          Padding(
            padding: EdgeInsets.all(10),
            child: 
              Row(children: <Widget>[
                GestureDetector(
                  onTap: (){
                    _mudaImg('img/pedra.png');
                    _jogo('pedra');
                    setState(() {
                      var esc = _jogo('pedra');
                      _imgOp = AssetImage('img/$esc.png');
                    });
                  },
                  child: Image.asset('img/pedra.png',width: 80),
                ),
                GestureDetector(
                  onTap: (){
                    _mudaImg('img/papel.png');
                    _jogo('papel');
                    setState(() {
                      var esc = _jogo('papel');
                      _imgOp = AssetImage('img/$esc.png');
                    });
                  },
                  child: Image.asset('img/papel.png',width: 80),
                ),
                GestureDetector(
                  onTap: (){
                    _mudaImg('img/tesoura.png');
                    _jogo('tesoura');
                    setState(() {
                      var esc = _jogo('tesoura');
                      _imgOp = AssetImage('img/$esc.png');
                    });
                  },
                  child: Image.asset('img/tesoura.png',width: 80),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,)
            )
        ],
        mainAxisAlignment: MainAxisAlignment.start,),
      ),
    );
  }
}
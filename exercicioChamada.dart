//Desenvolva um projeto (tema livre), contendo pelo menos: 1 TextField, 1 ElevatedButton, 1 DropDown, 
//1 RadioButton ou Checkbox Será necessário realizar um preenchimento, ao clicar no botão, execute alguma 
//ação. Sugestões: 1º Um sistema para calcular contas a pagar; 2º Um sistema para uma loja

// Pacote Material
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Pagina(),
    );
  }
}

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<StatefulWidget> createState() {
    return ConteudoPagina();
  }
}

class ConteudoPagina extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Componentes de formulário"),
        ),
        //body: const ElementoStatefulWidget());
        body: const Column(
          children: [
            ElementoStatefulWidget1(),
            ElementoStatefulWidget2(),
            ElementoStatefulWidget3()
          ],
        ));
  }
}

class ElementoStatefulWidget1 extends StatefulWidget {
  const ElementoStatefulWidget1({super.key});

  @override
  State<StatefulWidget> createState() {
    return ElevatedButtonState();
  }
}

class ElementoStatefulWidget2 extends StatefulWidget {
  const ElementoStatefulWidget2({super.key});

  @override
  State<StatefulWidget> createState() {
    return RadioButtonState();
  }
}

class ElementoStatefulWidget3 extends StatefulWidget {
  const ElementoStatefulWidget3({super.key});

  @override
  State<StatefulWidget> createState() {
    return DropdownButtonState();
  }
}

class DropdownButtonState extends State {
  // Lista contendo turnos
  List<String> turnos= ["Selecione um turno", "Matutino", "Vespertino", "Noturno"];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: turnos.map(
        (n) {
          return DropdownMenuItem<String>(value: n, child: Text(n));
        },
      ).toList(),
      onChanged: (turno) {
        print("A opção escolhida é: $turno");
      },
    );
  }
}

class RadioButtonState extends State {
  String? genero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text("Feminino"),
          value: "feminino",
          groupValue: genero,
          onChanged: (valor) {
            setState(() {
              genero = valor;
            });
          },
        ),
        RadioListTile(
          title: const Text("Masculino"),
          value: "masculino",
          groupValue: genero,
          onChanged: (valor) {
            setState(() {
              genero = valor;
            });
          },
        ),
        RadioListTile(
          title: const Text("Prefiro não falar"),
          value: "não definido",
          groupValue: genero,
          onChanged: (valor) {
            setState(() {
              genero = valor;
            });
          },
        )
      ],
    );
  }
}

class ElevatedButtonState extends State {
  String? nome;
  String? texto;
  int? idade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atividade 01"),
      ),
      body: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: SizedBox(
                child: Column(children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Digite seu nome:'),
                    onChanged: (termo) {
                      setState(() {
                        nome = termo;
                      });
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Digite sua idade:'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (valor) {
                      setState(() {
                        idade = int.parse(valor);
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        texto = "Seja bem vindo(a) $nome.";
                      });
                    },
                    child: const Text(
                      "Clique aqui",
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                  Text(texto ?? '', textDirection: TextDirection.ltr),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

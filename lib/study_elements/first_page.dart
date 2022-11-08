import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.pink.shade100,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, //Eixo principal de alinhamento
          crossAxisAlignment:
              CrossAxisAlignment.center, //Eixo cruzado de alinhamento
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.white,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blue,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blue,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.purple,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.blue,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Container(
              height: 30,
              width: 3000,
              color: Colors.white,
              child: const Text(
                'Antônio Claudio',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //print('O botão foi apertado!');
              },
              child: const Text(
                'Aperte o botão!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

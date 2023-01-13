import 'package:flutter/material.dart';
import 'package:principios/data/task_dao.dart';
import 'package:principios/elements/work_card.dart';
import 'package:principios/screens/form_screen.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
        title: const Text(
          'Tarefas',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 70,
        ),
        child: FutureBuilder<List<WorkCard>>(
          future: WorkDao().findAll(),
          builder: (context, snapshot) {
            List<WorkCard>? itens = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando')
                    ],
                  ),
                );

              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando')
                    ],
                  ),
                );

              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando')
                    ],
                  ),
                );

              case ConnectionState.done:
                if (snapshot.hasData && itens != null) {
                  if (itens.isNotEmpty) {
                    return ListView.builder(
                      itemCount: itens.length,
                      itemBuilder: (BuildContext context, int index) {
                        final WorkCard tarefa = itens[index];
                        return tarefa;
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            'Não há nenhuma tarefa!',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return const Text('Erro ao carregar tarefas!');
                }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                workContext: context,
              ),
            ),
          ).then(
            (value) => setState(
              () {},
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

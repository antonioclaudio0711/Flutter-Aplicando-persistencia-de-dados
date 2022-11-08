import 'package:principios/data/database.dart';
import 'package:principios/elements/work_card.dart';
import 'package:sqflite/sqflite.dart';

//CRUD ---> Create (criar), READ (ler), UPDATE (atualizar), DELETE (deletar)
//DAO ---> Data Access Object (Objeto de acesso a dados)
class WorkDao {
  //Criação da tabela de dados (SQL)
  static const String _tableName = 'workTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  List<WorkCard> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<WorkCard> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final WorkCard tarefa = WorkCard(
        text: linha[_name],
        image: linha[_image],
        difficulty: linha[_difficulty],
      );
      tarefas.add(tarefa);
    }

    return tarefas;
  }

  Map<String, dynamic> toMap(WorkCard tarefa) {
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.text;
    mapaDeTarefas[_difficulty] = tarefa.difficulty;
    mapaDeTarefas[_image] = tarefa.image;

    return mapaDeTarefas;
  }

  save(WorkCard tarefa) async {
    final Database bancoDeDados = await getDataBase();
    var itemExists = await find(tarefa.text);
    Map<String, dynamic> workMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      return await bancoDeDados.insert(_tableName, workMap);
    } else {
      return await bancoDeDados.update(
        _tableName,
        workMap,
        where: '$_name = ?',
        whereArgs: [tarefa.text],
      );
    }
  }

  Future<List<WorkCard>> findAll() async {
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tableName);

    return toList(result);
  }

  Future<List<WorkCard>> find(String nomeTarefa) async {
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeTarefa],
    );

    return toList(result);
  }

  delete(String nomeTarefa) async {
    final Database database = await getDataBase();
    return database.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeTarefa],
    );
  }
}

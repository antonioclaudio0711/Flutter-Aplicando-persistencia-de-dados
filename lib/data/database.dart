import 'package:principios/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Criação da função responsável por indicar o caminho em que os dados serão salvos e criar uma base de dados
Future<Database> getDataBase() async {
  final String path = join(
    await getDatabasesPath(),
    'work.db',
  );

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(WorkDao.tableSql);
    },
    version: 1,
  );
}


//                                ##CONSIDERAÇÕES IMPORTANTES:
//Aplicações que necessitam de comunicação para com o meio externo devem apresentar um método declarado como 'Future', este irá 'esperar' informações requeridas do meio externo à aplicação;
//Desta forma, como demonstra-se necessário aguardar por informações externas, o método deve ser classificado como 'async' e os elementos em seu interior que necessitam das informações buscadas são descritos como 'await';

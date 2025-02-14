import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:repomanager/app/repomanager/domain/datasource/database_config.dart';

class SembastConfig extends IDatabaseConfig<Database> {
  Database? _database;

  @override
  Future<void> init() async {
    if (_database != null) return;

    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);

    final dbPath = join(dir.path, 'database.db');
    _database = await databaseFactoryIo.openDatabase(dbPath);
  }

  @override
  Database get getDatabase {
    if (_database == null) {
      throw Exception("O banco de dados não foi inicializado. Chame init() primeiro.");
    }
    return _database!;
  }
}
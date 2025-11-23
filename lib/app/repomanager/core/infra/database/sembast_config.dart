import 'package:path/path.dart';
import 'package:repomanager/app/repomanager/core/interface_adapters/database/database_config.dart';
import 'package:repomanager/app/repomanager/core/domain/failure/database_failure.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';

class SembastConfig extends IDatabaseConfig<Database> {
  Database? _database;

  @override
  Future<void> init() async {
    try {
      if (_database != null) return;

      final dir = await getApplicationDocumentsDirectory();
      await dir.create(recursive: true);

      final dbPath = join(dir.path, 'database.db');
      _database = await databaseFactoryIo.openDatabase(dbPath);
    } catch (e) {
      throw DatabaseFailure(e.toString());
    }
  }

  @override
  Database get getDatabase {
    if (_database == null) {
      throw Exception("O banco de dados não foi inicializado. Chame init() primeiro.");
    }
    return _database!;
  }
}
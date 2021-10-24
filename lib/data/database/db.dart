import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

String dbPath = 'xyi.db';
DatabaseFactory dbFactory = databaseFactoryIo;

Future<Database> openDb() => dbFactory.openDatabase(dbPath);

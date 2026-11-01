import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/case_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
    static Database? _database;

      DatabaseHelper._init();

        Future<Database> get database async {
            if (_database != null) return _database!;
                _database = await _initDB('digital_lawyer.db');
                    return _database!;
                      }

                        Future<Database> _initDB(String filePath) async {
                            final dbPath = await getDatabasesPath();
                                final path = join(dbPath, filePath);

                                    return await openDatabase(
                                          path,
                                                version: 1,
                                                      onCreate: _createDB,
                                                          );
                                                            }

                                                              Future _createDB(Database db, int version) async {
                                                                  await db.execute('''
                                                                        CREATE TABLE cases (
                                                                                id INTEGER PRIMARY KEY AUTOINCREMENT,
                                                                                        caseNumber TEXT NOT NULL,
                                                                                                courtName TEXT NOT NULL,
                                                                                                        clientName TEXT NOT NULL,
                                                                                                                hearingDate TEXT NOT NULL,
                                                                                                                        postponementReason TEXT,
                                                                                                                                notes TEXT
                                                                                                                                      )
                                                                                                                                          ''');
                                                                                                                                            }

                                                                                                                                              Future<int> insertCase(LegalCase legalCase) async {
                                                                                                                                                  final db = await instance.database;
                                                                                                                                                      return await db.insert('cases', legalCase.toMap());
                                                                                                                                                        }

                                                                                                                                                          Future<List<LegalCase>> getCases() async {
                                                                                                                                                              final db = await instance.database;
                                                                                                                                                                  final result = await db.query('cases', orderBy: 'hearingDate ASC');
                                                                                                                                                                      return result.map((json) => LegalCase.fromMap(json)).toList();
                                                                                                                                                                        }

                                                                                                                                                                          Future<int> updatePostponement(int id, String reason) async {
                                                                                                                                                                              final db = await instance.database;
                                                                                                                                                                                  return await db.update(
                                                                                                                                                                                        'cases',
                                                                                                                                                                                              {'postponementReason': reason},
                                                                                                                                                                                                    where: 'id = ?',
                                                                                                                                                                                                          whereArgs: [id],
                                                                                                                                                                                                              );
                                                                                                                                                                                                                }
                                                                                                                                                                                                                }
                                                                                                                                                                                                                
/// Drift database configuration and table definitions for the BlocArch application.
///
/// This file contains the database schema, table definitions, and migration
/// strategy for the local SQLite database using Drift. It defines the structure
/// for tasks and sync records, along with proper indexing for performance.
///
/// ## Tables
/// - **Tasks**: Stores task information with proper relationships
/// - **SyncRecords**: Tracks synchronization status for offline operations
///
/// ## Features
/// - Automatic schema versioning and migrations
/// - Proper indexing for query performance
/// - Nullable fields where appropriate
/// - Timestamp tracking for all records
/// - UUID-based primary keys
///
/// ## Database Schema
/// ### Tasks Table
/// - `id` (Text, Primary Key): Unique task identifier
/// - `title` (Text): Task title/name
/// - `description` (Text, Nullable): Task description
/// - `dueDate` (DateTime, Nullable): Task due date
/// - `priority` (Text, Nullable): Task priority level
/// - `status` (Text): Current task status
/// - `assigneeId` (Text, Nullable): Assigned user ID
/// - `assigneeUsername` (Text, Nullable): Assigned user username
/// - `assigneeEmail` (Text, Nullable): Assigned user email
/// - `createdAt` (DateTime): Creation timestamp
/// - `updatedAt` (DateTime): Last update timestamp
///
/// ### SyncRecords Table
/// - `id` (Text, Primary Key): Unique sync operation identifier
/// - `recordId` (Text): ID of the record being synced
/// - `feature` (Text): Feature name (e.g., 'task')
/// - `operationType` (Text): Operation type (create/update/delete)
/// - `syncStatus` (Text): Current sync status
/// - `createdAt` (DateTime): Creation timestamp
/// - `updatedAt` (DateTime, Nullable): Last update timestamp
/// - `operationParamsJson` (Text, Nullable): JSON parameters for the operation
///
/// ## Usage Examples
/// ```dart
/// // Get database instance
/// final db = getIt<AppDatabase>();
///
/// // Query tasks
/// final tasks = await db.select(db.tasks).get();
///
/// // Insert task
/// await db.into(db.tasks).insert(taskCompanion);
///
/// // Update task
/// await db.update(db.tasks).replace(taskCompanion);
///
/// // Delete task
/// await db.delete(db.tasks).delete(task);
/// ```
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

/// Table definition for storing task information.
///
/// Represents the tasks table with all necessary fields for task management,
/// including relationships to users and proper indexing for performance.
class Tasks extends Table {
  /// Unique identifier for the task.
  TextColumn get id => text()();

  /// Title or name of the task.
  TextColumn get title => text()();

  /// Optional description of the task.
  TextColumn get description => text().nullable()();

  /// Optional due date for the task.
  DateTimeColumn get dueDate => dateTime().nullable()();

  /// Optional priority level of the task.
  TextColumn get priority => text().nullable()();

  /// Current status of the task (e.g., 'todo', 'inProgress', 'done').
  TextColumn get status => text()();

  /// ID of the user assigned to the task.
  TextColumn get assigneeId => text().nullable()();

  /// Username of the assigned user.
  TextColumn get assigneeUsername => text().nullable()();

  /// Email of the assigned user.
  TextColumn get assigneeEmail => text().nullable()();

  /// Timestamp when the task was created.
  DateTimeColumn get createdAt => dateTime()();

  /// Timestamp when the task was last updated.
  DateTimeColumn get updatedAt => dateTime()();

  /// Primary key constraint using the id field.
  @override
  Set<Column> get primaryKey => {id};

  /// Indexes for improved query performance.
  ///
  /// Creates indexes on commonly queried fields:
  /// - `status`: For filtering tasks by status
  /// - `assigneeId`: For filtering tasks by assignee
  /// - `dueDate`: For date-based queries and sorting
  @override
  List<Set<Column>> get indexes => [
        {status},
        {assigneeId},
        {dueDate},
      ];
}

/// Table definition for tracking synchronization operations.
///
/// Stores information about operations that need to be synchronized
/// with the remote server, enabling offline functionality.
class SyncRecords extends Table {
  /// Unique identifier for the sync operation.
  TextColumn get id => text()(); // sync op id (UUID)

  /// ID of the record being synchronized (e.g., task ID).
  TextColumn get recordId => text()(); // task id

  /// Feature name for the operation (e.g., 'task').
  TextColumn get feature => text()(); // e.g., 'task'

  /// Type of operation (create/update/delete).
  TextColumn get operationType => text()(); // create/update/delete

  /// Current synchronization status (needSync, failed, etc.).
  TextColumn get syncStatus => text()(); // needSync, failed, etc.

  /// Timestamp when the sync record was created.
  DateTimeColumn get createdAt => dateTime()();

  /// Timestamp when the sync record was last updated.
  DateTimeColumn get updatedAt => dateTime().nullable()();

  /// JSON string containing operation parameters.
  TextColumn get operationParamsJson => text().nullable()();

  /// Primary key constraint using the id field.
  @override
  Set<Column> get primaryKey => {id};

  /// Indexes for improved query performance.
  ///
  /// Creates indexes on commonly queried fields:
  /// - `recordId`: For finding sync records for specific records
  /// - `syncStatus`: For filtering by sync status
  @override
  List<Set<Column>> get indexes => [
        {recordId},
        {syncStatus}
      ];
}

/// Main database class for the BlocArch application.
///
/// Provides access to all database operations and manages schema
/// migrations. Uses Drift for type-safe database operations.
@DriftDatabase(tables: [Tasks, SyncRecords])
@LazySingleton()
class AppDatabase extends _$AppDatabase {
  /// Creates a new database instance with the specified connection.
  AppDatabase() : super(_openConnection());

  /// Current schema version for migration management.
  @override
  int get schemaVersion => 1;

  /// Migration strategy for handling database schema changes.
  ///
  /// Manages database schema evolution by:
  /// - Creating all tables on initial setup
  /// - Handling future migrations gracefully
  /// - Ensuring SyncRecords table exists
  /// - Adding new columns when needed
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle future migrations here
        // Ensure SyncRecords table exists
        final hasSyncRecords = await customSelect(
                "SELECT name FROM sqlite_master WHERE type='table' AND name='sync_records';")
            .getSingleOrNull();
        if (hasSyncRecords == null) {
          await m.createTable(syncRecords);
        } else {
          // Add operationParamsJson column if it doesn't exist
          final columns =
              await customSelect("PRAGMA table_info(sync_records);").get();
          final hasOperationParamsJson =
              columns.any((row) => row.data['name'] == 'operation_params_json');
          if (!hasOperationParamsJson) {
            await m.addColumn(syncRecords, syncRecords.operationParamsJson);
          }
        }
      },
    );
  }
}

/// Creates and configures the database connection.
///
/// Sets up a lazy database connection that creates the database file
/// in the application documents directory. Uses native SQLite for
/// better performance and compatibility.
///
/// ## Database Location
/// The database file is stored in the application documents directory
/// with the name 'bloc_arch.db'.
///
/// ## Performance Notes
/// - Uses `NativeDatabase.createInBackground()` for non-blocking initialization
/// - Database file is created lazily when first accessed
/// - Supports concurrent access with proper locking
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bloc_arch.db'));
    return NativeDatabase.createInBackground(file);
  });
}

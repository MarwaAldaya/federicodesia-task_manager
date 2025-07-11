// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assigneeIdMeta =
      const VerificationMeta('assigneeId');
  @override
  late final GeneratedColumn<String> assigneeId = GeneratedColumn<String>(
      'assignee_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _assigneeUsernameMeta =
      const VerificationMeta('assigneeUsername');
  @override
  late final GeneratedColumn<String> assigneeUsername = GeneratedColumn<String>(
      'assignee_username', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _assigneeEmailMeta =
      const VerificationMeta('assigneeEmail');
  @override
  late final GeneratedColumn<String> assigneeEmail = GeneratedColumn<String>(
      'assignee_email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        dueDate,
        priority,
        status,
        assigneeId,
        assigneeUsername,
        assigneeEmail,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('assignee_id')) {
      context.handle(
          _assigneeIdMeta,
          assigneeId.isAcceptableOrUnknown(
              data['assignee_id']!, _assigneeIdMeta));
    }
    if (data.containsKey('assignee_username')) {
      context.handle(
          _assigneeUsernameMeta,
          assigneeUsername.isAcceptableOrUnknown(
              data['assignee_username']!, _assigneeUsernameMeta));
    }
    if (data.containsKey('assignee_email')) {
      context.handle(
          _assigneeEmailMeta,
          assigneeEmail.isAcceptableOrUnknown(
              data['assignee_email']!, _assigneeEmailMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      assigneeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assignee_id']),
      assigneeUsername: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}assignee_username']),
      assigneeEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assignee_email']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final String? priority;
  final String status;
  final String? assigneeId;
  final String? assigneeUsername;
  final String? assigneeEmail;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Task(
      {required this.id,
      required this.title,
      this.description,
      this.dueDate,
      this.priority,
      required this.status,
      this.assigneeId,
      this.assigneeUsername,
      this.assigneeEmail,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<String>(priority);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || assigneeId != null) {
      map['assignee_id'] = Variable<String>(assigneeId);
    }
    if (!nullToAbsent || assigneeUsername != null) {
      map['assignee_username'] = Variable<String>(assigneeUsername);
    }
    if (!nullToAbsent || assigneeEmail != null) {
      map['assignee_email'] = Variable<String>(assigneeEmail);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      status: Value(status),
      assigneeId: assigneeId == null && nullToAbsent
          ? const Value.absent()
          : Value(assigneeId),
      assigneeUsername: assigneeUsername == null && nullToAbsent
          ? const Value.absent()
          : Value(assigneeUsername),
      assigneeEmail: assigneeEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(assigneeEmail),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      priority: serializer.fromJson<String?>(json['priority']),
      status: serializer.fromJson<String>(json['status']),
      assigneeId: serializer.fromJson<String?>(json['assigneeId']),
      assigneeUsername: serializer.fromJson<String?>(json['assigneeUsername']),
      assigneeEmail: serializer.fromJson<String?>(json['assigneeEmail']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'priority': serializer.toJson<String?>(priority),
      'status': serializer.toJson<String>(status),
      'assigneeId': serializer.toJson<String?>(assigneeId),
      'assigneeUsername': serializer.toJson<String?>(assigneeUsername),
      'assigneeEmail': serializer.toJson<String?>(assigneeEmail),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Task copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          Value<DateTime?> dueDate = const Value.absent(),
          Value<String?> priority = const Value.absent(),
          String? status,
          Value<String?> assigneeId = const Value.absent(),
          Value<String?> assigneeUsername = const Value.absent(),
          Value<String?> assigneeEmail = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        priority: priority.present ? priority.value : this.priority,
        status: status ?? this.status,
        assigneeId: assigneeId.present ? assigneeId.value : this.assigneeId,
        assigneeUsername: assigneeUsername.present
            ? assigneeUsername.value
            : this.assigneeUsername,
        assigneeEmail:
            assigneeEmail.present ? assigneeEmail.value : this.assigneeEmail,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      priority: data.priority.present ? data.priority.value : this.priority,
      status: data.status.present ? data.status.value : this.status,
      assigneeId:
          data.assigneeId.present ? data.assigneeId.value : this.assigneeId,
      assigneeUsername: data.assigneeUsername.present
          ? data.assigneeUsername.value
          : this.assigneeUsername,
      assigneeEmail: data.assigneeEmail.present
          ? data.assigneeEmail.value
          : this.assigneeEmail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dueDate: $dueDate, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('assigneeId: $assigneeId, ')
          ..write('assigneeUsername: $assigneeUsername, ')
          ..write('assigneeEmail: $assigneeEmail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      description,
      dueDate,
      priority,
      status,
      assigneeId,
      assigneeUsername,
      assigneeEmail,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.dueDate == this.dueDate &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.assigneeId == this.assigneeId &&
          other.assigneeUsername == this.assigneeUsername &&
          other.assigneeEmail == this.assigneeEmail &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime?> dueDate;
  final Value<String?> priority;
  final Value<String> status;
  final Value<String?> assigneeId;
  final Value<String?> assigneeUsername;
  final Value<String?> assigneeEmail;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.assigneeId = const Value.absent(),
    this.assigneeUsername = const Value.absent(),
    this.assigneeEmail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.priority = const Value.absent(),
    required String status,
    this.assigneeId = const Value.absent(),
    this.assigneeUsername = const Value.absent(),
    this.assigneeEmail = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? dueDate,
    Expression<String>? priority,
    Expression<String>? status,
    Expression<String>? assigneeId,
    Expression<String>? assigneeUsername,
    Expression<String>? assigneeEmail,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (dueDate != null) 'due_date': dueDate,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (assigneeId != null) 'assignee_id': assigneeId,
      if (assigneeUsername != null) 'assignee_username': assigneeUsername,
      if (assigneeEmail != null) 'assignee_email': assigneeEmail,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<DateTime?>? dueDate,
      Value<String?>? priority,
      Value<String>? status,
      Value<String?>? assigneeId,
      Value<String?>? assigneeUsername,
      Value<String?>? assigneeEmail,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      assigneeId: assigneeId ?? this.assigneeId,
      assigneeUsername: assigneeUsername ?? this.assigneeUsername,
      assigneeEmail: assigneeEmail ?? this.assigneeEmail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (assigneeId.present) {
      map['assignee_id'] = Variable<String>(assigneeId.value);
    }
    if (assigneeUsername.present) {
      map['assignee_username'] = Variable<String>(assigneeUsername.value);
    }
    if (assigneeEmail.present) {
      map['assignee_email'] = Variable<String>(assigneeEmail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dueDate: $dueDate, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('assigneeId: $assigneeId, ')
          ..write('assigneeUsername: $assigneeUsername, ')
          ..write('assigneeEmail: $assigneeEmail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncRecordsTable extends SyncRecords
    with TableInfo<$SyncRecordsTable, SyncRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordIdMeta =
      const VerificationMeta('recordId');
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
      'record_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _featureMeta =
      const VerificationMeta('feature');
  @override
  late final GeneratedColumn<String> feature = GeneratedColumn<String>(
      'feature', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  @override
  late final GeneratedColumn<String> operationType = GeneratedColumn<String>(
      'operation_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _operationParamsJsonMeta =
      const VerificationMeta('operationParamsJson');
  @override
  late final GeneratedColumn<String> operationParamsJson =
      GeneratedColumn<String>('operation_params_json', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        recordId,
        feature,
        operationType,
        syncStatus,
        createdAt,
        updatedAt,
        operationParamsJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_records';
  @override
  VerificationContext validateIntegrity(Insertable<SyncRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(_recordIdMeta,
          recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta));
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('feature')) {
      context.handle(_featureMeta,
          feature.isAcceptableOrUnknown(data['feature']!, _featureMeta));
    } else if (isInserting) {
      context.missing(_featureMeta);
    }
    if (data.containsKey('operation_type')) {
      context.handle(
          _operationTypeMeta,
          operationType.isAcceptableOrUnknown(
              data['operation_type']!, _operationTypeMeta));
    } else if (isInserting) {
      context.missing(_operationTypeMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    } else if (isInserting) {
      context.missing(_syncStatusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('operation_params_json')) {
      context.handle(
          _operationParamsJsonMeta,
          operationParamsJson.isAcceptableOrUnknown(
              data['operation_params_json']!, _operationParamsJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_id'])!,
      feature: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}feature'])!,
      operationType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation_type'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      operationParamsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}operation_params_json']),
    );
  }

  @override
  $SyncRecordsTable createAlias(String alias) {
    return $SyncRecordsTable(attachedDatabase, alias);
  }
}

class SyncRecord extends DataClass implements Insertable<SyncRecord> {
  final String id;
  final String recordId;
  final String feature;
  final String operationType;
  final String syncStatus;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? operationParamsJson;
  const SyncRecord(
      {required this.id,
      required this.recordId,
      required this.feature,
      required this.operationType,
      required this.syncStatus,
      required this.createdAt,
      this.updatedAt,
      this.operationParamsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['record_id'] = Variable<String>(recordId);
    map['feature'] = Variable<String>(feature);
    map['operation_type'] = Variable<String>(operationType);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || operationParamsJson != null) {
      map['operation_params_json'] = Variable<String>(operationParamsJson);
    }
    return map;
  }

  SyncRecordsCompanion toCompanion(bool nullToAbsent) {
    return SyncRecordsCompanion(
      id: Value(id),
      recordId: Value(recordId),
      feature: Value(feature),
      operationType: Value(operationType),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      operationParamsJson: operationParamsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(operationParamsJson),
    );
  }

  factory SyncRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncRecord(
      id: serializer.fromJson<String>(json['id']),
      recordId: serializer.fromJson<String>(json['recordId']),
      feature: serializer.fromJson<String>(json['feature']),
      operationType: serializer.fromJson<String>(json['operationType']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      operationParamsJson:
          serializer.fromJson<String?>(json['operationParamsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recordId': serializer.toJson<String>(recordId),
      'feature': serializer.toJson<String>(feature),
      'operationType': serializer.toJson<String>(operationType),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'operationParamsJson': serializer.toJson<String?>(operationParamsJson),
    };
  }

  SyncRecord copyWith(
          {String? id,
          String? recordId,
          String? feature,
          String? operationType,
          String? syncStatus,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<String?> operationParamsJson = const Value.absent()}) =>
      SyncRecord(
        id: id ?? this.id,
        recordId: recordId ?? this.recordId,
        feature: feature ?? this.feature,
        operationType: operationType ?? this.operationType,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        operationParamsJson: operationParamsJson.present
            ? operationParamsJson.value
            : this.operationParamsJson,
      );
  SyncRecord copyWithCompanion(SyncRecordsCompanion data) {
    return SyncRecord(
      id: data.id.present ? data.id.value : this.id,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      feature: data.feature.present ? data.feature.value : this.feature,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      operationParamsJson: data.operationParamsJson.present
          ? data.operationParamsJson.value
          : this.operationParamsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncRecord(')
          ..write('id: $id, ')
          ..write('recordId: $recordId, ')
          ..write('feature: $feature, ')
          ..write('operationType: $operationType, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('operationParamsJson: $operationParamsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recordId, feature, operationType,
      syncStatus, createdAt, updatedAt, operationParamsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncRecord &&
          other.id == this.id &&
          other.recordId == this.recordId &&
          other.feature == this.feature &&
          other.operationType == this.operationType &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.operationParamsJson == this.operationParamsJson);
}

class SyncRecordsCompanion extends UpdateCompanion<SyncRecord> {
  final Value<String> id;
  final Value<String> recordId;
  final Value<String> feature;
  final Value<String> operationType;
  final Value<String> syncStatus;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String?> operationParamsJson;
  final Value<int> rowid;
  const SyncRecordsCompanion({
    this.id = const Value.absent(),
    this.recordId = const Value.absent(),
    this.feature = const Value.absent(),
    this.operationType = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.operationParamsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncRecordsCompanion.insert({
    required String id,
    required String recordId,
    required String feature,
    required String operationType,
    required String syncStatus,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.operationParamsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        recordId = Value(recordId),
        feature = Value(feature),
        operationType = Value(operationType),
        syncStatus = Value(syncStatus),
        createdAt = Value(createdAt);
  static Insertable<SyncRecord> custom({
    Expression<String>? id,
    Expression<String>? recordId,
    Expression<String>? feature,
    Expression<String>? operationType,
    Expression<String>? syncStatus,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? operationParamsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recordId != null) 'record_id': recordId,
      if (feature != null) 'feature': feature,
      if (operationType != null) 'operation_type': operationType,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (operationParamsJson != null)
        'operation_params_json': operationParamsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? recordId,
      Value<String>? feature,
      Value<String>? operationType,
      Value<String>? syncStatus,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String?>? operationParamsJson,
      Value<int>? rowid}) {
    return SyncRecordsCompanion(
      id: id ?? this.id,
      recordId: recordId ?? this.recordId,
      feature: feature ?? this.feature,
      operationType: operationType ?? this.operationType,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      operationParamsJson: operationParamsJson ?? this.operationParamsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (feature.present) {
      map['feature'] = Variable<String>(feature.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<String>(operationType.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (operationParamsJson.present) {
      map['operation_params_json'] =
          Variable<String>(operationParamsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncRecordsCompanion(')
          ..write('id: $id, ')
          ..write('recordId: $recordId, ')
          ..write('feature: $feature, ')
          ..write('operationType: $operationType, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('operationParamsJson: $operationParamsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $SyncRecordsTable syncRecords = $SyncRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks, syncRecords];
}

typedef $$TasksTableCreateCompanionBuilder = TasksCompanion Function({
  required String id,
  required String title,
  Value<String?> description,
  Value<DateTime?> dueDate,
  Value<String?> priority,
  required String status,
  Value<String?> assigneeId,
  Value<String?> assigneeUsername,
  Value<String?> assigneeEmail,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$TasksTableUpdateCompanionBuilder = TasksCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<DateTime?> dueDate,
  Value<String?> priority,
  Value<String> status,
  Value<String?> assigneeId,
  Value<String?> assigneeUsername,
  Value<String?> assigneeEmail,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assigneeId => $composableBuilder(
      column: $table.assigneeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assigneeUsername => $composableBuilder(
      column: $table.assigneeUsername,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assigneeEmail => $composableBuilder(
      column: $table.assigneeEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assigneeId => $composableBuilder(
      column: $table.assigneeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assigneeUsername => $composableBuilder(
      column: $table.assigneeUsername,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assigneeEmail => $composableBuilder(
      column: $table.assigneeEmail,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get assigneeId => $composableBuilder(
      column: $table.assigneeId, builder: (column) => column);

  GeneratedColumn<String> get assigneeUsername => $composableBuilder(
      column: $table.assigneeUsername, builder: (column) => column);

  GeneratedColumn<String> get assigneeEmail => $composableBuilder(
      column: $table.assigneeEmail, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TasksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
    Task,
    PrefetchHooks Function()> {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<String?> priority = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> assigneeId = const Value.absent(),
            Value<String?> assigneeUsername = const Value.absent(),
            Value<String?> assigneeEmail = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksCompanion(
            id: id,
            title: title,
            description: description,
            dueDate: dueDate,
            priority: priority,
            status: status,
            assigneeId: assigneeId,
            assigneeUsername: assigneeUsername,
            assigneeEmail: assigneeEmail,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<String?> priority = const Value.absent(),
            required String status,
            Value<String?> assigneeId = const Value.absent(),
            Value<String?> assigneeUsername = const Value.absent(),
            Value<String?> assigneeEmail = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksCompanion.insert(
            id: id,
            title: title,
            description: description,
            dueDate: dueDate,
            priority: priority,
            status: status,
            assigneeId: assigneeId,
            assigneeUsername: assigneeUsername,
            assigneeEmail: assigneeEmail,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TasksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
    Task,
    PrefetchHooks Function()>;
typedef $$SyncRecordsTableCreateCompanionBuilder = SyncRecordsCompanion
    Function({
  required String id,
  required String recordId,
  required String feature,
  required String operationType,
  required String syncStatus,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> operationParamsJson,
  Value<int> rowid,
});
typedef $$SyncRecordsTableUpdateCompanionBuilder = SyncRecordsCompanion
    Function({
  Value<String> id,
  Value<String> recordId,
  Value<String> feature,
  Value<String> operationType,
  Value<String> syncStatus,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> operationParamsJson,
  Value<int> rowid,
});

class $$SyncRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncRecordsTable> {
  $$SyncRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recordId => $composableBuilder(
      column: $table.recordId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get feature => $composableBuilder(
      column: $table.feature, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operationType => $composableBuilder(
      column: $table.operationType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operationParamsJson => $composableBuilder(
      column: $table.operationParamsJson,
      builder: (column) => ColumnFilters(column));
}

class $$SyncRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncRecordsTable> {
  $$SyncRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recordId => $composableBuilder(
      column: $table.recordId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get feature => $composableBuilder(
      column: $table.feature, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operationType => $composableBuilder(
      column: $table.operationType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operationParamsJson => $composableBuilder(
      column: $table.operationParamsJson,
      builder: (column) => ColumnOrderings(column));
}

class $$SyncRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncRecordsTable> {
  $$SyncRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get recordId =>
      $composableBuilder(column: $table.recordId, builder: (column) => column);

  GeneratedColumn<String> get feature =>
      $composableBuilder(column: $table.feature, builder: (column) => column);

  GeneratedColumn<String> get operationType => $composableBuilder(
      column: $table.operationType, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get operationParamsJson => $composableBuilder(
      column: $table.operationParamsJson, builder: (column) => column);
}

class $$SyncRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncRecordsTable,
    SyncRecord,
    $$SyncRecordsTableFilterComposer,
    $$SyncRecordsTableOrderingComposer,
    $$SyncRecordsTableAnnotationComposer,
    $$SyncRecordsTableCreateCompanionBuilder,
    $$SyncRecordsTableUpdateCompanionBuilder,
    (SyncRecord, BaseReferences<_$AppDatabase, $SyncRecordsTable, SyncRecord>),
    SyncRecord,
    PrefetchHooks Function()> {
  $$SyncRecordsTableTableManager(_$AppDatabase db, $SyncRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> recordId = const Value.absent(),
            Value<String> feature = const Value.absent(),
            Value<String> operationType = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> operationParamsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncRecordsCompanion(
            id: id,
            recordId: recordId,
            feature: feature,
            operationType: operationType,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            operationParamsJson: operationParamsJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String recordId,
            required String feature,
            required String operationType,
            required String syncStatus,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> operationParamsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncRecordsCompanion.insert(
            id: id,
            recordId: recordId,
            feature: feature,
            operationType: operationType,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            operationParamsJson: operationParamsJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncRecordsTable,
    SyncRecord,
    $$SyncRecordsTableFilterComposer,
    $$SyncRecordsTableOrderingComposer,
    $$SyncRecordsTableAnnotationComposer,
    $$SyncRecordsTableCreateCompanionBuilder,
    $$SyncRecordsTableUpdateCompanionBuilder,
    (SyncRecord, BaseReferences<_$AppDatabase, $SyncRecordsTable, SyncRecord>),
    SyncRecord,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$SyncRecordsTableTableManager get syncRecords =>
      $$SyncRecordsTableTableManager(_db, _db.syncRecords);
}

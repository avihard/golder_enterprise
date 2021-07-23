// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String name;
  final String contactNumber;
  final String villageName;
  final String districtName;
  final String identityProof;
  final String signature;
  Task(
      {required this.id,
      required this.name,
      required this.contactNumber,
      required this.villageName,
      required this.districtName,
      required this.identityProof,
      required this.signature});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Task(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      contactNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}contact_number'])!,
      villageName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}village_name'])!,
      districtName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}district_name'])!,
      identityProof: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}identity_proof'])!,
      signature: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}signature'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['contact_number'] = Variable<String>(contactNumber);
    map['village_name'] = Variable<String>(villageName);
    map['district_name'] = Variable<String>(districtName);
    map['identity_proof'] = Variable<String>(identityProof);
    map['signature'] = Variable<String>(signature);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      name: Value(name),
      contactNumber: Value(contactNumber),
      villageName: Value(villageName),
      districtName: Value(districtName),
      identityProof: Value(identityProof),
      signature: Value(signature),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      contactNumber: serializer.fromJson<String>(json['contactNumber']),
      villageName: serializer.fromJson<String>(json['villageName']),
      districtName: serializer.fromJson<String>(json['districtName']),
      identityProof: serializer.fromJson<String>(json['identityProof']),
      signature: serializer.fromJson<String>(json['signature']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'contactNumber': serializer.toJson<String>(contactNumber),
      'villageName': serializer.toJson<String>(villageName),
      'districtName': serializer.toJson<String>(districtName),
      'identityProof': serializer.toJson<String>(identityProof),
      'signature': serializer.toJson<String>(signature),
    };
  }

  Task copyWith(
          {int? id,
          String? name,
          String? contactNumber,
          String? villageName,
          String? districtName,
          String? identityProof,
          String? signature}) =>
      Task(
        id: id ?? this.id,
        name: name ?? this.name,
        contactNumber: contactNumber ?? this.contactNumber,
        villageName: villageName ?? this.villageName,
        districtName: districtName ?? this.districtName,
        identityProof: identityProof ?? this.identityProof,
        signature: signature ?? this.signature,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('villageName: $villageName, ')
          ..write('districtName: $districtName, ')
          ..write('identityProof: $identityProof, ')
          ..write('signature: $signature')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              contactNumber.hashCode,
              $mrjc(
                  villageName.hashCode,
                  $mrjc(districtName.hashCode,
                      $mrjc(identityProof.hashCode, signature.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.name == this.name &&
          other.contactNumber == this.contactNumber &&
          other.villageName == this.villageName &&
          other.districtName == this.districtName &&
          other.identityProof == this.identityProof &&
          other.signature == this.signature);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> contactNumber;
  final Value<String> villageName;
  final Value<String> districtName;
  final Value<String> identityProof;
  final Value<String> signature;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.villageName = const Value.absent(),
    this.districtName = const Value.absent(),
    this.identityProof = const Value.absent(),
    this.signature = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String contactNumber,
    required String villageName,
    required String districtName,
    required String identityProof,
    required String signature,
  })  : name = Value(name),
        contactNumber = Value(contactNumber),
        villageName = Value(villageName),
        districtName = Value(districtName),
        identityProof = Value(identityProof),
        signature = Value(signature);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? contactNumber,
    Expression<String>? villageName,
    Expression<String>? districtName,
    Expression<String>? identityProof,
    Expression<String>? signature,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (villageName != null) 'village_name': villageName,
      if (districtName != null) 'district_name': districtName,
      if (identityProof != null) 'identity_proof': identityProof,
      if (signature != null) 'signature': signature,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? contactNumber,
      Value<String>? villageName,
      Value<String>? districtName,
      Value<String>? identityProof,
      Value<String>? signature}) {
    return TasksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      villageName: villageName ?? this.villageName,
      districtName: districtName ?? this.districtName,
      identityProof: identityProof ?? this.identityProof,
      signature: signature ?? this.signature,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(contactNumber.value);
    }
    if (villageName.present) {
      map['village_name'] = Variable<String>(villageName.value);
    }
    if (districtName.present) {
      map['district_name'] = Variable<String>(districtName.value);
    }
    if (identityProof.present) {
      map['identity_proof'] = Variable<String>(identityProof.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('villageName: $villageName, ')
          ..write('districtName: $districtName, ')
          ..write('identityProof: $identityProof, ')
          ..write('signature: $signature')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _contactNumberMeta =
      const VerificationMeta('contactNumber');
  late final GeneratedColumn<String?> contactNumber = GeneratedColumn<String?>(
      'contact_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _villageNameMeta =
      const VerificationMeta('villageName');
  late final GeneratedColumn<String?> villageName = GeneratedColumn<String?>(
      'village_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _districtNameMeta =
      const VerificationMeta('districtName');
  late final GeneratedColumn<String?> districtName = GeneratedColumn<String?>(
      'district_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _identityProofMeta =
      const VerificationMeta('identityProof');
  late final GeneratedColumn<String?> identityProof = GeneratedColumn<String?>(
      'identity_proof', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _signatureMeta = const VerificationMeta('signature');
  late final GeneratedColumn<String?> signature = GeneratedColumn<String?>(
      'signature', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        contactNumber,
        villageName,
        districtName,
        identityProof,
        signature
      ];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('contact_number')) {
      context.handle(
          _contactNumberMeta,
          contactNumber.isAcceptableOrUnknown(
              data['contact_number']!, _contactNumberMeta));
    } else if (isInserting) {
      context.missing(_contactNumberMeta);
    }
    if (data.containsKey('village_name')) {
      context.handle(
          _villageNameMeta,
          villageName.isAcceptableOrUnknown(
              data['village_name']!, _villageNameMeta));
    } else if (isInserting) {
      context.missing(_villageNameMeta);
    }
    if (data.containsKey('district_name')) {
      context.handle(
          _districtNameMeta,
          districtName.isAcceptableOrUnknown(
              data['district_name']!, _districtNameMeta));
    } else if (isInserting) {
      context.missing(_districtNameMeta);
    }
    if (data.containsKey('identity_proof')) {
      context.handle(
          _identityProofMeta,
          identityProof.isAcceptableOrUnknown(
              data['identity_proof']!, _identityProofMeta));
    } else if (isInserting) {
      context.missing(_identityProofMeta);
    }
    if (data.containsKey('signature')) {
      context.handle(_signatureMeta,
          signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta));
    } else if (isInserting) {
      context.missing(_signatureMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Task.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}

import 'package:mongo_dart/mongo_dart.dart';
import 'package:dart_test_application/test_domain.dart' as td;
import 'package:dart_test_application/test_credentials.dart' as ac;

// This example shows how *not* to write asynchronous Dart code.

var user = ac.AppCredentials().toJson()["user"];
var password = ac.AppCredentials().toJson()["password"];

void asyncMain() {

  //print(createOrderMessageB());
  //funcTwo();
  //funcMongo_findCollection();
  //funcMongo_findDocumentByID(); 
  //funcMongo_insertDocument();
  funcMongo_updateDocumentByID();
  //funcMongo_deleteDocumentByID();
  //funcAsync1();
  //funcAsync2();
  //funcAsync3();
  //funcAsync4();   
}

// Mongo

funcMongo_deleteDocumentByID() async{

  await deleteDocumentByID('632ecf0df0d6670739cc24ba');
  
  return await null;
}

Future<void>  deleteDocumentByID(String id) async {
    Map<String, dynamic> result;
    ObjectId objId = ObjectId.parse(id);
    
    final db = await Db.create('mongodb+srv://$user:$password@cluster0.ybonlek.mongodb.net/home?retryWrites=true&w=majority');
    await db.open();

    final response = db.collection('contacts').deleteOne({'_id': objId});

    //result = await response.
    await db.close();
    //return await response;
}

funcMongo_updateDocumentByID() async{

  // Contact({
  //   this.id,
  //   this.fname,
  //   this.lname,
  //   this.cpse,
  //   this.active,
  //   required this.numbers,
  // });

  List<td.Number> numbers=[
    td.Number(id:'0',number:'6668882232332', type: '1omx' ),
    td.Number(id:'1',number:'77799938u2938', type: '1omx' ),
  ];
  
  td.Contact contact = td.Contact(
    fname: 'fnameAAA',
    lname: 'lnameAAA', 
    active: 'Y', 
    cpse: 'Company Tz', 
    numbers: numbers,
    address: td.Address(no:'101 3/1',street: 'Kirula Road', city: 'Colombo 5'),
  );
  
  await updateDocumentByID('632f34bc9dd20c022f54c787', contact);
  
  return await contact;
}

Future<void>  updateDocumentByID(String id, td.Contact contact) async {
    Map<String, dynamic> result;
    ObjectId objId = ObjectId.parse(id);
    
    final db = await Db.create('mongodb+srv://$user:$password@cluster0.ybonlek.mongodb.net/home?retryWrites=true&w=majority');
    await db.open();

    final response = db.collection('contacts').update({'_id': objId}, contact.toJson());

    //result = await response.
    await db.close();
    //return await response;
}

funcMongo_insertDocument() async{

  List<td.Number> numbers=[
    td.Number(id:'0',number:'7778882232332', type: '1omx' ),
    td.Number(id:'1',number:'77799938u2938', type: '1omx' ),
  ];
  
  td.Contact contact = td.Contact(
    fname: 'fnameKK',
    lname: 'lnameKK', 
    active: 'Y', 
    cpse: 'Service Saloon', 
    numbers: numbers,
    address: td.Address(no:'101 1/1',street: 'Kirula Rd', city: 'Colombo 5'),
  );
  
  await insertDocument(contact);
  
  return await contact;
}

Future<void>  insertDocument(td.Contact contact) async {
    Map<String, dynamic> result;
    
    final db = await Db.create('mongodb+srv://$user:$password@cluster0.ybonlek.mongodb.net/home?retryWrites=true&w=majority');
    await db.open();
    final response = db.collection('contacts').insertOne(contact.toJson());

    await db.close();
}

funcMongo_findDocumentByID() async{
  td.Contact contact;
  Map<String, dynamic> result = await findOneContact("631977da9b7d7339f05f8f06");
  
  contact = await td.Contact.fromJson(result);  
  
  return await contact;
}

Future< Map<String, dynamic> >  findOneContact(String id) async {
    Map<String, dynamic> contact;
    ObjectId objId = ObjectId.parse(id);
    
    final db = await Db.create('mongodb+srv://$user:$password@cluster0.ybonlek.mongodb.net/home?retryWrites=true&w=majority');
    await db.open();
    final response = db.collection('contacts').find( {'_id': objId} );

    contact = await response.first;
    await db.close();

    return await contact;
}

funcMongo_findCollection() async{
  List<td.Contact> contacts = [];
  List<Map<String, dynamic>> result = await findCollection();
  
  result.forEach((element) {
    td.Contact contact = td.Contact.fromJson(element); 
    contacts.add(contact);  
  });
  
  return await contacts;
}

// Get all contacts
Future< List<Map<String, dynamic>> > findCollection() async {
    List<Map<String, dynamic>> cts = [];
    
    final db = await Db.create('mongodb+srv://$user:$password@cluster0.ybonlek.mongodb.net/home?retryWrites=true&w=majority');
    await db.open();
    final response = db.collection('contacts').find();

    await response.forEach((element) { cts.add(element); });
    await db.close();

    return await cts;
}

// Async 4

Future<void> printOrderMessageA() async {
  try {
    print('Awaiting user order...');
    var order = await fetchUserOrderA();
    print(order);
  } catch (err) {
    print('Caught error: $err');
  }
}

Future<String> fetchUserOrderA() {
  // Imagine that this function is more complex.
  var str = Future.delayed(
      const Duration(seconds: 4),
      () => throw 'Cannot locate user order');
  return str;
}

void funcAsync4() async {
  await printOrderMessageA();
}

// https://dart.dev/codelabs/async-await

// Future<String> reportUserRole() async {
//   var username = await fetchRole();
//   return 'User role: $username';
// }

// Future<String> reportLogins() async {
//   var logins = await fetchLoginAmount();
//   return 'Total number of logins: $logins';
// }

// Async 3
Future<void> printOrderMessage() async {
  print('Awaiting user order...');
  var order = await fetchUserOrder2();
  print('Your order is: $order');
}

Future<String> fetchUserOrder2() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(const Duration(seconds: 4), () => 'Large Latte');
}

void funcAsync3() async {
  countSeconds(4);
  await printOrderMessage();
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}

// Async 2
Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is
    // more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

Future<void> funcAsync2() async {
  print('Fetching user order...');
  //print( createOrderMessage());
  print( await createOrderMessage());
}

// Async 1.
funcAsync1(){
  print(createOrderMessage());
}

//

String createOrderMessageB() {
  var order = fetchUserOrderB();
  return 'Your order is: $order';
}

Future<String> fetchUserOrderB() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

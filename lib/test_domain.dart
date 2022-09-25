
/*

{
  "fname": "fnameA",
  "lname": "lnameA",
  "cpse": "",
  "active": "Y",        
  "numbers": [
    {"id" : "0", "number" : "1198218212", "type" : "1omx" }, 
    {"id" : "1", "number" : "1172875475", "type" : "0omx" },        
    {"id" : "2", "number" : "1159454985", "type" : "0omx" }
  ]
}

*/

class Contact {
  String? id;
  String? fname;  
  String? lname;  
  String? cpse;  
  String? active;
  List<Number> numbers=[];
  Address? address;
  
  Contact({
    this.id,
    this.fname,
    this.lname,
    this.cpse,
    this.active,
    required this.numbers,
    this.address,
  });

  factory Contact.fromJson(Map<String, dynamic> jsonMap) {
    
    Map<String, dynamic> addressMap = jsonMap['address'];
    List numbersIn = jsonMap['numbers'];
    List<Number> numbersOut=[];

    numbersIn.forEach((element) {
      Number number = Number.fromJson(element);
      numbersOut.add(number);   
    });

    return Contact(
      id: jsonMap['_id'].$oid,
      fname: jsonMap['fname'],
      lname: jsonMap['lname'],
      cpse: jsonMap['cpse'],
      active: jsonMap['active'],
      numbers: numbersOut,
      address: Address(
        no: addressMap['no'],
        street: addressMap['street'],
        city: addressMap['city'],
      )
    );
  }

  // Map<String, dynamic> toJson() => {
  //   'fname': fname,
  //   'lname': lname,
  //   'cpse': cpse,
  //   'active': active,
  // };

  Map<String, dynamic> toJson() => getContsctJson();

  Map<String, dynamic> getContsctJson(){

    List<Map<String, dynamic>> numbersJSON=[];

    numbers.forEach((element) {  
      final Map<String, dynamic> oneNumber = {
        "id": element.id,
        "number": element.number,
        "type": element.type,
      };
      numbersJSON.add(oneNumber);
    });

    Map<String, dynamic> addressMap = {
      'no' : address?.no,
      'street': address?.street,
      'city': address?.city
    }; 

    return {
      'fname': fname,
      'lname': lname,
      'cpse': cpse,
      'active': active,
      'numbers': numbersJSON,
      'addres': addressMap      
    };  
  }


}

class Number {
  String? id;  
  String? number;  
  String? type;  

  Number({
    this.id,
    this.number,
    this.type,
  });      

 factory Number.fromJson(Map<String, dynamic> jsonMap) {
    return Number(
      id: jsonMap['id'],
      number: jsonMap['number'],
      type: jsonMap['type'],
    );
  }      
}

class Address {
  String? no;  
  String? street;  
  String? city;  

  Address({
    this.no,
    this.street,
    this.city,
  });      

 factory Address.fromJson(Map<String, dynamic> jsonMap) {
    return Address(
      no: jsonMap['no'],
      city: jsonMap['city'],
      street: jsonMap['street'],
    );
  }      
}


// Object class with fromJson()
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> jsonMap) {
    return Album(
      userId: jsonMap['userId'],
      id: jsonMap['id'],
      title: jsonMap['title'],
    );
  }
}

// Object class with fromJson() and toJson() to deserialize and serialize
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> jsonMap)
      : name = jsonMap['name'],
        email = jsonMap['email'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
  };
}
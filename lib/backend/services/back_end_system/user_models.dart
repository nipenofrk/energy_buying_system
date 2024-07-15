

class User{
  int? id;
  String? token;
  String? username;
  String? email,first_name, last_name;

  //constructor for serving the data
  User({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.username,
  });
  
  //{"pk":7,"username":"test1","email":"test1@gmail.com","first_name":"","last_name":""}

  factory User.fromJson(json){
  return User(
   id:json["pk"],
   email:json["email"],
   first_name:json["first_name"],
   last_name:json["last_name"],
   username:json["username"],
  );
}
}

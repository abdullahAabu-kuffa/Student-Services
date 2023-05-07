//تقريبا هكنسل الفايل ده و مش هنستخدمه في حاجه 
class UserFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String gpa = 'gpa';
  

  static List<String> getFields() => [id, name, gpa];
}
class User {
  final String id;
  final String? name;
  final String? gpa;
  final String? email;
  
  const User({
    required this.id,
     this.name,
     this.gpa,
     this.email,
  });
  Map<String,dynamic> toJson()=>{
    UserFields.id:id,
    UserFields.name:name,
    UserFields.gpa:gpa,
  };
  User copy({
    String? id,
    String? name,
    String? gpa,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        gpa: gpa ?? this.gpa,
        email: email ?? this.email,
      );

  static User fromJson(Map<String, dynamic> json) => User(
      id: json[UserFields.id],
      name: json[UserFields.name],
      gpa: json[UserFields.gpa]);
  

}
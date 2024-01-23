class ConfigModel {
  final String name;
  final String message;
  final bool isWomen;

  ConfigModel({
    required this.name,
    required this.message,
    required this.isWomen,
  });

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      name: json['name'],
      message: json['message'],
      isWomen: json['isWomen'],
    );
  }

  factory ConfigModel.fromJsonDb(Map<String, dynamic> json) {
    return ConfigModel(
      name: json['name'],
      message: json['message'],
      isWomen: json['isWomen'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
      'isWomen': isWomen,
    };
  }
}

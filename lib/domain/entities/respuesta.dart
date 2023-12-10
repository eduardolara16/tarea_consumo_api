import 'dart:convert';

class Respuesta {
  String value;
  String icon_url;
  

  Respuesta({
    required this.value,
    required this.icon_url,
    
  });

  factory Respuesta.fromJson(Map<String, dynamic> json) {
    return Respuesta(
      value: json["value"],
  
      icon_url: json["icon_url"].toString(),
  
    );
  }

  Map<String, dynamic> toJson() => {
        "value": value,
       
        "icon_url": icon_url,
        
      };
}

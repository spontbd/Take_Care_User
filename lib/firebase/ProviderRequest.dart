class ProviderRequest {
  final String provider_token;
  final String request;
  final String user_id;
  final String user_name;
  final String user_token;
  final String id;
  //final DateTime date;

  ProviderRequest(this.provider_token, this.request,
      this.user_id, this.user_token, this.user_name, this.id,);




  ProviderRequest.fromJson(Map<dynamic, dynamic> json)
      :
        provider_token = json['provider_token'] as String ,
        request = json['request_type'] as String,
        user_id = json['user_id'] as String,
        id = json['id'] as String,
        user_name = json['user_name'] as String,
        user_token = json['user_token'] as String

  ;


  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'request_type': request,
    'provider_token': provider_token,
    'user_id': user_id,
    'id': id,
    'user_name': user_name,
    'user_token': user_token,
  };



}

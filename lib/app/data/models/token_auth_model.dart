class TokenAuthModel {
  String accessToken;
  String encryptedAccessToken;
  int expireInSeconds;
  int userId;

  TokenAuthModel({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.userId,
  });

  factory TokenAuthModel.fromJson(Map<String, dynamic> json) {
    return TokenAuthModel(
      accessToken: json['accessToken'] ?? '',
      encryptedAccessToken: json['encryptedAccessToken'] ?? '',
      expireInSeconds: json['expireInSeconds'] ?? 0,
      userId: json['userId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'encryptedAccessToken': encryptedAccessToken,
      'expireInSeconds': expireInSeconds,
      'userId': userId,
    };
  }
}

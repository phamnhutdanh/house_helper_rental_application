class SessionInfo {
  final String id;
  final String sessionToken;
  final String expires;
  final String? accessToken;
  final int? expiresAt;
  final int? expiresIn;
  final bool? isExpired;
  final String? providerRefreshToken;
  final String? providerToken;
  final String? refreshToken;
  final String? tokenType;
  final String accountInfoId;

  SessionInfo({
    required this.id,
    required this.sessionToken,
    required this.expires,
    this.accessToken,
    this.expiresAt,
    this.expiresIn,
    this.isExpired,
    this.providerRefreshToken,
    this.providerToken,
    this.refreshToken,
    this.tokenType,
    required this.accountInfoId,
  });
}

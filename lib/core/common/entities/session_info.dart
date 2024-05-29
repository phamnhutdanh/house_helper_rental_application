class SessionInfo {
  final String? id;
  final String? sessionToken;
  final String? expires;
  final String? accessToken;
  final int? expiresAt;
  final int? expiresIn;
  final bool? isExpired;
  final String? providerRefreshToken;
  final String? providerToken;
  final String? refreshToken;
  final String? tokenType;
  final String? accountInfoId;

  SessionInfo({
    this.id,
    this.sessionToken,
    this.expires,
    this.accessToken,
    this.expiresAt,
    this.expiresIn,
    this.isExpired,
    this.providerRefreshToken,
    this.providerToken,
    this.refreshToken,
    this.tokenType,
    this.accountInfoId,
  });
}

enum StorageKey { accesstoken, refreshtoken, verifytoken, phone, fcmtoken, locale, user }

enum ResponseMessage {
  connectionError,
  sended,
  wrongPhone,
  codeVerified,
  wrongCode,
  timeOut,
  pageNotFound
}

enum SnackBarType { connection, phoneError }

enum ShipmentType { plane, truck }

enum PaymentMethod { full, zero, partial }

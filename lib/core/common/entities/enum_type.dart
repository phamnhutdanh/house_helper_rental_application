enum AccountInfoRole {
  ADMIN,
  CUSTOMER,
  EMPLOYEE,
}

enum AccountStatus {
  BANNED,
  NONE,
  WARNING,
}

enum BookingStatus {
  PENDING,
  ACCEPTED,
  CANCELED,
  COMPLETED,
}

enum PaymentMethod {
  COD,
  MOMO,
}

enum TimeRange {
  MORNING,
  AFTERNOON,
  EVENING,
}

enum WeekDay {
  MON,
  TUE,
  WED,
  THU,
  FRI,
  SAT,
  SUN,
}

enum AddressType {
  DEFAULT,
  NONE,
}

enum ScheduleType {
  CUSTOM,
  REGULAR,
  NONE,
}

enum EmployeeAccountStatus {
  PENDING,
  ACCEPTED,
  CANCELED,
}

enum RepeatBookingStatus {
  NO_REPEAT,
  EVERY_DAY,
  EVERY_WEEK,
  EVERY_MONTH,
}

enum NotificationStatus {
  READ,
  UNREAD,
}

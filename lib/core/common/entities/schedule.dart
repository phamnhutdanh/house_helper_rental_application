import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class Schedule {
  final String id;
  final ScheduleType scheduleType;
  final TimeRange? timeRange;
  final WeekDay? weekDay;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String employeeId;

  Schedule({
    required this.id,
    required this.scheduleType,
    this.timeRange,
    this.weekDay,
    this.startedAt,
    this.endedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.employeeId,
  });
}

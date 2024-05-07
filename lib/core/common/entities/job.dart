class Job {
  final String id;
  final String name;

  Job({
    required this.id,
    required this.name,
  });
}

class EmployeeJob {
  final String id;
  final String jobId;
  final String employeeId;

  EmployeeJob({
    required this.id,
    required this.jobId,
    required this.employeeId,
  });
}

class ScheduleJob {
  final String id;
  final String jobId;
  final String scheduleId;

  ScheduleJob({
    required this.id,
    required this.jobId,
    required this.scheduleId,
  });
}

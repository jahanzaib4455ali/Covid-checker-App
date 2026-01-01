// Common models for dashboard data used across modules

class NoticeModel {
  final String title;
  final String description;
  final NoticeType type; // broadcast, warning, info
  final String? actionText;

  const NoticeModel({
    required this.title,
    required this.description,
    this.type = NoticeType.info,
    this.actionText,
  });
}

enum NoticeType { info, warning, success }

class StatMetric {
  final String title;
  final String value;
  final String? subtitle;

  const StatMetric({required this.title, required this.value, this.subtitle});
}

class SectionModel {
  final String title;
  final List<StatMetric> metrics;
  final String? trailing;

  const SectionModel({required this.title, required this.metrics, this.trailing});
}

class LabeledValue {
  final String label;
  final String value;
  const LabeledValue(this.label, this.value);
}

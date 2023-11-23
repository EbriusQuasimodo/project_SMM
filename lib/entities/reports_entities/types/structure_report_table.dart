class StructureReportTable {
  StructureReportTable(this.isSubparagraph, this.data, this.yesterdayValue, this.todayValue,
      this.todayPercent);

  final bool isSubparagraph;
  final String data;

  final int yesterdayValue;

  final int todayValue;

  final num? todayPercent;
}
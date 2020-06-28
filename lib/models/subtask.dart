class SubTaskData {
  SubTaskData(this.percentageCompletion, this.taskName);
  String taskName;
  int percentageCompletion;

  String getGoalName() {
    return taskName;
  }

  int getPercentageCompletion() {
    return percentageCompletion;
  }

  int setPercentageCompletion() {
    return percentageCompletion;
  }

  int getStatus() {
    return percentageCompletion;
  }

  Map toJson() =>
      {'goalName': taskName, 'percentageCompletion': percentageCompletion};
}

class TestModel {
  int _value = 0;
  final String option1;
  final String option2;
  final String option3;
  final String option4;

  setValue(int num) {
    _value = num;
  }

  int get value => _value;

  TestModel(
    this.option1,
    this.option2,
    this.option3,
    this.option4,
  );
}

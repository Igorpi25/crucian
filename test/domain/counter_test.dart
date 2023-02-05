import 'package:crucian/domain/counter.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('counter', () {
    late Counter counter;

    before(() {
      counter = Counter();
    });
    
    then('value should be 0', () {
      counter.value.should.beZero();
    });

    when('increment', () {
      before(() => counter.increment());
      
      then('value should be 1', () {
        counter.value.should.be(1);
      });

      and('increment', () {
        before(() => counter.increment());

        then('value should be 2', () {
          counter.value.should.be(2);
        });
      });

      and('reset', () {
        before(() => counter.reset());

        then('value should be 0', () {
          counter.value.should.beZero();
        });
      });
    });
  });
}
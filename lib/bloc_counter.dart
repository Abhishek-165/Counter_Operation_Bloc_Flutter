import 'dart:async';


enum CounterAction
{
Increment,
Decrement,
Reset
}

class Bloc_Counter implements baseBloc
{
int counter;

final _stateCounterController = StreamController<int>.broadcast();

StreamSink<int> get stateSinkcounter => _stateCounterController.sink;

Stream<int> get stateStreamcounter => _stateCounterController.stream;

final _eventCounterController = StreamController<CounterAction>.broadcast();  //.broadcast

StreamSink<CounterAction> get eventSinkcounter => _eventCounterController.sink;

Stream<CounterAction> get eventStreamcounter => _eventCounterController.stream;


Bloc_Counter()
{
  counter =0;

eventStreamcounter.listen((event) {
  if(event == CounterAction.Increment) counter++;
  else if(event == CounterAction.Decrement) counter--;
  else if(event == CounterAction.Reset) counter=0;

  stateSinkcounter.add(counter);


});
  
}

void dispose()
{
  _stateCounterController?.close();
  _eventCounterController?.close();
}

}

abstract class baseBloc
{
 void dispose();
}
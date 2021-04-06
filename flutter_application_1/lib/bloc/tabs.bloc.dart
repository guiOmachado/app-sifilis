import 'dart:async';

class TabsBloc {
  StreamController tabs = StreamController.broadcast();

  Stream get tabsStream => tabs.stream;

  getFluxo(int index) {
    print("PRINT BLOC " + index.toString());
    tabs.sink.add(index);
  }

  void dispose() {
    tabs.close();
  }
}

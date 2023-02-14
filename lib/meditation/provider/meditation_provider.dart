import 'package:async/async.dart';
import 'package:flutter/material.dart';

class MeditationProvider extends ChangeNotifier {
  int _inhale = 5;
  int _hold = 5;
  int _exhale = 5;
  String? status;
  bool? isActivityStart = false;
  CancelableOperation? _cancelableFuture1,
      _cancelableFuture2,
      _cancelableFuture3;

  // onAct() async {
  //   CancelableCompleter completer = CancelableCompleter(onCancel: () {
  //     print('onCancel');
  //   });
  //
  //   completer.operation.cancel(); // uncomment this to test cancellation
  //   completer.complete(Future.value('future result'));
  //   print('isCanceled: ${completer.isCanceled}');
  //   print('isCompleted: ${completer.isCompleted}');
  //   completer.operation.value.then((value) => {
  //         print('then: $value'),
  //       });
  //   completer.operation.value.whenComplete(() => {
  //         print('onDone'),
  //       });
  // }
  Future<void> _myFuture({required int duration}) async {
    await Future.delayed(Duration(seconds: duration));
  }

  void startActivity() async {
    print('On Activity Start');
    isActivityStart = true;
    for (int i = 0; i <= 3; i++) {
      status = 'Breath In';
      print(status);
      notifyListeners();
      _cancelableFuture1 = CancelableOperation.fromFuture(
        _myFuture(duration: _inhale),
        onCancel: () => 'Future has been canceled',
      );
      await _cancelableFuture1?.value.then((value) => {
            status = 'Hold',
          });
      print(status);
      notifyListeners();
      //----------------------------------------------------------------
      _cancelableFuture2 = CancelableOperation.fromFuture(
        _myFuture(duration: _inhale),
        onCancel: () => 'Future has been canceled',
      );
      await _cancelableFuture2?.value.then((value) => {
            status = 'Breathe Out',
          });
      print(status);
      notifyListeners();
      //---------------------------------------------------------------
      _cancelableFuture3 = CancelableOperation.fromFuture(
        _myFuture(duration: _exhale),
        onCancel: () => 'Future has been canceled',
      );
      await _cancelableFuture3?.value.then((value) => {});
    }
    status = 'Start';
    print(status);
    notifyListeners();
  }

  void cancelActivity() {
    _cancelableFuture1?.cancel();
    _cancelableFuture2?.cancel();
    _cancelableFuture3?.cancel();
    status = 'Start';
    isActivityStart = false;
    notifyListeners();
  }
}

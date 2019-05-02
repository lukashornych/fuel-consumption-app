import 'package:flutter/material.dart';

import 'package:fuel_consumption_app/src/core/repository.dart';
import 'package:fuel_consumption_app/src/core/refuel.dart';

class StateContainer extends StatefulWidget {

  final Widget child;

  StateContainer(this.child);

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer) as _InheritedStateContainer).data;
  }

  @override
  StateContainerState createState() {
    return StateContainerState();
  }
}

class StateContainerState extends State<StateContainer> {

  Repository repository;

  @override
  void initState() {
    repository = Repository();
    super.initState();
  }

  void updateData(VoidCallback toUpdate) {
    setState(() {
      toUpdate();
    });
  }

  void addRefuel(int drivenLength, double refueled) {
    updateData(() => repository.refuelsManager.refuels.add(Refuel(DateTime.now(), drivenLength, refueled)));
  }

  void clearAll() {
    updateData(() => repository.refuelsManager.refuels.clear());
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
        data: this,
        child: widget.child
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
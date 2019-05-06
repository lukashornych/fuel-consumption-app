import 'package:flutter/material.dart';

import 'package:fuel_consumption_app/src/core/repository.dart';
import 'package:fuel_consumption_app/src/core/refuel.dart';
import 'package:fuel_consumption_app/src/core/refuels_manager.dart';

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

    _loadData();
  }

  void _loadData() async {
    repository.refuelsManager = await RefuelsManager.loadFromLocalStorage();
    setState(() {});
  }

  void _updateData(VoidCallback toUpdate) {
    setState(() {
      toUpdate();
      repository.refuelsManager.saveToLocalStorage();
    });
  }

  void addRefuel(int drivenLength, double refueled) {
    _updateData(() => repository.refuelsManager.refuels.add(Refuel(DateTime.now(), drivenLength, refueled)));
  }

  void clearAll() {
    _updateData(() => repository.refuelsManager.refuels.clear());
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
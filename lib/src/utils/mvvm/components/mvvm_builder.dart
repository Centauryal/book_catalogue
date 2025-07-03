import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../base_view_model.dart';

class MvvmMultiBuilder extends StatelessWidget {
  final List<SingleChildWidget> providers;
  final Widget Function(BuildContext) child;

  const MvvmMultiBuilder({
    super.key,
    required this.providers,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Builder(
        builder: (context) => child(context),
      ),
    );
  }
}

class MvvmBuilder<T extends ChangeNotifier> extends StatefulWidget {
  final bool disposeViewModel;
  final bool initOnce;
  final Widget Function(BuildContext context) view;
  final T viewModel;

  const MvvmBuilder({
    required Key key,
    this.disposeViewModel = true,
    this.initOnce = false,
    required this.view,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<MvvmBuilder<T>> createState() => MvvmBuilderState<T>();
}

class MvvmBuilderState<T extends ChangeNotifier> extends State<MvvmBuilder<T>>
    with WidgetsBindingObserver {
  late T _vm;
  bool _initialized = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
    _vm = widget.viewModel;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// use it when needed,
    /// ex. to manipulate data when lifecycle changes or
    /// save to local storage when user close the apps.
    switch (state) {
      case AppLifecycleState.resumed:
        (_vm as BaseViewModel).onResume();
        break;
      case AppLifecycleState.inactive:
        (_vm as BaseViewModel).onInactive();
        break;
      case AppLifecycleState.paused:
        (_vm as BaseViewModel).onPause();
        break;
      case AppLifecycleState.detached:
        (_vm as BaseViewModel).onDetach();
        break;
      case AppLifecycleState.hidden:
        (_vm as BaseViewModel).onHidden();
        break;
    }
  }

  @override
  void didChangeDependencies() {
    if (identical(_vm, widget.viewModel)) {
      _vm = widget.viewModel;
    }

    (_vm as BaseViewModel).context = context;

    if (widget.initOnce && !_initialized) {
      (_vm as BaseViewModel).init();
      _initialized = true;
    } else if (!widget.initOnce) {
      (_vm as BaseViewModel).init();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    (_vm as BaseViewModel).onBuild();

    if (!widget.disposeViewModel) {
      return ChangeNotifierProvider<T>.value(
          value: _vm,
          child: Builder(builder: (context) => widget.view(context)));
    }
    return ChangeNotifierProvider<T>(
      create: (context) => _vm,
      child: Builder(builder: (context) => widget.view(context)),
    );
  }
}

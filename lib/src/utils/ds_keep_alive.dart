import 'package:flutter/material.dart';

class DsKeepAlive extends StatefulWidget {
  final Widget child;

  const DsKeepAlive({required this.child, super.key});

  @override
  State<DsKeepAlive> createState() => _DsKeepAliveState();
}

class _DsKeepAliveState extends State<DsKeepAlive> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}

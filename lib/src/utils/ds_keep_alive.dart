import 'package:flutter/material.dart';

class DsKeepAlive extends StatefulWidget {
  final Widget child;

  const DsKeepAlive({super.key, required this.child});

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

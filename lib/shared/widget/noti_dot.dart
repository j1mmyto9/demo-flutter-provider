import 'package:flutter/material.dart';

class NotiDot extends StatelessWidget {
  const NotiDot({required this.count, Key? key, this.height = 12})
      : super(key: key);
  final int count;
  final double height;
  @override
  Widget build(BuildContext context) {
    if (count <= 0) {
      return const SizedBox.shrink();
    }
    final text = count > 9 ? '9+' : '$count';
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        height: height,
        alignment: Alignment.center,
        constraints: BoxConstraints(minWidth: height),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 9, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}

class IconButtonNoti extends StatelessWidget {
  const IconButtonNoti({
    required this.icon,
    required this.count,
    this.onPressed,
    Key? key,
  }) : super(key: key);
  final Widget icon;
  final void Function()? onPressed;
  final int count;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          IconButton(icon: icon, onPressed: onPressed),
          if (count <= 0)
            Positioned(right: 8, top: 12, child: NotiDot(count: count))
        ],
      ),
    );
  }
}

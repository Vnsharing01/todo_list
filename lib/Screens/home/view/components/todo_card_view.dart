import 'package:flutter/material.dart';

class TodoCardView extends StatefulWidget {
  const TodoCardView({
    super.key,
    required this.titleTask,
    required this.content,
    this.startDay,
    this.endDay,
    required this.imgTaskUrl,
    this.isDone = false,
    this.onChanged,
    this.onTap,
    this.onLongPress,
  });

  final String titleTask, content;
  final DateTime? startDay, endDay;
  final String imgTaskUrl;
  final bool isDone;
  final void Function(bool? value)? onChanged;
  final void Function()? onTap, onLongPress;

  @override
  State<TodoCardView> createState() => _TodoCardViewState();
}

class _TodoCardViewState extends State<TodoCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 148,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.titleTask,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Checkbox(
                          value: widget.isDone, onChanged: widget.onChanged)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      widget.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Text(
                  //   ' ${widget.startDay} - ${widget.endDay}',
                  // )
                ],
              )),
              widget.imgTaskUrl.isNotEmpty
                  ? Image.network(widget.imgTaskUrl)
                  : Image.asset(
                      'assets/1.png',
                      scale: 14,
                      fit: BoxFit.cover,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

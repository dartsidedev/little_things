import 'package:flutter/material.dart';
import 'package:little_things_list/src/data/done_provider.dart';
import 'package:provider/provider.dart';

class CongratsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allDone =
        context.select<DoneNotifier, bool>((value) => value.isAllDone);
    final theme = Theme.of(context);

    return AnimatedPositioned(
      left: 40,
      right: 40,
      top: allDone ? 100 : -420,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      child: RepaintBoundary(
        child: Card(
          color: theme.scaffoldBackgroundColor,
          shape: CircleBorder(),
          elevation: 12,
          child: Padding(
            padding: EdgeInsets.only(
              top: 130,
              left: 50,
              right: 50,
              bottom: 110,
            ),
            child: _CardContents(allDone),
          ),
        ),
      ),
    );
  }
}

class _CardContents extends StatefulWidget {
  final bool isDone;

  const _CardContents(this.isDone);

  @override
  _CardContentsState createState() => _CardContentsState();
}

class _CardContentsState extends State<_CardContents>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _CardContents oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isDone && widget.isDone) {
      _controller.forward(from: 0);
    } else if (oldWidget.isDone && !widget.isDone) {
      _controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ScaleTransition(
          scale: CurvedAnimation(
            curve: Interval(
              0.2,
              0.6,
              curve: Curves.elasticOut,
            ),
            parent: _controller,
          ),
          child: SizedBox(
            height: 80,
            child: Text(
              '🚀',
              style: TextStyle(fontSize: 45),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Congrats!',
          style: theme.textTheme.headline5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: TrackedOutText(
            'You have successfully completed watching this talk.\n'
            'You get 50 completely meaningless virtual points!',
            CurvedAnimation(
              curve: Interval(0.45, 0.7),
              parent: _controller,
            ),
            textAlign: TextAlign.center,
            style: theme.textTheme.caption,
          ),
        ),
      ],
    );
  }
}

class TrackedOutText extends StatefulWidget {
  final String text;

  final List<TextSpan> _slices;
  final List<TextSpan> _slicesTransparent;

  final Animation<double> progress;

  final TextAlign textAlign;
  final TextStyle style;

  TrackedOutText(
    this.text,
    this.progress, {
    this.textAlign,
    this.style,
  })  : _slices = _generateSlices(text, style, false).toList(growable: false),
        _slicesTransparent =
            _generateSlices(text, style, true).toList(growable: false);

  static Iterable<TextSpan> _generateSlices(
      String text, TextStyle style, bool transparent) sync* {
    const step = 3;
    var i = 0;
    for (; i < text.length - step; i += step) {
      yield TextSpan(
        text: text.substring(i, i + step),
        style: transparent ? style.apply(color: Colors.transparent) : null,
      );
    }
    yield TextSpan(
      text: text.substring(i),
      style: transparent ? style.apply(color: Colors.transparent) : null,
    );
  }

  @override
  _TrackedOutTextState createState() => _TrackedOutTextState();
}

class _TrackedOutTextState extends State<TrackedOutText> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.progress,
      builder: (BuildContext context, Widget child) {
        return Text.rich(
          TextSpan(
            children: [
              for (var i = 0; i < widget._slices.length; i++)
                (i / widget._slices.length < widget.progress.value)
                    ? widget._slices[i]
                    : widget._slicesTransparent[i],
            ],
          ),
          textAlign: widget.textAlign,
          style: widget.style,
        );
      },
    );
  }
}

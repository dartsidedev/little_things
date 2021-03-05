import 'package:flutter/material.dart';
import 'package:little_things_list/src/data/agenda.dart';

class ItemDetail extends StatelessWidget {
  final AgendaItem item;

  const ItemDetail(this.item);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        elevation: 0,
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline6: Theme.of(context)
              .textTheme
              .headline6
              .apply(color: theme.primaryColor, fontWeightDelta: 5),
        ),
        iconTheme: IconThemeData(color: theme.primaryColor),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Absolutely nothing happened.',
                        style: theme.textTheme.subtitle1,
                      ),
                      backgroundColor: theme.appBarTheme.backgroundColor,
                      padding: EdgeInsets.fromLTRB(24, 6, 24, 12),
                    ),
                  );
                },
                color: theme.accentColor,
                tooltip: 'Do nothing',
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 60),
        children: [
          for (var paragraph in item.description
              .split('\n')
              .where((element) => element.isNotEmpty))
            _Paragraph(paragraph)
        ],
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;

  _Paragraph(this.text) : assert(text.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget child;
    if (text.startsWith('# ')) {
      child = Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          text.substring(2),
          style: theme.textTheme.headline6,
        ),
      );
    } else {
      child = SelectableText(text);
    }

    return AnimatedPadding(
      padding: EdgeInsets.only(left: 72, top: 20, right: 20),
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}

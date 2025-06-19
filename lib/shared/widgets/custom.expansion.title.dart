// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZCustomExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  final Widget? expandedIcon;
  final Widget? collapsedIcon;
  final bool showDivider;
  final bool isExpanded;

  const ZCustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.expandedIcon,
    this.collapsedIcon,
    this.showDivider = true,
    this.isExpanded = false,
  });

  @override
  _ZCustomExpansionTileState createState() => _ZCustomExpansionTileState();
}

class _ZCustomExpansionTileState extends State<ZCustomExpansionTile> {
  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ZCustomExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      setState(() {
        _isExpanded = widget.isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: ZAppColor.transparentColor, // or any color you like
          ),
          child: ExpansionTile(
            title: widget.title,
            tilePadding: EdgeInsets.zero,
            // trailing: AnimatedRotation(
            //   turns: _isExpanded ? 0.5 : 0,
            //   duration: Duration(milliseconds: 200),
            //   child: Icon(Icons.expand_more),
            // ),
            trailing:
                _isExpanded
                    ? widget.expandedIcon ?? Assets.icons.removeIcon.svg()
                    : widget.collapsedIcon ?? Assets.icons.addDarkIcon.svg(),
            initiallyExpanded: _isExpanded,
            onExpansionChanged: (value) {
              setState(() {
                _isExpanded = value;
              });
            },
            children: widget.children,
          ),
        ),

        if (widget.showDivider && !_isExpanded)
          Divider(
            color: ZAppColor.dividerColor, // Customize the divider color here
            height: ZAppSize.s1,
            thickness: ZAppSize.s1,
          ),
      ],
    );
  }
}

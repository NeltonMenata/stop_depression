import 'package:flutter/material.dart';

class PageViewItem extends StatefulWidget {
  PageViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.activePage,
    required this.image,
    required this.action,
    required this.color,
  });

  final String title;
  final String subtitle;
  final String image;
  final bool activePage;
  final dynamic color;
  final dynamic action;

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  @override
  Widget build(BuildContext context) {

    final double top = widget.activePage ? 50 : 90;
    final double blur = widget.activePage ? 30 : 0;
    final double offset = widget.activePage ? 20 : 0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          widget.action(context);
        },
        child: AnimatedContainer(
          duration: const Duration(microseconds: 500),
          margin: EdgeInsets.only(top: top, bottom: top),
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                
                //opacity: .9,
                image: AssetImage(widget.image),

              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: blur,
                  offset: Offset(offset, offset)
                )
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    //fontFamily: "Meridian",
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

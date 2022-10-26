import 'dart:ui';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import '/pages/discount_stack/contact.dart';
import 'package:overbank/constants.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PerspectiveListView extends StatefulWidget {
  const PerspectiveListView({
    super.key,
    required this.visualizedItems,
    required this.itemExtent,
    required this.children,
    this.initialIndex = 0,
    this.padding = EdgeInsets.zero,
    this.onTapFrontItem,
    this.onChangeFrontItem,
    this.backItemsShadowColor = Colors.transparent,
    this.enableBackItemsShadow = false,
  });

  final List<Widget> children;
  final double? itemExtent;
  final int? visualizedItems;
  final int initialIndex;
  final EdgeInsetsGeometry padding;
  final ValueChanged<int?>? onTapFrontItem;
  final ValueChanged<int>? onChangeFrontItem;
  final Color backItemsShadowColor;
  final bool enableBackItemsShadow;

  @override
  PerspectiveListViewState createState() => PerspectiveListViewState();
}

class PerspectiveListViewState extends State<PerspectiveListView> {
  PageController? _pageController;
  int? _currentIndex;
  double? _pagePercent;

  @override
  void initState() {
    _currentIndex = widget.initialIndex;
    _pageController = PageController(
      viewportFraction: 1 / widget.visualizedItems!,
      initialPage: _currentIndex!,
    );
    _pagePercent = 0.0;
    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  void _pageListener() {
    _currentIndex = _pageController!.page!.floor();
    _pagePercent = (_pageController!.page! - _currentIndex!).abs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        return Stack(
          children: [
            //       SmoothPageIndicator(controller: _pageController, count:widget.children.length)

            //---------------------------------------
            // Perspective Items List
            //---------------------------------------
            Padding(
              padding: widget.padding,
              child: _PerspectiveItems(
                generatedItems: widget.visualizedItems! - 1,
                currentIndex: _currentIndex,
                heightItem: widget.itemExtent,
                pagePercent: _pagePercent,
                children: widget.children,
              ),
            ),
            //---------------------------------------
            // Back Items Shadow
            //---------------------------------------
            // if (widget.enableBackItemsShadow)
            //   Positioned.fill(
            //     bottom: widget.itemExtent,
            //     child: DecoratedBox(
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           colors: [
            //             widget.backItemsShadowColor.withOpacity(.8),
            //             widget.backItemsShadowColor.withOpacity(0),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            //---------------------------------------
            // Void Page View
            //---------------------------------------
            PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              onPageChanged: widget.onChangeFrontItem?.call,
              //physics: const BouncingScrollPhysics(),
              itemCount: widget.children.length,
              itemBuilder: (context, index) {
                return const SizedBox();
              },
            ),
            //---------------------------------------
            // On Tap Item Area
            //---------------------------------------
            Positioned.fill(
              top: height - widget.itemExtent!,
              child: GestureDetector(
                onTap: () => widget.onTapFrontItem?.call(_currentIndex),
              ),
            )
          ],
        );
      },
    );
  }
}

class _PerspectiveItems extends StatelessWidget {
  const _PerspectiveItems({
    required this.generatedItems,
    required this.currentIndex,
    required this.heightItem,
    required this.pagePercent,
    required this.children,
  });

  final int generatedItems;
  final int? currentIndex;
  final double? heightItem;
  final double? pagePercent;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        const _endScale = 0.7;

        //final height = 10;

        // print('cmh ${constraints.maxHeight.toString()}');
        return Stack(
          fit: StackFit.expand,
          //fit: StackFit.passthrough,
          children: [
            //---------------------------------
            // Static Last Item
            //---------------------------------
            if (currentIndex! > (generatedItems - 1))
              _TransformedItem(
                heightItem: heightItem,
                factorChange: 1,
                endScale: _endScale,
                child: children[currentIndex! - generatedItems],
              )
            else
              const SizedBox(),
            //----------------------------------
            // Perspective Items
            //----------------------------------
            for (int index = 0; index < generatedItems; index++)
              (currentIndex! > ((generatedItems - 2) - index))
                  ? _TransformedItem(
                      heightItem: heightItem,
                      factorChange: pagePercent,
                      scale: lerpDouble(
                          _endScale, 1, (index + 1) / generatedItems),
                      translateY:
                          (height - heightItem!) * (index + 1) / generatedItems,
                      endScale:
                          lerpDouble(_endScale, 1, index / generatedItems),
                      endTranslateY:
                          (height - heightItem!) * (index / generatedItems),
                      child: children[
                          currentIndex! - (((generatedItems - 2) - index) + 1)],
                    )
                  : const SizedBox(),
            //---------------------------------
            // Bottom Item
            //---------------------------------
            //  if (currentIndex! < (children.length - 1))
            _TransformedItem(
              heightItem: heightItem,
              factorChange: pagePercent,

              // translateY: height + 20,
              // endTranslateY: height - heightItem!,

              translateY: height + 10,
              endTranslateY: height + 10,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  //color: borderColor,
                  // color: majorColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                //-----------------------------
                // Card Body
                //-----------------------------
                child: Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(2, 2))
                    ],
                  ),
                  //padding: const EdgeInsets.all(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          QrImage(
                              data: Contact.contacts[currentIndex!].name +
                                  Contact.contacts[currentIndex!].address,
                              version: QrVersions.auto,
                              size: 150,
                              gapless: false),
                          //---------------------------
                          // Name and Role
                          SizedBox(width: 20),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _TransformedItem extends StatelessWidget {
  const _TransformedItem({
    required this.heightItem,
    required this.child,
    required this.factorChange,
    this.endScale = 1.0,
    this.scale = 1.0,
    this.endTranslateY = 0.0,
    this.translateY = 0.0,
  });

  final Widget child;
  final double? heightItem;
  final double? factorChange;
  final double? endScale;
  final double endTranslateY;
  final double translateY;
  final double? scale;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..scale(lerpDouble(scale, endScale, factorChange!))
        ..translate(
          0.0,
          lerpDouble(translateY, endTranslateY, factorChange!)!,
        ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: heightItem,
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}

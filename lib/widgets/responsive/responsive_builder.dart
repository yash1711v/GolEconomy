import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = false;
    var width = MediaQuery.of(context).size.width;
    if (width >= 1100) {
    } else if (width >= 650) {
    } else if (width < 650) {
      isMobile = true;
    }
    if (isMobile) {
      return ScreenUtilInit(
          designSize: const Size(375, 812),
          useInheritedMediaQuery: true,
          builder: (context, _) {
            return builder(context);
          });
    } else {
      return Container(
        color: Colors.black,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 650),
            child: MediaQuery(
              data: const MediaQueryData(size: Size(430, 932)),
              child: ScreenUtilInit(
                  designSize: const Size(375, 812),
                  useInheritedMediaQuery: true,
                  builder: (context, _) {
                    return builder(context);
                  }),
            ),
          ),
        ),
      );
    }
  }
}

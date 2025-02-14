import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoadingShimmer extends StatefulWidget {
  const ProductLoadingShimmer({
    super.key,
  });

  @override
  State<ProductLoadingShimmer> createState() => _ProductLoadingShimmerState();
}

class _ProductLoadingShimmerState extends State<ProductLoadingShimmer>with SingleTickerProviderStateMixin {
late AnimationController _animationController;
final ScrollController _scrollController = ScrollController();
  
  late Animation<Offset> _slideAnimation;

@override
   void initState() {
    super.initState();
  
    // إعداد AnimationController للتحريك من الأسفل
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // يبدأ من أسفل العنصر
      end: Offset.zero,          // ينتهي في موقعه الطبيعي
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    
    // بدء الأنيميشن
    _animationController.forward();

    // مثال على إيقاف Loading بعد تأخير (يمكنك استبداله بعملية جلب بيانات)
   
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlideTransition(
          position: _slideAnimation,
          child: GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 250 / 360,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return  Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),),
                margin: const EdgeInsets.all(8),
                
                height: 150,
              ),
            );
            },
          ),
        ),
    );
  }
}

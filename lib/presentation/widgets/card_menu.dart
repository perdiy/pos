import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../page/detail/detail_page.dart';
import 'quantity_snackbar.dart';

class CardMenu extends StatefulWidget {
  const CardMenu({super.key});

  @override
  State<CardMenu> createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  int quantity = 0;

  int totalItems = 2;
  String items = 'Italian Spaghetti, Almond Cake';
  String totalPrice = '\$55.62';

  @override
  void initState() {
    super.initState();
    _loadQuantity();
  }

  Future<void> _loadQuantity() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      quantity = prefs.getInt('seblak_quantity') ?? 0;
    });
  }

  Future<void> _updateQuantity(int newQty) async {
    final prefs = await SharedPreferences.getInstance();
    if (newQty > 0) {
      await prefs.setInt('seblak_quantity', newQty);
    } else {
      await prefs.remove('seblak_quantity');
    }
  }

  void _showQuantitySnackbar(int qty) {
    if (qty > 0) {
      showCustomSnackbar(
        context,
        qty: totalItems,
        itemsText: items,
        priceText: totalPrice,
      );
    }
  }

  void _increment() {
    setState(() {
      quantity++;
    });
    _updateQuantity(quantity);
    _showQuantitySnackbar(quantity);
  }

  void _decrement() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
      _updateQuantity(quantity);
      if (quantity > 0) {
        _showQuantitySnackbar(quantity);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailPage(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/seblak.png', height: 120.h),
            ),
            SizedBox(height: 12.h),
            Text('Seblak Bandung',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            Text('Dessert',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
            const Spacer(),
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: const Color.fromARGB(31, 135, 135, 135),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '\$',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: '12',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: '.50',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  quantity == 0
                      ? GestureDetector(
                          onTap: _increment,
                          child: Container(
                            width: 26.w,
                            height: 26.h,
                            decoration: const BoxDecoration(
                                color: Colors.orange, shape: BoxShape.circle),
                            child: Icon(Icons.add,
                                color: Colors.white, size: 18.r),
                          ),
                        )
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: _decrement,
                              child: Container(
                                width: 26.w,
                                height: 28.h,
                                decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.remove,
                                    color: Colors.white, size: 18.r),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text('$quantity',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: _increment,
                              child: Container(
                                width: 26.w,
                                height: 26.h,
                                decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 18.r),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

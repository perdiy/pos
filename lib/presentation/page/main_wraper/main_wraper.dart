import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/card_karegori.dart';
import '../../widgets/card_menu.dart';

class MainWraper extends StatefulWidget {
  const MainWraper({super.key});

  @override
  State<MainWraper> createState() => _MainWraperState();
}

class _MainWraperState extends State<MainWraper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 243, 243),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 160.h,
            backgroundColor: Colors.orange,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(top: 70.h, left: 16.h, right: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 25.r, child: Container()),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama Pengguna',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold)),
                              Text('Jabatan Pengguna',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.sp,
                                  )),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(10.h),
                            ),
                            child: Icon(Icons.notifications,
                                color: Colors.white, size: 25.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.w),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        SizedBox(width: 4.w),
                        Text('Bandung, Indonesia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(5.h),
              child: SizedBox(
                height: 54.h,
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 24.h,
                      child: Container(
                        color: const Color.fromARGB(255, 245, 243, 243),
                      ),
                    ),
                    Positioned(
                      left: 16.w,
                      right: 16.w,
                      top: 0.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search for “Soto”',
                                      border: InputBorder.none,
                                      icon: Icon(Icons.search),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: const Icon(Icons.filter_alt_outlined),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                  right: 16.w, left: 16.w, top: 20.h, bottom: 5.h),
              child: const Row(
                children: [
                  CardKategori(title: 'Semua'),
                  CardKategori(title: 'Makanan'),
                  CardKategori(title: 'Minuman'),
                  CardKategori(title: 'Cemilan'),
                  CardKategori(title: 'Sayur'),
                  CardKategori(title: 'Buah'),
                  // Tambah sesuai kebutuhan
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const CardMenu();
                },
                childCount: 30,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 15.w,
                childAspectRatio: 3 / 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

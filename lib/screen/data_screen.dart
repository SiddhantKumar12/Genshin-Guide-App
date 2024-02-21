import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/Utils/snackbar_helper.dart';
import 'package:dainsleif_journal/repositiory/api_service/api_strings.dart';
import 'package:dainsleif_journal/screen/artifact_detail_screen.dart';
import 'package:dainsleif_journal/screen/character_detail_screen.dart';
import 'package:dainsleif_journal/screen/domain_detail_screen.dart';
import 'package:dainsleif_journal/screen/element_detail_screen.dart';
import 'package:dainsleif_journal/screen/weapon_detail_screen.dart';
import 'package:dainsleif_journal/screen/widget/cache_image_widget.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utils/image.dart';
import '../cubit/data_cubit/data_cubit.dart';
import '../cubit/serach cubit.dart';
import 'nation_detail_screen.dart';

class DataScreen extends StatefulWidget {
  final String item;

  const DataScreen({super.key, required this.item});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late SearchCubit _searchCubit;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    var cubit = DataCubit.get(context);
    if (widget.item == 'consumables') {
      cubit.fetchData('${widget.item}/food/list');
    } else {
      cubit.fetchData(widget.item);
    }

    _searchCubit = SearchCubit();
    super.initState();
  }

  // GModal? genshinModal = MyStorage.getGenshinData();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: CustomAppBar(text: 'Character Name'),
        body: BlocBuilder<DataCubit, DataState>(
          builder: (context, state) {
            if (state is DataLoaded) {
              var data = state.gCharacterModal.name;
              _searchCubit.search("", data!);
              return Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        _searchCubit.search(value, data);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        suffixIcon: IconButton(
                          onPressed: () {
                            _searchController.clear();
                            _searchCubit.search("", data);
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    MyText(text: widget.item.toUpperCase(), fontSize: 24.sp),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: BlocBuilder<SearchCubit, List<dynamic>>(
                        bloc: _searchCubit,
                        builder: (context, state) {
                          return GridView.builder(
                            primary: false,
                            itemCount: state.length, // Replace with your desired item count
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              // mainAxisExtent: 256,
                              childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.6),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  if (widget.item == 'nations') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NationDetailScreen(
                                          name: data[index].toString(),
                                        ),
                                      ),
                                    );
                                  } else if (widget.item == 'artifacts') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ArtifactDetailScreen(
                                          name: data[index].toString(),
                                        ),
                                      ),
                                    );
                                  } else if (widget.item == 'weapons') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WeaponDetailScreen(
                                          name: data[index].toString(),
                                        ),
                                      ),
                                    );
                                  } else if (widget.item == 'domains') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DomainDetailScreen(
                                          name: data?[index].toString() ?? '',
                                        ),
                                      ),
                                    );
                                  } else if (widget.item == 'consumables') {
                                    Navigator.push(context, MySnackbar.showComingSoonSnackbar(context));
                                  } else if (widget.item == 'enemies') {
                                    MySnackbar.showComingSoonSnackbar(context);
                                  } else if (widget.item == 'elements') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ElementDetailScreen(
                                          name: data[index].toString() ?? '',
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GCharacterDetailScreen(
                                          name: data[index].toString() ?? '',
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  // height: 400.h,
                                  decoration: BoxDecoration(
                                    color: MyColor.whiteColor,
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 200.h,
                                        margin: EdgeInsets.all(8.h),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.r),
                                        ),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(15.r),
                                              child: Image.asset(
                                                MyImage.bg,
                                                height: 200.h,
                                                width: double.maxFinite,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.bottomCenter,
                                                child: CacheImageWidget(
                                                  height: 180.h,
                                                  width: double.maxFinite,
                                                  imageUrl: processString(item: widget.item, index: index, data: data),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                                        child: MyText(
                                          text: state[index].toString().toUpperCase() ?? '',
                                          fontSize: 15.sp,
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is DataLoading) {
              return MyLoader();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  String processString({required String item, required List<dynamic>? data, required int index}) {
    switch (item) {
      case 'characters':
        return '${MyImage.characterImage}${data?[index] ?? ''}/icon-big';
      case 'consumables':
        return ApiStrings.baseUrl + ApiStrings.consumables + 'food/' + data?[index];
      case 'nations':
        return '${ApiStrings.baseUrl + ApiStrings.nations + data?[index]}/icon';
      case 'weapons':
        return '${ApiStrings.baseUrl + ApiStrings.weapons + data?[index]}/icon';
      case 'elements':
        return '${ApiStrings.baseUrl + ApiStrings.elements + data?[index]}/icon';
      case 'artifacts':
        return '${ApiStrings.baseUrl + ApiStrings.artifacts + data?[index]}/flower-of-life';
      default:
        return 'Invalid option';
    }
  }
}

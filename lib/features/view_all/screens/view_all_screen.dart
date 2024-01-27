import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getit/core/models/item_model.dart';
import 'package:getit/features/home/widgets/constants.dart';
import 'package:getit/features/view_all/widgets/appbar.dart';
import 'package:getit/features/view_all/widgets/item_container.dart';
import 'package:getit/features/view_all/widgets/recipe_list_item_wrapper.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  final filterItemsController = TextEditingController();
  bool isSearchOpened = false;
  final ValueNotifier<ScrollDirection> scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);
  @override
  void dispose() {
    filterItemsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ItemModel> filteredItems = filterItemsController.text.isEmpty
        ? items
        : items
            .where(
              (element) => element.itemName
                  .toLowerCase()
                  .trim()
                  .contains(filterItemsController.text),
            )
            .toList();
    return CupertinoPageScaffold(
        backgroundColor: const Color(0xff9daf9b),
        navigationBar: viewAllScreenAppBar(
            context: context,
            controller: filterItemsController,
            onChanged: (text) {
              setState(() {});
            }),
        child: NotificationListener<UserScrollNotification>(
          onNotification: (UserScrollNotification notification) {
            if (notification.direction == ScrollDirection.forward ||
                notification.direction == ScrollDirection.reverse) {
              scrollDirectionNotifier.value = notification.direction;
            }
            return true;
          },
          child: ListView.builder(
            itemCount: filteredItems.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: 5.w,
                right: 5.w,
                top: 40,
                bottom: MediaQuery.of(context).padding.bottom + 20),
            cacheExtent: 0,
            itemBuilder: (context, index) {
              return ValueListenableBuilder(
                valueListenable: scrollDirectionNotifier,
                builder: (context, ScrollDirection scrollDirection, child) {
                  return RecipeListItemWrapper(
                    scrollDirection: scrollDirection,
                    child: child!,
                  );
                },
                child: ItemContainer(
                    item: filteredItems[index], invert: index % 2 == 1),
              );
            },
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_app/configs/config.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Search"),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 3)),
        backgroundColor: whiteColor,
        color: appColor,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 40,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(
                    horizontal: appDefaultPadding,
                    vertical: appDefaultPadding / 4,
                  ),
                  decoration: BoxDecoration(
                    color: greyColor.shade100,
                    borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: appDefaultPadding / 2),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: greyColor,
                      ),
                      const SizedBox(width: appDefaultPadding / 2),
                      const Text(
                        "Search someone here",
                        style: TextStyle(color: greyColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(vertical: appDefaultPadding / 2),
              sliver: SliverList.builder(
                itemCount: 20,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  highlightColor: greyColor.shade100,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: appDefaultPadding,
                      vertical: appDefaultPadding / 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://i.pinimg.com/736x/e6/cb/56/e6cb5675d3a47be9e5fef5919c8f2a69.jpg',
                          ),
                        ),
                        const SizedBox(width: appDefaultPadding),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Someone",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: appDefaultPadding / 4),
                              Text(
                                "102.50K followers",
                                style:
                                    TextStyle(fontSize: 12, color: greyColor),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius:
                              BorderRadius.circular(appDefaultBorderRadius),
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(
                              horizontal: appDefaultPadding,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: greyColor.shade200),
                              borderRadius:
                                  BorderRadius.circular(appDefaultBorderRadius),
                            ),
                            child: const Text('Follow'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

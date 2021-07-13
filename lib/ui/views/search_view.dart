import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/providers/current_voting_data_models.dart';
import 'package:votex/providers/recent_voting_searches_provider.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/ui/view_model/search_view_model.dart';
import 'package:votex/ui/widgets/animation_widgets.dart';
import 'package:votex/ui/widgets/voting_list_tiles.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return ViewModelBuilder<SearchViewModel>.reactive(
        builder: (ctx, model, widget) {
          return GestureDetector(
            onTap: () => model.unfocus(context),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: devSize.width * .07,
                    vertical: devSize.height * .025),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showSearch<String>(
                            context: context, delegate: _DataSearch(model));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: SearchBarColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    'Type Here...',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black.withOpacity(.6)),
                                  ),
                                )),
                                IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {
                                    showSearch<String>(
                                        context: context,
                                        delegate: _DataSearch(model));
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Recent Searches",
                      style: GoogleFonts.montserrat(color: Colors.black),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(.4),
                    ),
                    Expanded(child: Consumer<RecentVotingSearchesProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                        if (value.recentSearches.isEmpty)
                          return Center(
                            child: Column(
                              children: [
                                LottieEmptyBox(),
                                Text(
                                  "No Recent Searches",
                                  style: mediumHeaderText,
                                ),
                              ],
                            ),
                          );
                        return BuildVotingListTiles(value.recentSearches,
                            model.navigateToVotingDetails);
                      },
                    ))
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => SearchViewModel());
  }
}

class _DataSearch extends SearchDelegate<String> {
  final SearchViewModel model;
  _DataSearch(this.model)
      : super(
            keyboardType: TextInputType.text, searchFieldLabel: 'Type here...');

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: model.pop,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final provider = Provider.of<CurrentVotingDataModelProvider>(context);
    final recentSearches =
        Provider.of<RecentVotingSearchesProvider>(context, listen: false);
    final data = provider.currentVotingDataModel
        .where((element) => element.title!.startsWith(query.toUpperCase()))
        .toList();
    data.forEach((element) {
      recentSearches.addRecentSearchesWithSingleData = element;
    });
    return BuildVotingListTiles(data, model.navigateToVotingDetails);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = Provider.of<CurrentVotingDataModelProvider>(context);
    final data = provider.currentVotingDataModel
        .where((element) => element.title!.startsWith(query.toUpperCase()))
        .toList();
    if (data.isEmpty) return Center(child: Container(child: LottieNoData()));
    return BuildVotingListTiles(data, model.navigateToVotingDetails,
        shouldHighlightSome: true,
        query: query,
        shouldUpdateRecentSearchesProvider: true);
  }
}

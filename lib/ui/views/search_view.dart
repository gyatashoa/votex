import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/ui/view_model/search_view_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return ViewModelBuilder<SearchViewModel>.reactive(
        builder: (ctx, model, widget) {
          var hintText;
          return GestureDetector(
            onTap: () => model.unfocus(context),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: devSize.width * .07,
                  vertical: devSize.height * .025),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: SearchBarColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: model.onValueChanged,
                                controller: model.searchController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration.collapsed(
                                    hintStyle:
                                        GoogleFonts.montserrat(fontSize: 17),
                                    hintText: model.hintText),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.search),
                              onPressed: model.searchController.text.isEmpty
                                  ? null
                                  : model.performSearch,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => SearchViewModel());
  }
}

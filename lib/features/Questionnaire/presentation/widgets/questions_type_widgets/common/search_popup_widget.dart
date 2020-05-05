import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/cupertino_flutter_typeahead.dart';
import 'package:scrips_core/common/domain/usecases/fetch_value_sets_use_case.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_ua/core/constants/app_assets.dart';
import 'package:scrips_ua/di/dependency_injection.dart';

class SearchResourceWidget extends StatefulWidget {
  SearchResourceWidget({
    Key key,
    this.groupName,
    this.onSelected,
  }) : super(key: key);
  final String groupName;
  final Function onSelected;

  @override
  _SearchResourceWidgetState createState() => _SearchResourceWidgetState();
}

class _SearchResourceWidgetState extends State<SearchResourceWidget> {
  TextEditingController textEditingController;
  FetchValueSetsUseCase fetchValueSetsUseCase;

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    fetchValueSetsUseCase = FetchValueSetsUseCase(repository: uaSl());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 23),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13)),
            child: Container(
              color: bgColor,
              height: MediaQuery.of(context).size.height - 23,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 56,
                    color: enabledBtnTextColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Images.instance.asset(name: "ic_close")),
                          Expanded(
                            child: Text(
                              "Search ${widget.groupName}",
                              style: boldLabelTextStyle(17, textInputColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                              width: 40,
                              child: Center(
                                  child: Text(
                                "",
                                style: semiBoldLabelTextStyle(
                                    16, enabledBtnBGColor),
                              ))),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: separatorColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16, left: 16, top: 10),
                    child: Container(
                      height: 36.0,
                      constraints: BoxConstraints.expand(height: 36),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: CupertinoTypeAheadFormField(
                                      hideOnEmpty: true,
                                      hideSuggestionsOnKeyboardHide: false,
                                      keepSuggestionsOnLoading: false,
                                      suggestionsBoxVerticalOffset: 10,
                                      debounceDuration:
                                          Duration(milliseconds: 200),
                                      hideOnError: true,
                                      loadingBuilder: (context) {
                                        return Container(
                                          height: 100,
                                          child: Center(
                                            child: SizedBox(
                                                height: 30,
                                                width: 30,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color>(
                                                          enabledBtnBGColor),
                                                )),
                                          ),
                                        );
                                      },
                                      textFieldConfiguration:
                                          CupertinoTextFieldConfiguration(
                                              padding:
                                                  EdgeInsets.only(left: 30),
                                              autofocus: true,
                                              style: normalLabelTextStyle(
                                                  15, regularTextColor),
                                              controller: textEditingController,
                                              decoration: BoxDecoration(
                                                color: searchBGColour,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              placeholder:
                                                  "Search ${widget.groupName}",
                                              onChanged: (value) {}),
                                      suggestionsCallback: (pattern) async {
                                        final result =
                                            await fetchValueSetsUseCase(
                                                FetchValueSetsParams(request: {
                                          "SearchText": pattern,
                                          "SearchFor": widget.groupName,
                                          "Country": ""
                                        }));
                                        return result.fold(
                                          (error) => [],
                                          (success) => success,
                                        );
                                      },
                                      itemBuilder: (context, prediction) {
                                        return Listener(
                                          child: Material(
                                            child: ListTile(
                                              title: Text(
                                                prediction?.valueCoding
                                                        ?.display ??
                                                    "n/a",
                                                style: normalLabelTextStyle(
                                                    15, regularTextColor),
                                              ),
                                            ),
                                          ),
                                          onPointerDown: (_) => null,
                                        );
                                      },
                                      onSuggestionSelected: (prediction) {
                                        widget.onSelected(prediction);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    left: 4,
                                    top: 0,
                                    bottom: 0,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: Images.instance
                                                .asset(name: "ic_search")),
                                        Padding(
                                          padding: EdgeInsets.only(left: 6),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SelectionModal extends StatefulWidget {
  @override
  _SelectionModalState createState() => _SelectionModalState();

  List? dataSource;
  final List? values;
  final bool? filterable;
  final bool? addedData;
  final Function? addedDataFunction;
  final String? textField;
  final String? subTextField;
  final String? valueField;
  final String? title;
  int? maxLength;
  final Color? buttonBarColor;
  final String? cancelButtonText;
  final IconData? cancelButtonIcon;
  final Color? cancelButtonColor;
  final Color? cancelButtonTextColor;
  final String? saveButtonText;
  final IconData? saveButtonIcon;
  final Color? saveButtonColor;
  final Color? saveButtonTextColor;
  final String? deleteButtonTooltipText;
  final IconData? deleteIcon;
  final Color? deleteIconColor;
  final Color? selectedOptionsBoxColor;
  final String? selectedOptionsInfoText;
  final Color? selectedOptionsInfoTextColor;
  final IconData? checkedIcon;
  final IconData? uncheckedIcon;
  final Color? checkBoxColor;
  final Color? searchBoxColor;
  final String? searchBoxHintText;
  final Color? searchBoxFillColor;
  final IconData? searchBoxIcon;
  final String? searchBoxToolTipText;
  SelectionModal(
      {this.filterable,
      this.addedData,
      this.addedDataFunction,
      this.dataSource,
      this.title = 'لطفا یک یا چند مورد را انتخاب نمائید.',
      this.values,
      this.textField,
      this.subTextField,
      this.valueField,
      this.maxLength,
      this.buttonBarColor,
      this.cancelButtonText,
      this.cancelButtonIcon,
      this.cancelButtonColor,
      this.cancelButtonTextColor,
      this.saveButtonText,
      this.saveButtonIcon,
      this.saveButtonColor,
      this.saveButtonTextColor,
      this.deleteButtonTooltipText,
      this.deleteIcon,
      this.deleteIconColor,
      this.selectedOptionsBoxColor,
      this.selectedOptionsInfoText,
      this.selectedOptionsInfoTextColor,
      this.checkedIcon,
      this.uncheckedIcon,
      this.checkBoxColor,
      this.searchBoxColor,
      this.searchBoxHintText,
      this.searchBoxFillColor,
      this.searchBoxIcon,
      this.searchBoxToolTipText})
      : super();
}

class _SelectionModalState extends State<SelectionModal> {
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  bool? _isSearching;

  List _localDataSourceWithState = [];
  List _searchresult = [];

  _SelectionModalState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
        });
      } else {
        setState(() {
          _isSearching = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.dataSource!.forEach((item) {
      var newItem = {
        'value': item[widget.valueField],
        'text': item[widget.textField],
        'subText': item[widget.subTextField],
        'checked': widget.values!.contains(item[widget.valueField])
      };
      _localDataSourceWithState.add(newItem);
    });

    _searchresult = List.from(_localDataSourceWithState);
    _isSearching = false;
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Container(),
      elevation: 0.0,
      title: Text(widget.title!, style: TextStyle(fontSize: 16.0, fontFamily: "IRANSans")),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.close,
            size: 26.0,
          ),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          widget.filterable! ? _buildSearchText() : new SizedBox(),
          Expanded(
            child: _optionsList(),
          ),
          _currentlySelectedOptions(),
          Container(
            color: widget.buttonBarColor ?? Colors.grey.shade600,
            child:
                ButtonBar(alignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.max, children: <Widget>[
              ButtonTheme(
                height: 50.0,
                child: RaisedButton.icon(
                  label: Text(
                    widget.cancelButtonText ?? 'لغو',
                    style: TextStyle(fontFamily: "IRANSans", fontSize: 14.0),
                  ),
                  icon: Icon(
                    widget.cancelButtonIcon ?? Icons.clear,
                    size: 20.0,
                  ),
                  color: widget.cancelButtonColor ?? Colors.grey.shade100,
                  textColor: widget.cancelButtonTextColor,
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                ),
              ),
              ButtonTheme(
                height: 50.0,
                child: RaisedButton.icon(
                  label: Text(
                    widget.saveButtonText ?? 'تائید',
                    style: TextStyle(fontFamily: "IRANSans", fontSize: 14.0),
                  ),
                  icon: Icon(
                    widget.saveButtonIcon ?? Icons.save,
                    size: 20.0,
                  ),
                  color: widget.saveButtonColor ?? Theme.of(context).primaryColor,
                  textColor: widget.saveButtonTextColor ?? Colors.white,
                  onPressed: _localDataSourceWithState.where((item) => item['checked']).length > widget.maxLength!
                      ? null
                      : () {
                          var selectedValuesObjectList =
                              _localDataSourceWithState.where((item) => item['checked']).toList();
                          var selectedValues = [];
                          selectedValuesObjectList.forEach((item) {
                            selectedValues.add(item['value']);
                          });
                          Navigator.pop(context, selectedValues);
                        },
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget _currentlySelectedOptions() {
    List<Widget> selectedOptions = [];

    var selectedValuesObjectList = _localDataSourceWithState.where((item) => item['checked']).toList();
    var selectedValues = [];
    selectedValuesObjectList.forEach((item) {
      selectedValues.add(item['value']);
    });
    selectedValues.forEach((item) {
      var existingItem = _localDataSourceWithState.singleWhere((itm) => itm['value'] == item, orElse: () => null);
      selectedOptions.add(Chip(
        label: new Container(
          constraints: new BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 80.0),
          child: Text(
            existingItem['text'],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: "IRANSans", fontSize: 14.0),
          ),
        ),
        deleteButtonTooltipMessage: widget.deleteButtonTooltipText ?? 'Tap to delete this item',
        deleteIcon: widget.deleteIcon as Widget? ?? Icon(Icons.cancel),
        deleteIconColor: widget.deleteIconColor ?? Colors.grey,
        onDeleted: () {
          existingItem['checked'] = false;
          setState(() {});
        },
      ));
    });
    return selectedOptions.length > 0
        ? Container(
            padding: EdgeInsets.all(10.0),
            color: widget.selectedOptionsBoxColor ?? Colors.grey.shade400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  widget.selectedOptionsInfoText ??
                      'انتخاب‌های شما ${selectedOptions.length} مورد (جهت حذف تاچ نمائید)', // use languageService here
                  style: TextStyle(
                      color: widget.selectedOptionsInfoTextColor ?? Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: "IRANSans",
                      fontSize: 14.0),
                ),
                ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 8,
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                          child: Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 0.4, // gap between lines
                        alignment: WrapAlignment.start,
                        children: selectedOptions,
                      )),
                    )),
              ],
            ),
          )
        : new Container();
  }

  ListView _optionsList() {
    List<Widget> options = [];
    _searchresult.forEach((item) {
      options.add(ListTile(
          title: item['subText'] != null && item['subText'].isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['text'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(fontFamily: "IRANSans", fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Text(
                      item['subText'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(fontFamily: "IRANSans", fontSize: 11.0),
                    ),
                  ],
                )
              : Text(
                  item['text'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(fontFamily: "IRANSans", fontSize: 14.0),
                ),
          leading: Transform.scale(
            child: Icon(
                item['checked']
                    ? widget.checkedIcon ?? Icons.check_box
                    : widget.uncheckedIcon ?? Icons.check_box_outline_blank,
                color: widget.checkBoxColor ?? Theme.of(context).primaryColor),
            scale: 1.5,
          ),
          onTap: () {
            item['checked'] = !item['checked'];
            setState(() {});
          }));
      options.add(new Divider(height: 1.0));
    });
    return ListView(children: options);
  }

  Widget _buildSearchText() {
    return Container(
      color: widget.searchBoxColor ?? Theme.of(context).primaryColor,
      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Container(
                  child: TextField(
                    controller: _controller,
                    keyboardAppearance: Brightness.light,
                    onChanged: searchOperation,
                    style: TextStyle(fontFamily: "IRANSans", fontSize: 14.0),
                    decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(12.0),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        filled: true,
                        hintText: widget.searchBoxHintText ?? "جستجو...",
                        hintStyle: TextStyle(fontFamily: "IRANSans", fontSize: 14.0),
                        suffix: SizedBox(
                            height: 25.0,
                            child: IconButton(
                              icon: widget.searchBoxIcon as Widget? ?? Icon(Icons.clear),
                              onPressed: () {
                                _controller.clear();
                                searchOperation('');
                              },
                              padding: EdgeInsets.all(0.0),
                              tooltip: widget.searchBoxToolTipText ?? 'پاک کردن',
                            ))),
                  ),
                ),
              ),
              Visibility(
                visible: widget.addedData! && _searchresult.isEmpty,
                child: Row(
                  children: [
                    SizedBox(
                      width: 8.0,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          if (_controller.text.trim().isNotEmpty) {
                            var newItem = {
                              'value': _controller.text.trim(),
                              'text': _controller.text.trim(),
                              'subText': "",
                              'checked': true
                            };
                            var newItem1 = {
                              'value': _controller.text.trim(),
                              'text': _controller.text.trim(),
                              'subText': "",
                            };
                            widget.addedDataFunction!(newItem);
                            setState(() {
                              _localDataSourceWithState.add(newItem);
                              searchOperation(_controller.text.trim());
                              widget.dataSource!.add(newItem1);
                              widget.maxLength = widget.dataSource!.length;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: globalKey,
      appBar: _buildAppBar(context) as PreferredSizeWidget?,
      body: _buildBody(context),
    );
  }

  void searchOperation(String searchText) {
    _searchresult.clear();
    if (_isSearching != null && searchText.toString().trim() != '') {
      for (int i = 0; i < _localDataSourceWithState.length; i++) {
        String data = '${_localDataSourceWithState[i]['text']}';
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          _searchresult.add(_localDataSourceWithState[i]);
        }
      }
    } else {
      _searchresult = List.from(_localDataSourceWithState);
    }
  }
}

import 'package:flutter/material.dart';

class VerticalStackDialog extends StatelessWidget {
  final String? title;
  final String? desc;
  final Widget? btnOk;
  final Widget? btnCancel;
  final Widget? header;
  final Widget? body;
  final bool? isDense;
  final AlignmentGeometry? aligment;
  final EdgeInsetsGeometry? padding;
  final bool? keyboardAware;
  final double? width;
  const VerticalStackDialog({
    Key? key,
    required this.title,
    required this.desc,
    this.btnOk,
    this.btnCancel,
    this.body,
    this.aligment,
    this.isDense,
    required this.header,
    this.padding,
    this.keyboardAware,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: aligment,
      padding: EdgeInsets.only(bottom: keyboardAware! ? MediaQuery.of(context).viewInsets.bottom : 0),
      child: Stack(
        children: <Widget>[
          Container(
            width: width ?? MediaQuery.of(context).size.width,
            padding: isDense!
                ? const EdgeInsets.only(top: 65.0, left: 15.0, right: 15.0, bottom: 10.0)
                : const EdgeInsets.only(top: 65.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 0.5,
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: padding!,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: header != null ? 50.0 : 15,
                      ),
                      body ??
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                title!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    desc!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      if (btnOk != null || btnCancel != null)
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              if (btnOk != null)
                                Expanded(
                                  child: btnOk ?? Container(),
                                ),
                              if (btnCancel != null && btnOk != null)
                                const SizedBox(
                                  width: 10,
                                ),
                              if (btnCancel != null)
                                Expanded(
                                  child: btnCancel ?? Container(),
                                ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (header != null)
            SizedBox(
              width: width ?? MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Theme.of(context).cardColor,
                    radius: 55.0,
                    child: header,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

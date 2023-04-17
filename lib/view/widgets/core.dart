import 'package:flutter/material.dart';

///if v is null,width's value must be 10
horizontalSpace({double? v}) => SizedBox(
      width: v ?? 10,
    );

///if v is null,height's value must be 10
verticalSpace({double? v}) => SizedBox(
      height: v ?? 10,
    );

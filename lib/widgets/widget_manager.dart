import 'package:flutter/material.dart';
import 'package:indihood/widgets/components/address_type.dart';
import 'package:indihood/widgets/components/image_type.dart';
import 'package:indihood/widgets/components/int_type.dart';
import 'package:indihood/widgets/components/loan_applicant_type.dart';
import 'package:indihood/widgets/components/loan_terms_type.dart';
import 'package:indihood/widgets/components/repayment_type.dart';
import 'package:indihood/widgets/components/string_type.dart';
import 'package:indihood/widgets/widget_type.dart';

import 'components/loan_type.dart';

Widget widgetManager(String title, Map<String, dynamic> schema, dynamic data) {
  switch (schema["type"]) {
    case WidgetType.stringType:
      return StringType(title, schema, data);
    case WidgetType.intType:
      return IntType(title, schema, data);
    case WidgetType.imageType:
      return ImageType(title, schema, data);
    case WidgetType.addressType:
      return AddressType(title, schema, data);
    case WidgetType.loanTermsType:
      return LoanTermsType(title, schema, data);
    case WidgetType.loanApplicantType:
      return LoanApplicantType(title, schema, data);
    case WidgetType.repaymentType:
      return RepaymentType(title, schema, data);
    case WidgetType.loanType:
      return LoanType(title, schema, data);
    default:
      return Container();
  }
}

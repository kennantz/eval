import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eval/models/models.dart';
import 'package:eval/services/services.dart';
import 'package:eval/ui/widget/CarCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:eval/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

part 'regis/signin_page.dart';
part 'regis/signup_page.dart';
part 'tabs/account_page.dart';
part 'tabs/menuPage.dart';
part 'tabs/paymentConfirmationPage.dart';
part 'tabs/listCarPage.dart';
part 'mainmenu.dart';

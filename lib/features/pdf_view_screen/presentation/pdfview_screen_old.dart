
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/local/shared_preferences_helper.dart';
import '../../../router/app_pages.dart';
import '../../estimation_screen/data/model/estimation_response_model.dart';
import '../../estimation_screen/presentation/bloc/estimation_bloc.dart';
import '../../legal_entity_screen/presentation/bloc/legal_entity_bloc.dart';

class PdfviewScreenOne extends StatefulWidget {
  final EstimationResponseModel estimationResponseModel;

  const PdfviewScreenOne({
    super.key,
    required this.estimationResponseModel
  });

  @override
  State<PdfviewScreenOne> createState() => _PdfviewScreenOneState();
}

class _PdfviewScreenOneState extends State<PdfviewScreenOne> {
  bool isDownloading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(didPop) {
          return;
        }
        // context.go(AppPages.ESTIMATION);
        context.go(AppPages.SEARCH_PRODUCT);
      },
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
            bottom: AppDimensions.getResponsiveHeight(context) * .08,
            right: AppDimensions.getResponsiveWidth(context) * .05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.small(
                backgroundColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
                elevation: 2,
                onPressed: ()async {
                  if(isDownloading == false){
                    // setState(() {
                    //   // isDownloading = true;
                    // });
                    if (Platform.isAndroid){
                      // if(await _requestPermission(Permission.storage)){
                      //downloadUrl("${widget.estimationResponseModel.url}",);
                      await downloadFile("${widget.estimationResponseModel.url}");
                      /*FileDownloader.downloadFile(
                          url: "${widget.estimationResponseModel.url}",
                          name: "${widget.estimationResponseModel.data!.estimationEntry!.estnumber}.pdf",
                          downloadDestination: DownloadDestinations.appFiles,
                          notificationType: NotificationType.all,
                          onProgress: (fileName, progress) {
                            setState(() {
                              isDownloading = true;
                            });
                            debugPrint("===Progress===$progress");
                          },
                          onDownloadCompleted: (path) {
                            setState(() {
                              isDownloading = false;
                            });
                            //final File file = File(path);
                            //This will be the path of the downloaded file
                            ScaffoldMessenger.of(navigatorKey.currentContext!)
                                .hideCurrentSnackBar();
                            Fluttertoast.showToast(
                                msg: "Download complete",
                                backgroundColor: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                                toastLength: Toast.LENGTH_LONG);
                          });*/
                      // }
                    }
                  }
                },
                child: isDownloading?
                    Center(child: SizedBox(
                        height: 20,width: 20,
                        child: CircularProgressIndicator(color: Colors.white,)),)
                    :Icon(Icons.download,color: Colors.white,),
              ),
              /*FloatingActionButton.small(
                backgroundColor: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                elevation: 2,
                onPressed: () {
                  context.read<EstimationBloc>().add(LogoutEvent());
                  context.read<LegalEntityBloc>().add(ClearStateEvent());
                  context.go(
                    AppPages.ESTIMATION,
                  );
                },
                child: Icon(Icons.home,color: Colors.white,),
              ),*/
            ],
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        appBar: AppBar(
          backgroundColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
          leading: BackButton(
            color: Colors.white,
            // onPressed: () => context.go(AppPages.ESTIMATION),
            onPressed: () => context.go(AppPages.SEARCH_PRODUCT),
          ),
          actions: [
            /*GestureDetector(
              onTap: () {
                context.read<EstimationBloc>().add(LogoutEvent());
                context.read<LegalEntityBloc>().add(ClearStateEvent());
                Future.delayed(Duration(milliseconds: 500),() {
                  if (mounted) {
                    context.go(
                      // AppPages.LOGIN,
                      AppPages.STORE_LIST,
                    );
                  }
                });
                *//*SharedPreferencesHelper.clear().then(
                      (value) {
                    if (mounted) {
                      context.go(
                        // AppPages.LOGIN,
                        AppPages.STORE_LIST,
                      );
                    }
                  },
                );*//*
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                decoration: BoxDecoration(
                  color: AppColors.LOGO_BACKGROUND_BLUE_COLOR,
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 24,width: 24,
                child: SvgPicture.asset("assets/images/logout.svg"),
              ),
            ),*/

            GestureDetector(
              onTap: () {
                context.read<EstimationBloc>().add(LogoutEvent());
                context.read<LegalEntityBloc>().add(ClearStateEvent());
                Future.delayed(Duration(milliseconds: 500),() {
                  if (mounted) {
                    context.go(
                      // AppPages.LOGIN,
                      AppPages.STORE_LIST,
                    );
                  }
                });
                /*context.go(
                  // AppPages.ESTIMATION,
                  AppPages.SEARCH_PRODUCT,
                );*/
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                decoration: BoxDecoration(
                  color: AppColors.LOGO_BACKGROUND_RED_COLOR,
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 24,width: 24,
                child: Icon(Icons.home,color: Colors.white,),
              ),
            )
          ],
          centerTitle: true,
          title: const Text(
            "Print Layout",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        body:
        SafeArea(
          child:Column(
            children: [
              Expanded(
                child: SfPdfViewer.network(
                  canShowPageLoadingIndicator: true,
                  '${widget.estimationResponseModel.url}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> downloadFile(String url) async {
    debugPrint("URL-->$url");
    try {
      // Define the base Downloads directory
      const String baseDownloadsPath = '/storage/emulated/0/Download';

      // Create a subfolder named PDF_INVOICE
      /*final String customFolderPath = '$baseDownloadsPath/PDF_INVOICE';
      final Directory customFolder = Directory(customFolderPath);

      // Check if the directory exists; if not, create it
      if (!customFolder.existsSync()) {
        customFolder.createSync(recursive: true);
        print('Created folder: $customFolderPath');
      }*/

      // Set the file path
      final String fileName = url.split('/').last;
      final String savePath = '$baseDownloadsPath/$fileName';

      // Create an HttpClient instance
      final HttpClient httpClient = HttpClient();
      final HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      final HttpClientResponse response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        final File file = File(savePath);
        final IOSink sink = file.openWrite();
        final int contentLength = response.contentLength;

        int downloadedLength = 0;

        response.listen(
              (data) {
            sink.add(data);
            downloadedLength += data.length;
            setState(() {
              isDownloading = true;
            });
            // Update progress in notification
            final int progress = ((downloadedLength / contentLength) * 100).toInt();
            //showProgressNotification(progress);
          },
          onDone: () async {
            await sink.close();
            setState(() {
              isDownloading = false;
            });
            Fluttertoast.showToast(
                msg: "Download complete",
                backgroundColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
                toastLength: Toast.LENGTH_LONG);
            //nmbawait showCompletionNotification(savePath);
            httpClient.close();
            print('Download complete: $savePath');
          },
          onError: (error) {
            print('Download failed: $error');
            sink.close();
          },
          cancelOnError: true,
        );
      } else {
        print('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }


/*  Future<Uint8List> _createPdf(PdfPageFormat format, Size size) async {
    final pdf = pw.Document(
      version: PdfVersion.pdf_1_4,
      compress: true,
    );

    // Assuming 4 items fit on a page; adjust based on your layout
    int itemsPerPage = widget.estimationResponseModel.data!.estimateDetails!.length;//6
    final List items = widget.estimationResponseModel.data!.estimateDetails!;
    final int totalPages = (items.length / itemsPerPage).ceil();

    for (int pageIndex = 0; pageIndex < totalPages; pageIndex++) {
      final pageItems = items.skip(pageIndex * itemsPerPage).take(itemsPerPage);

      pdf.addPage(
        pw.Page(
          // pageFormat: format,
          pageFormat: PdfPageFormat(
              size.width, size.height * .9, //(80 * (72.0 / 25.4)) // * 0.98
              marginAll: 5),
          build: (context) {
            return pw.SizedBox(
              width: size.width,
              height: size.height,
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        "Store: ${widget.estimationResponseModel.data!.estimationEntry!.warehouse}",
                        style: pw.TextStyle(fontSize: 14),
                      ),
                      pw.Text(
                        "Date: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
                        style: pw.TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 8,top: 8,bottom: 1),
                    child: pw.Text(
                      textAlign: pw.TextAlign.start,
                      "Store: ${widget.estimationResponseModel.data!.estimationEntry!.warehouse}",
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.normal,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 8,top: 1,bottom: 12),
                    child: pw.Text(
                      textAlign: pw.TextAlign.start,
                      "Mobile No: ${widget.estimationResponseModel.data!.estimationEntry!.mobileno}",
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.normal,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  pw.Column(
                    children: [
                      pw.Text(
                        "* SALES ADVICE *",
                        style: pw.TextStyle(
                          fontSize: 24,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        ),
                      ),
                      pw.Container(
                        width: size.width,
                        height: 0.5,
                        margin: pw.EdgeInsets.symmetric(vertical: size.height * 0.005),
                        color: PdfColors.grey,
                      ),
                      pw.Text(
                        "${widget.estimationResponseModel.data!.estimationEntry!.estnumber}",
                        // "00013",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        ),
                      ),
                      pw.Container(
                        margin: pw.EdgeInsets.symmetric(vertical: size.height * 0.01),
                        child: pw.BarcodeWidget(
                          barcode: pw.Barcode.code39(),
                          data:
                          "${widget.estimationResponseModel.data!.estimationEntry!.estnumber}",
                          // No need to add '*'
                          width: size.width * 0.9,
                          height: size.height * 0.08,
                          drawText: false, // Hides text
                        ),
                      ),
                    ]
                  ),
                  // pw.Spacer(),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: pageItems.map((item) {
                      return _buildProductContainer(size, items.indexOf(item));
                    }).toList(),
                  ),
                  pw.Spacer(),
                  pw.Text(
                    "Page ${pageIndex + 1} of $totalPages",
                    style: pw.TextStyle(fontSize: 10, color: PdfColors.grey),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    return pdf.save();
  }*/

/*  Future<Uint8List> _createPdf(PdfPageFormat format, Size size) async {



    final pdf = pw.Document(
      version: PdfVersion.pdf_1_4,
      compress: true,
    );
    // final imageData = await _loadAssetImage("assets/images/icon.png");
    // final pdfImage = pw.MemoryImage(imageData);
    pdf.addPage(
      pw.Page(
        // pageFormat: PdfPageFormat.a4,
        // orientation: pw.PageOrientation.portrait,
        pageFormat: PdfPageFormat(
            size.width, size.height * .9, //(80 * (72.0 / 25.4)) // * 0.98
            marginAll: 5), // * (72.0 / 25.4)
        //pageFormat: format,
        build: (context) {
          return pw.SizedBox(
            width: size.width, //double.infinity,
            height: size.height,
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // pw.Spacer(),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          margin: pw.EdgeInsets.only(left: 8,top: 8,bottom: 1),
                          child: pw.Text(
                            textAlign: pw.TextAlign.start,
                            "Store: ${widget.estimationResponseModel.data!.estimationEntry!.warehouse}",
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.normal,
                              color: PdfColors.black,
                            ),
                          ),
                        ),
                        pw.Container(
                          margin: pw.EdgeInsets.only(left: 8,top: 1,bottom: 12),
                          child: pw.Text(
                            textAlign: pw.TextAlign.start,
                            "Mobile No: ${widget.estimationResponseModel.data!.estimationEntry!.mobileno}",
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.normal,
                              color: PdfColors.black,
                            ),
                          ),
                        ),
                      ]
                    ),
                    pw.Container(
                      margin: pw.EdgeInsets.only(right: 8,top: 8,bottom: 8),
                      child: pw.Text(
                        "Date: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        ),
                      ),
                    ),
                  ]
                ),

                pw.Text(
                  "* SALES ADVICE *",
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.normal,
                    color: PdfColors.black,
                  ),
                ),
                pw.Container(
                  width: size.width,
                  height: 0.5,
                  margin: pw.EdgeInsets.symmetric(vertical: size.height * 0.005),
                  color: PdfColors.grey,
                ),
                pw.Text(
                  "${widget.estimationResponseModel.data!.estimationEntry!.estnumber}",
                  // "00013",
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black,
                  ),
                ),
                pw.Container(
                  margin: pw.EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: pw.BarcodeWidget(
                    barcode: pw.Barcode.code39(),
                    data:
                        "${widget.estimationResponseModel.data!.estimationEntry!.estnumber}",
                    // No need to add '*'
                    width: size.width * 0.9,
                    height: size.height * 0.08,
                    drawText: false, // Hides text
                  ),
                ),
                pw.Container(
                  width: size.width,
                  margin: pw.EdgeInsets.only(
                    top: size.height * 0.02,
                    bottom: size.height * 0.01,
                  ),
                  child: pw.Column(
                    children: List.generate(
                      widget.estimationResponseModel.data!.estimateDetails!.length,
                      (index) {
                        return pw.Container(
                          width: size.width,
                          // margin: const pw.EdgeInsets.symmetric(vertical: 3),
                          child: _buildProductContainer(size, index),
                        );
                      },
                    ),
                  ),
                ),
                pw.Spacer(),
                pw.Text(
                  widget.estimationResponseModel.data!.estimateDetails![0].estimateProductDetails!.eMPLNAME!,
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Container(
                  width: size.width,
                  height: 0.5,
                  margin: pw.EdgeInsets.symmetric(vertical: size.height * 0.005),
                  color: PdfColors.grey,
                ),
                pw.Container(
                  // margin: pw.EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: pw.Text(
                    textAlign: pw.TextAlign.center,
                    "Price valid for a week.",
                    style: pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Container(
                  height: 6
                )
              ],
            ),
          );
        },
      ),
    );
    return pdf.save();
  }

  pw.Widget _buildProductContainer(Size size, int index) {
    double totalDiamondQtyValue = 0.0;
    double totalStoneQtyValue = 0.0;

    for(var ingredients in widget.estimationResponseModel
        .data!.estimateDetails![index].estimationSubDetails!){

      if(ingredients.productIndicator!.toLowerCase()=="diamond"){
        totalDiamondQtyValue += double.parse(ingredients.qty!);
      }
      if(ingredients.productIndicator!.toLowerCase()=="stone"){
        totalStoneQtyValue += double.parse(ingredients.qty!);
      }
    }



    return pw.Column(
      children: [
        pw.Text(
          "${widget.estimationResponseModel
              .data!.estimateDetails![index]
              .estimateProductDetails!.prodCode}",
          style: pw.TextStyle(
            fontSize: 16,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Container(
          width: size.width,
          height: 0.5,
          margin: pw.EdgeInsets.symmetric(vertical: size.height * 0.005),
          color: PdfColors.grey,
        ),
        pw.Text(
          // widget.estimationResponseModel.data!.estimateDetails![index].estimateProductDetails!.prodCode!,
          widget.estimationResponseModel.data!.estimateDetails![index].estimateProductDetails!.productName!,
          style: pw.TextStyle(
            fontSize: 16,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Container(
          width: size.width,
          height: 0.5,
          margin: pw.EdgeInsets.symmetric(vertical: size.height * 0.005),
          color: PdfColors.grey,
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
          children: [
            pw.Expanded(
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Design",
                      style: pw.TextStyle(
                        fontSize: 12.5,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Container(
                      // width: 22,
                      height: 0.5,
                      margin: pw.EdgeInsets.symmetric(
                          horizontal: size.height * 0.002),
                      color: PdfColors.grey,
                    ),
                    pw.Text(
                      textAlign: pw.TextAlign.center,
                        widget.estimationResponseModel.data!.estimateDetails![0].estimateProductDetails!.DesignCode!,
                        style: const pw.TextStyle(
                            fontSize: 12.5, color: PdfColors.black,),),
                  ]),
            ),
            pw.Expanded(
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "GrWt",
                      style: pw.TextStyle(
                        fontSize: 12.5,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Container(
                      // width: 22,
                      height: 0.5,
                      margin: pw.EdgeInsets.symmetric(
                          horizontal: size.height * 0.002),
                      color: PdfColors.grey,
                    ),
                    pw.Text(
                        "${widget.estimationResponseModel
                            .data!.estimateDetails![index]
                            .estimateProductDetails!.qty}",
                        style: const pw.TextStyle(
                            fontSize: 12.5, color: PdfColors.black)),
                  ]),
            ),
            pw.Expanded(
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "NetWt",
                      style: pw.TextStyle(
                        fontSize: 12.5,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Container(
                      // width: 22,
                      height: 0.5,
                      margin: pw.EdgeInsets.symmetric(
                          horizontal: size.height * 0.002),
                      color: PdfColors.grey,
                    ),
                    pw.Text(
                      "${widget.estimationResponseModel
                            .data!.estimateDetails![index].estimateProductDetails!.nett}",

                        style: const pw.TextStyle(
                            fontSize: 12.5, color: PdfColors.black)),
                  ]),
            ),
            pw.Expanded(
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "DiaWt",
                      style: pw.TextStyle(
                        fontSize: 12.5,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Container(
                      // width: 22,
                      height: 0.5,
                      margin: pw.EdgeInsets.symmetric(
                          horizontal: size.height * 0.002),
                      color: PdfColors.grey,
                    ),
                    pw.Text(
                        */
/*"${widget.estimationResponseModel
                            .data!.estimateDetails![index].estimationSubDetails![index].productIndicator!.toLowerCase()=="diamond"?
                        widget.estimationResponseModel
                            .data!.estimateDetails![index]
                            .estimateProductDetails!.qty:0}",*/
/*
                    totalDiamondQtyValue.toStringAsFixed(3),
                        style: const pw.TextStyle(
                            fontSize: 12.5, color: PdfColors.black)),
                  ]),
            ),
            pw.Expanded(
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "ClSWt",
                      style: pw.TextStyle(
                        fontSize: 12.5,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Container(
                      // width: 22,
                      height: 0.5,
                      margin: pw.EdgeInsets.symmetric(
                          horizontal: size.height * 0.002),
                      color: PdfColors.grey,
                    ),
                    pw.Text(
                      */
/*"${widget.estimationResponseModel
                            .data!.estimateDetails![index].estimationSubDetails![index].productIndicator!.toLowerCase()=="diamond"?
                        widget.estimationResponseModel
                            .data!.estimateDetails![index]
                            .estimateProductDetails!.qty:0}",*/
/*
                        totalStoneQtyValue.toStringAsFixed(3),
                        style: const pw.TextStyle(
                            fontSize: 12.5, color: PdfColors.black)),
                  ]),
            ),
            pw.Expanded(
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Value",
                      style: pw.TextStyle(
                        fontSize: 12.5,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Container(
                      //width: 22,
                      height: 0.5,
                      margin: pw.EdgeInsets.symmetric(
                          horizontal: size.height * 0.002),
                      color: PdfColors.grey,
                    ),
                    pw.Text(
                        "${widget.estimationResponseModel
                            .data!.estimateDetails![index]
                            .estimateProductDetails!.lineamount}",
                        style: const pw.TextStyle(
                            fontSize: 12.5, color: PdfColors.black)),
                  ]),
            ),
          ],
        ),
        pw.Container(
          width: size.width,
          height: 0.5,
          margin: pw.EdgeInsets.symmetric(vertical: size.height * 0.008),
          color: PdfColors.grey,
        ),
      ],
    );
  }
}*/
}

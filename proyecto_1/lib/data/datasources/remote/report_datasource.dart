import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:loggy/loggy.dart';
import 'package:proyecto_1/data/datasources/remote/i_report_datasource.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:hive/hive.dart';

class ReportDataSource implements IReportDataSource {
  final http.Client httpClient;
  final String apiKey = 'i8sNE4';
  final Box<ReporteHive> reportesBox;

  ReportDataSource({http.Client? client})
      : httpClient = client ?? http.Client(),
        reportesBox = Hive.box<ReporteHive>('reportes');

  @override
  Future<List<Reporte>> getReports() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Return reports from local storage
      return reportesBox.values.map((e) => e.toReporte()).toList();
    } else {
      // Fetch reports from the server
      var request = Uri.parse("https://retoolapi.dev/$apiKey/data")
          .resolveUri(Uri(queryParameters: {"format": 'json'}));
      var response = await httpClient.get(request);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        List<Reporte> users =
            List<Reporte>.from(data.skip(1).map((x) => Reporte.fromJson(x)));

        // Save reports to local storage
        for (var report in users) {
          reportesBox.put(report.id, ReporteHive.fromReporte(report));
        }

        return users;
      } else {
        logError("Got error code ${response.statusCode}");
        return Future.error('Error code ${response.statusCode}');
      }
    }
  }

  @override
  Future<bool> addReport(Reporte rep) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.none) {
      // Save report locally
      print("jaja");
      await reportesBox.add(ReporteHive.fromReporte(rep));
      return Future.value(true);
    } else {
      print("Buena");
      // Add report to the server
      final response = await httpClient.post(
        Uri.parse("https://retoolapi.dev/$apiKey/data"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(rep.toJson()),
      );

      if (response.statusCode == 201) {
        // Save report to local storage
        rep.id = jsonDecode(response.body)["id"];
        await reportesBox.put(rep.id, ReporteHive.fromReporte(rep));
        return Future.value(true);
      } else {
        logError("Got error code ${response.statusCode}");
        return Future.value(false);
      }
    }
  }

  @override
  Future<bool> updateReport(Reporte rep) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Update report locally
      await reportesBox.put(rep.id, ReporteHive.fromReporte(rep));
      return Future.value(true);
    } else {
      // Update report on the server
      final response = await httpClient.put(
        Uri.parse("https://retoolapi.dev/$apiKey/data/${rep.id}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(rep.toJson()),
      );

      if (response.statusCode == 200) {
        // Update report in local storage
        await reportesBox.put(rep.id, ReporteHive.fromReporte(rep));
        return Future.value(true);
      } else {
        logError("Got error code ${response.statusCode}");
        return Future.value(false);
      }
    }
  }

  @override
  Future<bool> deleteReport(int id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Delete report locally
      await reportesBox.delete(id);
      return Future.value(true);
    } else {
      // Delete report from the server
      final response = await httpClient.delete(
        Uri.parse("https://retoolapi.dev/$apiKey/data/$id"),
      );

      if (response.statusCode == 200) {
        // Delete report from local storage
        await reportesBox.delete(id);
        return Future.value(true);
      } else {
        logError("Got error code ${response.statusCode}");
        return Future.value(false);
      }
    }
  }

  Future<void> syncOfflineData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      for (var reportHive in reportesBox.values) {
        Reporte report = reportHive.toReporte();
        if (report.id == null) {
          // Add report to the server
          await addReport(report);
        } else {
          // Update report on the server
          await updateReport(report);
        }
      }
    }
  }
}

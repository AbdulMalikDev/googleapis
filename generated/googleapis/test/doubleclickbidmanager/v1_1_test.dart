library googleapis.doubleclickbidmanager.v1_1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/doubleclickbidmanager/v1_1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request
          .finalize()
          .transform(convert.utf8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.json.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(core.int status,
    core.Map<core.String, core.String> headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.utf8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

buildUnnamed3813() {
  var o = new core.List<api.Rule>();
  o.add(buildRule());
  o.add(buildRule());
  return o;
}

checkUnnamed3813(core.List<api.Rule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRule(o[0]);
  checkRule(o[1]);
}

core.int buildCounterChannelGrouping = 0;
buildChannelGrouping() {
  var o = new api.ChannelGrouping();
  buildCounterChannelGrouping++;
  if (buildCounterChannelGrouping < 3) {
    o.fallbackName = "foo";
    o.name = "foo";
    o.rules = buildUnnamed3813();
  }
  buildCounterChannelGrouping--;
  return o;
}

checkChannelGrouping(api.ChannelGrouping o) {
  buildCounterChannelGrouping++;
  if (buildCounterChannelGrouping < 3) {
    unittest.expect(o.fallbackName, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3813(o.rules);
  }
  buildCounterChannelGrouping--;
}

buildUnnamed3814() {
  var o = new core.List<api.EventFilter>();
  o.add(buildEventFilter());
  o.add(buildEventFilter());
  return o;
}

checkUnnamed3814(core.List<api.EventFilter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEventFilter(o[0]);
  checkEventFilter(o[1]);
}

core.int buildCounterDisjunctiveMatchStatement = 0;
buildDisjunctiveMatchStatement() {
  var o = new api.DisjunctiveMatchStatement();
  buildCounterDisjunctiveMatchStatement++;
  if (buildCounterDisjunctiveMatchStatement < 3) {
    o.eventFilters = buildUnnamed3814();
  }
  buildCounterDisjunctiveMatchStatement--;
  return o;
}

checkDisjunctiveMatchStatement(api.DisjunctiveMatchStatement o) {
  buildCounterDisjunctiveMatchStatement++;
  if (buildCounterDisjunctiveMatchStatement < 3) {
    checkUnnamed3814(o.eventFilters);
  }
  buildCounterDisjunctiveMatchStatement--;
}

buildUnnamed3815() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3815(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDownloadLineItemsRequest = 0;
buildDownloadLineItemsRequest() {
  var o = new api.DownloadLineItemsRequest();
  buildCounterDownloadLineItemsRequest++;
  if (buildCounterDownloadLineItemsRequest < 3) {
    o.fileSpec = "foo";
    o.filterIds = buildUnnamed3815();
    o.filterType = "foo";
    o.format = "foo";
  }
  buildCounterDownloadLineItemsRequest--;
  return o;
}

checkDownloadLineItemsRequest(api.DownloadLineItemsRequest o) {
  buildCounterDownloadLineItemsRequest++;
  if (buildCounterDownloadLineItemsRequest < 3) {
    unittest.expect(o.fileSpec, unittest.equals('foo'));
    checkUnnamed3815(o.filterIds);
    unittest.expect(o.filterType, unittest.equals('foo'));
    unittest.expect(o.format, unittest.equals('foo'));
  }
  buildCounterDownloadLineItemsRequest--;
}

core.int buildCounterDownloadLineItemsResponse = 0;
buildDownloadLineItemsResponse() {
  var o = new api.DownloadLineItemsResponse();
  buildCounterDownloadLineItemsResponse++;
  if (buildCounterDownloadLineItemsResponse < 3) {
    o.lineItems = "foo";
  }
  buildCounterDownloadLineItemsResponse--;
  return o;
}

checkDownloadLineItemsResponse(api.DownloadLineItemsResponse o) {
  buildCounterDownloadLineItemsResponse++;
  if (buildCounterDownloadLineItemsResponse < 3) {
    unittest.expect(o.lineItems, unittest.equals('foo'));
  }
  buildCounterDownloadLineItemsResponse--;
}

buildUnnamed3816() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3816(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3817() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3817(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDownloadRequest = 0;
buildDownloadRequest() {
  var o = new api.DownloadRequest();
  buildCounterDownloadRequest++;
  if (buildCounterDownloadRequest < 3) {
    o.fileTypes = buildUnnamed3816();
    o.filterIds = buildUnnamed3817();
    o.filterType = "foo";
    o.version = "foo";
  }
  buildCounterDownloadRequest--;
  return o;
}

checkDownloadRequest(api.DownloadRequest o) {
  buildCounterDownloadRequest++;
  if (buildCounterDownloadRequest < 3) {
    checkUnnamed3816(o.fileTypes);
    checkUnnamed3817(o.filterIds);
    unittest.expect(o.filterType, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals('foo'));
  }
  buildCounterDownloadRequest--;
}

core.int buildCounterDownloadResponse = 0;
buildDownloadResponse() {
  var o = new api.DownloadResponse();
  buildCounterDownloadResponse++;
  if (buildCounterDownloadResponse < 3) {
    o.adGroups = "foo";
    o.ads = "foo";
    o.campaigns = "foo";
    o.insertionOrders = "foo";
    o.inventorySources = "foo";
    o.lineItems = "foo";
  }
  buildCounterDownloadResponse--;
  return o;
}

checkDownloadResponse(api.DownloadResponse o) {
  buildCounterDownloadResponse++;
  if (buildCounterDownloadResponse < 3) {
    unittest.expect(o.adGroups, unittest.equals('foo'));
    unittest.expect(o.ads, unittest.equals('foo'));
    unittest.expect(o.campaigns, unittest.equals('foo'));
    unittest.expect(o.insertionOrders, unittest.equals('foo'));
    unittest.expect(o.inventorySources, unittest.equals('foo'));
    unittest.expect(o.lineItems, unittest.equals('foo'));
  }
  buildCounterDownloadResponse--;
}

core.int buildCounterEventFilter = 0;
buildEventFilter() {
  var o = new api.EventFilter();
  buildCounterEventFilter++;
  if (buildCounterEventFilter < 3) {
    o.dimensionFilter = buildPathQueryOptionsFilter();
  }
  buildCounterEventFilter--;
  return o;
}

checkEventFilter(api.EventFilter o) {
  buildCounterEventFilter++;
  if (buildCounterEventFilter < 3) {
    checkPathQueryOptionsFilter(o.dimensionFilter);
  }
  buildCounterEventFilter--;
}

core.int buildCounterFilterPair = 0;
buildFilterPair() {
  var o = new api.FilterPair();
  buildCounterFilterPair++;
  if (buildCounterFilterPair < 3) {
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterFilterPair--;
  return o;
}

checkFilterPair(api.FilterPair o) {
  buildCounterFilterPair++;
  if (buildCounterFilterPair < 3) {
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterFilterPair--;
}

buildUnnamed3818() {
  var o = new core.List<api.Query>();
  o.add(buildQuery());
  o.add(buildQuery());
  return o;
}

checkUnnamed3818(core.List<api.Query> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQuery(o[0]);
  checkQuery(o[1]);
}

core.int buildCounterListQueriesResponse = 0;
buildListQueriesResponse() {
  var o = new api.ListQueriesResponse();
  buildCounterListQueriesResponse++;
  if (buildCounterListQueriesResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.queries = buildUnnamed3818();
  }
  buildCounterListQueriesResponse--;
  return o;
}

checkListQueriesResponse(api.ListQueriesResponse o) {
  buildCounterListQueriesResponse++;
  if (buildCounterListQueriesResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3818(o.queries);
  }
  buildCounterListQueriesResponse--;
}

buildUnnamed3819() {
  var o = new core.List<api.Report>();
  o.add(buildReport());
  o.add(buildReport());
  return o;
}

checkUnnamed3819(core.List<api.Report> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReport(o[0]);
  checkReport(o[1]);
}

core.int buildCounterListReportsResponse = 0;
buildListReportsResponse() {
  var o = new api.ListReportsResponse();
  buildCounterListReportsResponse++;
  if (buildCounterListReportsResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.reports = buildUnnamed3819();
  }
  buildCounterListReportsResponse--;
  return o;
}

checkListReportsResponse(api.ListReportsResponse o) {
  buildCounterListReportsResponse++;
  if (buildCounterListReportsResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3819(o.reports);
  }
  buildCounterListReportsResponse--;
}

core.int buildCounterOptions = 0;
buildOptions() {
  var o = new api.Options();
  buildCounterOptions++;
  if (buildCounterOptions < 3) {
    o.includeOnlyTargetedUserLists = true;
    o.pathQueryOptions = buildPathQueryOptions();
  }
  buildCounterOptions--;
  return o;
}

checkOptions(api.Options o) {
  buildCounterOptions++;
  if (buildCounterOptions < 3) {
    unittest.expect(o.includeOnlyTargetedUserLists, unittest.isTrue);
    checkPathQueryOptions(o.pathQueryOptions);
  }
  buildCounterOptions--;
}

buildUnnamed3820() {
  var o = new core.List<api.FilterPair>();
  o.add(buildFilterPair());
  o.add(buildFilterPair());
  return o;
}

checkUnnamed3820(core.List<api.FilterPair> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFilterPair(o[0]);
  checkFilterPair(o[1]);
}

buildUnnamed3821() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3821(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3822() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3822(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterParameters = 0;
buildParameters() {
  var o = new api.Parameters();
  buildCounterParameters++;
  if (buildCounterParameters < 3) {
    o.filters = buildUnnamed3820();
    o.groupBys = buildUnnamed3821();
    o.includeInviteData = true;
    o.metrics = buildUnnamed3822();
    o.options = buildOptions();
    o.type = "foo";
  }
  buildCounterParameters--;
  return o;
}

checkParameters(api.Parameters o) {
  buildCounterParameters++;
  if (buildCounterParameters < 3) {
    checkUnnamed3820(o.filters);
    checkUnnamed3821(o.groupBys);
    unittest.expect(o.includeInviteData, unittest.isTrue);
    checkUnnamed3822(o.metrics);
    checkOptions(o.options);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterParameters--;
}

buildUnnamed3823() {
  var o = new core.List<api.EventFilter>();
  o.add(buildEventFilter());
  o.add(buildEventFilter());
  return o;
}

checkUnnamed3823(core.List<api.EventFilter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEventFilter(o[0]);
  checkEventFilter(o[1]);
}

core.int buildCounterPathFilter = 0;
buildPathFilter() {
  var o = new api.PathFilter();
  buildCounterPathFilter++;
  if (buildCounterPathFilter < 3) {
    o.eventFilters = buildUnnamed3823();
    o.pathMatchPosition = "foo";
  }
  buildCounterPathFilter--;
  return o;
}

checkPathFilter(api.PathFilter o) {
  buildCounterPathFilter++;
  if (buildCounterPathFilter < 3) {
    checkUnnamed3823(o.eventFilters);
    unittest.expect(o.pathMatchPosition, unittest.equals('foo'));
  }
  buildCounterPathFilter--;
}

buildUnnamed3824() {
  var o = new core.List<api.PathFilter>();
  o.add(buildPathFilter());
  o.add(buildPathFilter());
  return o;
}

checkUnnamed3824(core.List<api.PathFilter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPathFilter(o[0]);
  checkPathFilter(o[1]);
}

core.int buildCounterPathQueryOptions = 0;
buildPathQueryOptions() {
  var o = new api.PathQueryOptions();
  buildCounterPathQueryOptions++;
  if (buildCounterPathQueryOptions < 3) {
    o.channelGrouping = buildChannelGrouping();
    o.pathFilters = buildUnnamed3824();
  }
  buildCounterPathQueryOptions--;
  return o;
}

checkPathQueryOptions(api.PathQueryOptions o) {
  buildCounterPathQueryOptions++;
  if (buildCounterPathQueryOptions < 3) {
    checkChannelGrouping(o.channelGrouping);
    checkUnnamed3824(o.pathFilters);
  }
  buildCounterPathQueryOptions--;
}

buildUnnamed3825() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3825(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterPathQueryOptionsFilter = 0;
buildPathQueryOptionsFilter() {
  var o = new api.PathQueryOptionsFilter();
  buildCounterPathQueryOptionsFilter++;
  if (buildCounterPathQueryOptionsFilter < 3) {
    o.filter = "foo";
    o.match = "foo";
    o.values = buildUnnamed3825();
  }
  buildCounterPathQueryOptionsFilter--;
  return o;
}

checkPathQueryOptionsFilter(api.PathQueryOptionsFilter o) {
  buildCounterPathQueryOptionsFilter++;
  if (buildCounterPathQueryOptionsFilter < 3) {
    unittest.expect(o.filter, unittest.equals('foo'));
    unittest.expect(o.match, unittest.equals('foo'));
    checkUnnamed3825(o.values);
  }
  buildCounterPathQueryOptionsFilter--;
}

core.int buildCounterQuery = 0;
buildQuery() {
  var o = new api.Query();
  buildCounterQuery++;
  if (buildCounterQuery < 3) {
    o.kind = "foo";
    o.metadata = buildQueryMetadata();
    o.params = buildParameters();
    o.queryId = "foo";
    o.reportDataEndTimeMs = "foo";
    o.reportDataStartTimeMs = "foo";
    o.schedule = buildQuerySchedule();
    o.timezoneCode = "foo";
  }
  buildCounterQuery--;
  return o;
}

checkQuery(api.Query o) {
  buildCounterQuery++;
  if (buildCounterQuery < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkQueryMetadata(o.metadata);
    checkParameters(o.params);
    unittest.expect(o.queryId, unittest.equals('foo'));
    unittest.expect(o.reportDataEndTimeMs, unittest.equals('foo'));
    unittest.expect(o.reportDataStartTimeMs, unittest.equals('foo'));
    checkQuerySchedule(o.schedule);
    unittest.expect(o.timezoneCode, unittest.equals('foo'));
  }
  buildCounterQuery--;
}

buildUnnamed3826() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3826(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterQueryMetadata = 0;
buildQueryMetadata() {
  var o = new api.QueryMetadata();
  buildCounterQueryMetadata++;
  if (buildCounterQueryMetadata < 3) {
    o.dataRange = "foo";
    o.format = "foo";
    o.googleCloudStoragePathForLatestReport = "foo";
    o.googleDrivePathForLatestReport = "foo";
    o.latestReportRunTimeMs = "foo";
    o.locale = "foo";
    o.reportCount = 42;
    o.running = true;
    o.sendNotification = true;
    o.shareEmailAddress = buildUnnamed3826();
    o.title = "foo";
  }
  buildCounterQueryMetadata--;
  return o;
}

checkQueryMetadata(api.QueryMetadata o) {
  buildCounterQueryMetadata++;
  if (buildCounterQueryMetadata < 3) {
    unittest.expect(o.dataRange, unittest.equals('foo'));
    unittest.expect(o.format, unittest.equals('foo'));
    unittest.expect(
        o.googleCloudStoragePathForLatestReport, unittest.equals('foo'));
    unittest.expect(o.googleDrivePathForLatestReport, unittest.equals('foo'));
    unittest.expect(o.latestReportRunTimeMs, unittest.equals('foo'));
    unittest.expect(o.locale, unittest.equals('foo'));
    unittest.expect(o.reportCount, unittest.equals(42));
    unittest.expect(o.running, unittest.isTrue);
    unittest.expect(o.sendNotification, unittest.isTrue);
    checkUnnamed3826(o.shareEmailAddress);
    unittest.expect(o.title, unittest.equals('foo'));
  }
  buildCounterQueryMetadata--;
}

core.int buildCounterQuerySchedule = 0;
buildQuerySchedule() {
  var o = new api.QuerySchedule();
  buildCounterQuerySchedule++;
  if (buildCounterQuerySchedule < 3) {
    o.endTimeMs = "foo";
    o.frequency = "foo";
    o.nextRunMinuteOfDay = 42;
    o.nextRunTimezoneCode = "foo";
    o.startTimeMs = "foo";
  }
  buildCounterQuerySchedule--;
  return o;
}

checkQuerySchedule(api.QuerySchedule o) {
  buildCounterQuerySchedule++;
  if (buildCounterQuerySchedule < 3) {
    unittest.expect(o.endTimeMs, unittest.equals('foo'));
    unittest.expect(o.frequency, unittest.equals('foo'));
    unittest.expect(o.nextRunMinuteOfDay, unittest.equals(42));
    unittest.expect(o.nextRunTimezoneCode, unittest.equals('foo'));
    unittest.expect(o.startTimeMs, unittest.equals('foo'));
  }
  buildCounterQuerySchedule--;
}

core.int buildCounterReport = 0;
buildReport() {
  var o = new api.Report();
  buildCounterReport++;
  if (buildCounterReport < 3) {
    o.key = buildReportKey();
    o.metadata = buildReportMetadata();
    o.params = buildParameters();
  }
  buildCounterReport--;
  return o;
}

checkReport(api.Report o) {
  buildCounterReport++;
  if (buildCounterReport < 3) {
    checkReportKey(o.key);
    checkReportMetadata(o.metadata);
    checkParameters(o.params);
  }
  buildCounterReport--;
}

core.int buildCounterReportFailure = 0;
buildReportFailure() {
  var o = new api.ReportFailure();
  buildCounterReportFailure++;
  if (buildCounterReportFailure < 3) {
    o.errorCode = "foo";
  }
  buildCounterReportFailure--;
  return o;
}

checkReportFailure(api.ReportFailure o) {
  buildCounterReportFailure++;
  if (buildCounterReportFailure < 3) {
    unittest.expect(o.errorCode, unittest.equals('foo'));
  }
  buildCounterReportFailure--;
}

core.int buildCounterReportKey = 0;
buildReportKey() {
  var o = new api.ReportKey();
  buildCounterReportKey++;
  if (buildCounterReportKey < 3) {
    o.queryId = "foo";
    o.reportId = "foo";
  }
  buildCounterReportKey--;
  return o;
}

checkReportKey(api.ReportKey o) {
  buildCounterReportKey++;
  if (buildCounterReportKey < 3) {
    unittest.expect(o.queryId, unittest.equals('foo'));
    unittest.expect(o.reportId, unittest.equals('foo'));
  }
  buildCounterReportKey--;
}

core.int buildCounterReportMetadata = 0;
buildReportMetadata() {
  var o = new api.ReportMetadata();
  buildCounterReportMetadata++;
  if (buildCounterReportMetadata < 3) {
    o.googleCloudStoragePath = "foo";
    o.reportDataEndTimeMs = "foo";
    o.reportDataStartTimeMs = "foo";
    o.status = buildReportStatus();
  }
  buildCounterReportMetadata--;
  return o;
}

checkReportMetadata(api.ReportMetadata o) {
  buildCounterReportMetadata++;
  if (buildCounterReportMetadata < 3) {
    unittest.expect(o.googleCloudStoragePath, unittest.equals('foo'));
    unittest.expect(o.reportDataEndTimeMs, unittest.equals('foo'));
    unittest.expect(o.reportDataStartTimeMs, unittest.equals('foo'));
    checkReportStatus(o.status);
  }
  buildCounterReportMetadata--;
}

core.int buildCounterReportStatus = 0;
buildReportStatus() {
  var o = new api.ReportStatus();
  buildCounterReportStatus++;
  if (buildCounterReportStatus < 3) {
    o.failure = buildReportFailure();
    o.finishTimeMs = "foo";
    o.format = "foo";
    o.state = "foo";
  }
  buildCounterReportStatus--;
  return o;
}

checkReportStatus(api.ReportStatus o) {
  buildCounterReportStatus++;
  if (buildCounterReportStatus < 3) {
    checkReportFailure(o.failure);
    unittest.expect(o.finishTimeMs, unittest.equals('foo'));
    unittest.expect(o.format, unittest.equals('foo'));
    unittest.expect(o.state, unittest.equals('foo'));
  }
  buildCounterReportStatus--;
}

buildUnnamed3827() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3827(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterRowStatus = 0;
buildRowStatus() {
  var o = new api.RowStatus();
  buildCounterRowStatus++;
  if (buildCounterRowStatus < 3) {
    o.changed = true;
    o.entityId = "foo";
    o.entityName = "foo";
    o.errors = buildUnnamed3827();
    o.persisted = true;
    o.rowNumber = 42;
  }
  buildCounterRowStatus--;
  return o;
}

checkRowStatus(api.RowStatus o) {
  buildCounterRowStatus++;
  if (buildCounterRowStatus < 3) {
    unittest.expect(o.changed, unittest.isTrue);
    unittest.expect(o.entityId, unittest.equals('foo'));
    unittest.expect(o.entityName, unittest.equals('foo'));
    checkUnnamed3827(o.errors);
    unittest.expect(o.persisted, unittest.isTrue);
    unittest.expect(o.rowNumber, unittest.equals(42));
  }
  buildCounterRowStatus--;
}

buildUnnamed3828() {
  var o = new core.List<api.DisjunctiveMatchStatement>();
  o.add(buildDisjunctiveMatchStatement());
  o.add(buildDisjunctiveMatchStatement());
  return o;
}

checkUnnamed3828(core.List<api.DisjunctiveMatchStatement> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDisjunctiveMatchStatement(o[0]);
  checkDisjunctiveMatchStatement(o[1]);
}

core.int buildCounterRule = 0;
buildRule() {
  var o = new api.Rule();
  buildCounterRule++;
  if (buildCounterRule < 3) {
    o.disjunctiveMatchStatements = buildUnnamed3828();
    o.name = "foo";
  }
  buildCounterRule--;
  return o;
}

checkRule(api.Rule o) {
  buildCounterRule++;
  if (buildCounterRule < 3) {
    checkUnnamed3828(o.disjunctiveMatchStatements);
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterRule--;
}

core.int buildCounterRunQueryRequest = 0;
buildRunQueryRequest() {
  var o = new api.RunQueryRequest();
  buildCounterRunQueryRequest++;
  if (buildCounterRunQueryRequest < 3) {
    o.dataRange = "foo";
    o.reportDataEndTimeMs = "foo";
    o.reportDataStartTimeMs = "foo";
    o.timezoneCode = "foo";
  }
  buildCounterRunQueryRequest--;
  return o;
}

checkRunQueryRequest(api.RunQueryRequest o) {
  buildCounterRunQueryRequest++;
  if (buildCounterRunQueryRequest < 3) {
    unittest.expect(o.dataRange, unittest.equals('foo'));
    unittest.expect(o.reportDataEndTimeMs, unittest.equals('foo'));
    unittest.expect(o.reportDataStartTimeMs, unittest.equals('foo'));
    unittest.expect(o.timezoneCode, unittest.equals('foo'));
  }
  buildCounterRunQueryRequest--;
}

core.int buildCounterUploadLineItemsRequest = 0;
buildUploadLineItemsRequest() {
  var o = new api.UploadLineItemsRequest();
  buildCounterUploadLineItemsRequest++;
  if (buildCounterUploadLineItemsRequest < 3) {
    o.dryRun = true;
    o.format = "foo";
    o.lineItems = "foo";
  }
  buildCounterUploadLineItemsRequest--;
  return o;
}

checkUploadLineItemsRequest(api.UploadLineItemsRequest o) {
  buildCounterUploadLineItemsRequest++;
  if (buildCounterUploadLineItemsRequest < 3) {
    unittest.expect(o.dryRun, unittest.isTrue);
    unittest.expect(o.format, unittest.equals('foo'));
    unittest.expect(o.lineItems, unittest.equals('foo'));
  }
  buildCounterUploadLineItemsRequest--;
}

core.int buildCounterUploadLineItemsResponse = 0;
buildUploadLineItemsResponse() {
  var o = new api.UploadLineItemsResponse();
  buildCounterUploadLineItemsResponse++;
  if (buildCounterUploadLineItemsResponse < 3) {
    o.uploadStatus = buildUploadStatus();
  }
  buildCounterUploadLineItemsResponse--;
  return o;
}

checkUploadLineItemsResponse(api.UploadLineItemsResponse o) {
  buildCounterUploadLineItemsResponse++;
  if (buildCounterUploadLineItemsResponse < 3) {
    checkUploadStatus(o.uploadStatus);
  }
  buildCounterUploadLineItemsResponse--;
}

buildUnnamed3829() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3829(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3830() {
  var o = new core.List<api.RowStatus>();
  o.add(buildRowStatus());
  o.add(buildRowStatus());
  return o;
}

checkUnnamed3830(core.List<api.RowStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRowStatus(o[0]);
  checkRowStatus(o[1]);
}

core.int buildCounterUploadStatus = 0;
buildUploadStatus() {
  var o = new api.UploadStatus();
  buildCounterUploadStatus++;
  if (buildCounterUploadStatus < 3) {
    o.errors = buildUnnamed3829();
    o.rowStatus = buildUnnamed3830();
  }
  buildCounterUploadStatus--;
  return o;
}

checkUploadStatus(api.UploadStatus o) {
  buildCounterUploadStatus++;
  if (buildCounterUploadStatus < 3) {
    checkUnnamed3829(o.errors);
    checkUnnamed3830(o.rowStatus);
  }
  buildCounterUploadStatus--;
}

main() {
  unittest.group("obj-schema-ChannelGrouping", () {
    unittest.test("to-json--from-json", () {
      var o = buildChannelGrouping();
      var od = new api.ChannelGrouping.fromJson(o.toJson());
      checkChannelGrouping(od);
    });
  });

  unittest.group("obj-schema-DisjunctiveMatchStatement", () {
    unittest.test("to-json--from-json", () {
      var o = buildDisjunctiveMatchStatement();
      var od = new api.DisjunctiveMatchStatement.fromJson(o.toJson());
      checkDisjunctiveMatchStatement(od);
    });
  });

  unittest.group("obj-schema-DownloadLineItemsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildDownloadLineItemsRequest();
      var od = new api.DownloadLineItemsRequest.fromJson(o.toJson());
      checkDownloadLineItemsRequest(od);
    });
  });

  unittest.group("obj-schema-DownloadLineItemsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildDownloadLineItemsResponse();
      var od = new api.DownloadLineItemsResponse.fromJson(o.toJson());
      checkDownloadLineItemsResponse(od);
    });
  });

  unittest.group("obj-schema-DownloadRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildDownloadRequest();
      var od = new api.DownloadRequest.fromJson(o.toJson());
      checkDownloadRequest(od);
    });
  });

  unittest.group("obj-schema-DownloadResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildDownloadResponse();
      var od = new api.DownloadResponse.fromJson(o.toJson());
      checkDownloadResponse(od);
    });
  });

  unittest.group("obj-schema-EventFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildEventFilter();
      var od = new api.EventFilter.fromJson(o.toJson());
      checkEventFilter(od);
    });
  });

  unittest.group("obj-schema-FilterPair", () {
    unittest.test("to-json--from-json", () {
      var o = buildFilterPair();
      var od = new api.FilterPair.fromJson(o.toJson());
      checkFilterPair(od);
    });
  });

  unittest.group("obj-schema-ListQueriesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListQueriesResponse();
      var od = new api.ListQueriesResponse.fromJson(o.toJson());
      checkListQueriesResponse(od);
    });
  });

  unittest.group("obj-schema-ListReportsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListReportsResponse();
      var od = new api.ListReportsResponse.fromJson(o.toJson());
      checkListReportsResponse(od);
    });
  });

  unittest.group("obj-schema-Options", () {
    unittest.test("to-json--from-json", () {
      var o = buildOptions();
      var od = new api.Options.fromJson(o.toJson());
      checkOptions(od);
    });
  });

  unittest.group("obj-schema-Parameters", () {
    unittest.test("to-json--from-json", () {
      var o = buildParameters();
      var od = new api.Parameters.fromJson(o.toJson());
      checkParameters(od);
    });
  });

  unittest.group("obj-schema-PathFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildPathFilter();
      var od = new api.PathFilter.fromJson(o.toJson());
      checkPathFilter(od);
    });
  });

  unittest.group("obj-schema-PathQueryOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildPathQueryOptions();
      var od = new api.PathQueryOptions.fromJson(o.toJson());
      checkPathQueryOptions(od);
    });
  });

  unittest.group("obj-schema-PathQueryOptionsFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildPathQueryOptionsFilter();
      var od = new api.PathQueryOptionsFilter.fromJson(o.toJson());
      checkPathQueryOptionsFilter(od);
    });
  });

  unittest.group("obj-schema-Query", () {
    unittest.test("to-json--from-json", () {
      var o = buildQuery();
      var od = new api.Query.fromJson(o.toJson());
      checkQuery(od);
    });
  });

  unittest.group("obj-schema-QueryMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryMetadata();
      var od = new api.QueryMetadata.fromJson(o.toJson());
      checkQueryMetadata(od);
    });
  });

  unittest.group("obj-schema-QuerySchedule", () {
    unittest.test("to-json--from-json", () {
      var o = buildQuerySchedule();
      var od = new api.QuerySchedule.fromJson(o.toJson());
      checkQuerySchedule(od);
    });
  });

  unittest.group("obj-schema-Report", () {
    unittest.test("to-json--from-json", () {
      var o = buildReport();
      var od = new api.Report.fromJson(o.toJson());
      checkReport(od);
    });
  });

  unittest.group("obj-schema-ReportFailure", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportFailure();
      var od = new api.ReportFailure.fromJson(o.toJson());
      checkReportFailure(od);
    });
  });

  unittest.group("obj-schema-ReportKey", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportKey();
      var od = new api.ReportKey.fromJson(o.toJson());
      checkReportKey(od);
    });
  });

  unittest.group("obj-schema-ReportMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportMetadata();
      var od = new api.ReportMetadata.fromJson(o.toJson());
      checkReportMetadata(od);
    });
  });

  unittest.group("obj-schema-ReportStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportStatus();
      var od = new api.ReportStatus.fromJson(o.toJson());
      checkReportStatus(od);
    });
  });

  unittest.group("obj-schema-RowStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildRowStatus();
      var od = new api.RowStatus.fromJson(o.toJson());
      checkRowStatus(od);
    });
  });

  unittest.group("obj-schema-Rule", () {
    unittest.test("to-json--from-json", () {
      var o = buildRule();
      var od = new api.Rule.fromJson(o.toJson());
      checkRule(od);
    });
  });

  unittest.group("obj-schema-RunQueryRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildRunQueryRequest();
      var od = new api.RunQueryRequest.fromJson(o.toJson());
      checkRunQueryRequest(od);
    });
  });

  unittest.group("obj-schema-UploadLineItemsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildUploadLineItemsRequest();
      var od = new api.UploadLineItemsRequest.fromJson(o.toJson());
      checkUploadLineItemsRequest(od);
    });
  });

  unittest.group("obj-schema-UploadLineItemsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildUploadLineItemsResponse();
      var od = new api.UploadLineItemsResponse.fromJson(o.toJson());
      checkUploadLineItemsResponse(od);
    });
  });

  unittest.group("obj-schema-UploadStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildUploadStatus();
      var od = new api.UploadStatus.fromJson(o.toJson());
      checkUploadStatus(od);
    });
  });

  unittest.group("resource-LineitemsResourceApi", () {
    unittest.test("method--downloadlineitems", () {
      var mock = new HttpServerMock();
      api.LineitemsResourceApi res =
          new api.DoubleclickbidmanagerApi(mock).lineitems;
      var arg_request = buildDownloadLineItemsRequest();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.DownloadLineItemsRequest.fromJson(json);
        checkDownloadLineItemsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("doubleclickbidmanager/v1.1/"));
        pathOffset += 27;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("lineitems/downloadlineitems"));
        pathOffset += 27;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildDownloadLineItemsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .downloadlineitems(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkDownloadLineItemsResponse(response);
      })));
    });

    unittest.test("method--uploadlineitems", () {
      var mock = new HttpServerMock();
      api.LineitemsResourceApi res =
          new api.DoubleclickbidmanagerApi(mock).lineitems;
      var arg_request = buildUploadLineItemsRequest();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.UploadLineItemsRequest.fromJson(json);
        checkUploadLineItemsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("doubleclickbidmanager/v1.1/"));
        pathOffset += 27;
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("lineitems/uploadlineitems"));
        pathOffset += 25;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildUploadLineItemsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .uploadlineitems(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUploadLineItemsResponse(response);
      })));
    });
  });

  unittest.group("resource-QueriesResourceApi", () {
    unittest.test("method--createquery", () {
      var mock = new HttpServerMock();
      api.QueriesResourceApi res =
          new api.DoubleclickbidmanagerApi(mock).queries;
      var arg_request = buildQuery();
      var arg_asynchronous = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Query.fromJson(json);
        checkQuery(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("doubleclickbidmanager/v1.1/"));
        pathOffset += 27;
        unittest.expect(path.substring(pathOffset, pathOffset + 5),
            unittest.equals("query"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["asynchronous"].first,
            unittest.equals("$arg_asynchronous"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildQuery());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .createquery(arg_request,
              asynchronous: arg_asynchronous, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkQuery(response);
      })));
    });

    unittest.test("method--deletequery", () {
      var mock = new HttpServerMock();
      api.QueriesResourceApi res =
          new api.DoubleclickbidmanagerApi(mock).queries;
      var arg_queryId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("doubleclickbidmanager/v1.1/"));
        pathOffset += 27;
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("query/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_queryId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .deletequery(arg_queryId, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--getquery", () {
      var mock = new HttpServerMock();
      api.QueriesResourceApi res =
          new api.DoubleclickbidmanagerApi(mock).queries;
      var arg_queryId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("doubleclickbidmanager/v1.1/"));
        pathOffset += 27;
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("query/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_queryId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildQuery());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getquery(arg_queryId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkQuery(response);
      })));
    });

    unittest.test("method--listqueries", () {
      var mock = new HttpServerMock();
      api.QueriesResourceApi res =
          new api.DoubleclickbidmanagerApi(mock).queries;
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("doubleclickbidmanager/v1.1/"));
        pathOffset += 27;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("queries"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListQueriesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .listqueries(
              pageSize: arg_pageSize,
              pageToken: arg_pageToken,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListQueriesResponse(response);
      })));
    });

    unittest.test("method--runquery", () {
      var mock = new HttpServerMock();
      api.QueriesResourceApi res =
          new api.DoubleclickbidmanagerApi(mock).queries;
      var arg_request = buildRunQueryRequest();
      var arg_queryId = "foo";
      var arg_asynchronous = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.RunQueryRequest.fromJson(json);
        checkRunQueryRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("doubleclickbidmanager/v1.1/"));
        pathOffset += 27;
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("query/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_queryId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["asynchronous"].first,
            unittest.equals("$arg_asynchronous"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .runquery(arg_request, arg_queryId,
              asynchronous: arg_asynchronous, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });
  });

  unittest.group("resource-ReportsResourceApi", () {
    unittest.test("method--listreports", () {
      var mock = new HttpServerMock();
      api.ReportsResourceApi res =
          new api.DoubleclickbidmanagerApi(mock).reports;
      var arg_queryId = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("doubleclickbidmanager/v1.1/"));
        pathOffset += 27;
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("queries/"));
        pathOffset += 8;
        index = path.indexOf("/reports", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_queryId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/reports"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListReportsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .listreports(arg_queryId,
              pageSize: arg_pageSize,
              pageToken: arg_pageToken,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListReportsResponse(response);
      })));
    });
  });

  unittest.group("resource-SdfResourceApi", () {
    unittest.test("method--download", () {
      var mock = new HttpServerMock();
      api.SdfResourceApi res = new api.DoubleclickbidmanagerApi(mock).sdf;
      var arg_request = buildDownloadRequest();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.DownloadRequest.fromJson(json);
        checkDownloadRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("doubleclickbidmanager/v1.1/"));
        pathOffset += 27;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("sdf/download"));
        pathOffset += 12;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildDownloadResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .download(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkDownloadResponse(response);
      })));
    });
  });
}

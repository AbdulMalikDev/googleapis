// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: unused_import, unnecessary_cast

library googleapis.searchconsole.v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client searchconsole/v1';

/// The Search Console API provides access to both Search Console data (verified
/// users only) and to public information on an URL basis (anyone)
class SearchconsoleApi {
  /// View and manage Search Console data for your verified sites
  static const WebmastersScope = "https://www.googleapis.com/auth/webmasters";

  /// View Search Console data for your verified sites
  static const WebmastersReadonlyScope =
      "https://www.googleapis.com/auth/webmasters.readonly";

  final commons.ApiRequester _requester;

  SearchanalyticsResourceApi get searchanalytics =>
      new SearchanalyticsResourceApi(_requester);
  SitemapsResourceApi get sitemaps => new SitemapsResourceApi(_requester);
  SitesResourceApi get sites => new SitesResourceApi(_requester);
  UrlTestingToolsResourceApi get urlTestingTools =>
      new UrlTestingToolsResourceApi(_requester);

  SearchconsoleApi(http.Client client,
      {core.String rootUrl = "https://searchconsole.googleapis.com/",
      core.String servicePath = ""})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class SearchanalyticsResourceApi {
  final commons.ApiRequester _requester;

  SearchanalyticsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Query your data with filters and parameters that you define. Returns zero
  /// or more rows grouped by the row keys that you define. You must define a
  /// date range of one or more days. When date is one of the group by values,
  /// any days without data are omitted from the result list. If you need to
  /// know which days have data, issue a broad date range query grouped by date
  /// for any metric, and see which day rows are returned.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [siteUrl] - The site's URL, including protocol. For example:
  /// `http://www.example.com/`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [SearchAnalyticsQueryResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<SearchAnalyticsQueryResponse> query(
      SearchAnalyticsQueryRequest request, core.String siteUrl,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (siteUrl == null) {
      throw new core.ArgumentError("Parameter siteUrl is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'webmasters/v3/sites/' +
        commons.Escaper.ecapeVariable('$siteUrl') +
        '/searchAnalytics/query';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new SearchAnalyticsQueryResponse.fromJson(data));
  }
}

class SitemapsResourceApi {
  final commons.ApiRequester _requester;

  SitemapsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Deletes a sitemap from this site.
  ///
  /// Request parameters:
  ///
  /// [siteUrl] - The site's URL, including protocol. For example:
  /// `http://www.example.com/`.
  ///
  /// [feedpath] - The URL of the actual sitemap. For example:
  /// `http://www.example.com/sitemap.xml`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future delete(core.String siteUrl, core.String feedpath,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (siteUrl == null) {
      throw new core.ArgumentError("Parameter siteUrl is required.");
    }
    if (feedpath == null) {
      throw new core.ArgumentError("Parameter feedpath is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _downloadOptions = null;

    _url = 'webmasters/v3/sites/' +
        commons.Escaper.ecapeVariable('$siteUrl') +
        '/sitemaps/' +
        commons.Escaper.ecapeVariable('$feedpath');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => null);
  }

  /// Retrieves information about a specific sitemap.
  ///
  /// Request parameters:
  ///
  /// [siteUrl] - The site's URL, including protocol. For example:
  /// `http://www.example.com/`.
  ///
  /// [feedpath] - The URL of the actual sitemap. For example:
  /// `http://www.example.com/sitemap.xml`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [WmxSitemap].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<WmxSitemap> get(core.String siteUrl, core.String feedpath,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (siteUrl == null) {
      throw new core.ArgumentError("Parameter siteUrl is required.");
    }
    if (feedpath == null) {
      throw new core.ArgumentError("Parameter feedpath is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'webmasters/v3/sites/' +
        commons.Escaper.ecapeVariable('$siteUrl') +
        '/sitemaps/' +
        commons.Escaper.ecapeVariable('$feedpath');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new WmxSitemap.fromJson(data));
  }

  /// Lists the [sitemaps-entries](/webmaster-tools/v3/sitemaps) submitted for
  /// this site, or included in the sitemap index file (if `sitemapIndex` is
  /// specified in the request).
  ///
  /// Request parameters:
  ///
  /// [siteUrl] - The site's URL, including protocol. For example:
  /// `http://www.example.com/`.
  ///
  /// [sitemapIndex] -  A URL of a site's sitemap index. For example:
  /// `http://www.example.com/sitemapindex.xml`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [SitemapsListResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<SitemapsListResponse> list(core.String siteUrl,
      {core.String sitemapIndex, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (siteUrl == null) {
      throw new core.ArgumentError("Parameter siteUrl is required.");
    }
    if (sitemapIndex != null) {
      _queryParams["sitemapIndex"] = [sitemapIndex];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'webmasters/v3/sites/' +
        commons.Escaper.ecapeVariable('$siteUrl') +
        '/sitemaps';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new SitemapsListResponse.fromJson(data));
  }

  /// Submits a sitemap for a site.
  ///
  /// Request parameters:
  ///
  /// [siteUrl] - The site's URL, including protocol. For example:
  /// `http://www.example.com/`.
  ///
  /// [feedpath] - The URL of the actual sitemap. For example:
  /// `http://www.example.com/sitemap.xml`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future submit(core.String siteUrl, core.String feedpath,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (siteUrl == null) {
      throw new core.ArgumentError("Parameter siteUrl is required.");
    }
    if (feedpath == null) {
      throw new core.ArgumentError("Parameter feedpath is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _downloadOptions = null;

    _url = 'webmasters/v3/sites/' +
        commons.Escaper.ecapeVariable('$siteUrl') +
        '/sitemaps/' +
        commons.Escaper.ecapeVariable('$feedpath');

    var _response = _requester.request(_url, "PUT",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => null);
  }
}

class SitesResourceApi {
  final commons.ApiRequester _requester;

  SitesResourceApi(commons.ApiRequester client) : _requester = client;

  ///  Adds a site to the set of the user's sites in Search Console.
  ///
  /// Request parameters:
  ///
  /// [siteUrl] - The URL of the site to add.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future add(core.String siteUrl, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (siteUrl == null) {
      throw new core.ArgumentError("Parameter siteUrl is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _downloadOptions = null;

    _url = 'webmasters/v3/sites/' + commons.Escaper.ecapeVariable('$siteUrl');

    var _response = _requester.request(_url, "PUT",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => null);
  }

  ///  Removes a site from the set of the user's Search Console sites.
  ///
  /// Request parameters:
  ///
  /// [siteUrl] - The URI of the property as defined in Search Console.
  /// **Examples:** `http://www.example.com/` or `sc-domain:example.com`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future delete(core.String siteUrl, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (siteUrl == null) {
      throw new core.ArgumentError("Parameter siteUrl is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _downloadOptions = null;

    _url = 'webmasters/v3/sites/' + commons.Escaper.ecapeVariable('$siteUrl');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => null);
  }

  ///  Retrieves information about specific site.
  ///
  /// Request parameters:
  ///
  /// [siteUrl] - The URI of the property as defined in Search Console.
  /// **Examples:** `http://www.example.com/` or `sc-domain:example.com`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [WmxSite].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<WmxSite> get(core.String siteUrl, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (siteUrl == null) {
      throw new core.ArgumentError("Parameter siteUrl is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'webmasters/v3/sites/' + commons.Escaper.ecapeVariable('$siteUrl');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new WmxSite.fromJson(data));
  }

  ///  Lists the user's Search Console sites.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [SitesListResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<SitesListResponse> list({core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'webmasters/v3/sites';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new SitesListResponse.fromJson(data));
  }
}

class UrlTestingToolsResourceApi {
  final commons.ApiRequester _requester;

  UrlTestingToolsMobileFriendlyTestResourceApi get mobileFriendlyTest =>
      new UrlTestingToolsMobileFriendlyTestResourceApi(_requester);

  UrlTestingToolsResourceApi(commons.ApiRequester client) : _requester = client;
}

class UrlTestingToolsMobileFriendlyTestResourceApi {
  final commons.ApiRequester _requester;

  UrlTestingToolsMobileFriendlyTestResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Runs Mobile-Friendly Test for a given URL.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [RunMobileFriendlyTestResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<RunMobileFriendlyTestResponse> run(
      RunMobileFriendlyTestRequest request,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/urlTestingTools/mobileFriendlyTest:run';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new RunMobileFriendlyTestResponse.fromJson(data));
  }
}

class ApiDataRow {
  core.double clicks;
  core.double ctr;
  core.double impressions;
  core.List<core.String> keys;
  core.double position;

  ApiDataRow();

  ApiDataRow.fromJson(core.Map _json) {
    if (_json.containsKey("clicks")) {
      clicks = _json["clicks"].toDouble();
    }
    if (_json.containsKey("ctr")) {
      ctr = _json["ctr"].toDouble();
    }
    if (_json.containsKey("impressions")) {
      impressions = _json["impressions"].toDouble();
    }
    if (_json.containsKey("keys")) {
      keys = (_json["keys"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("position")) {
      position = _json["position"].toDouble();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (clicks != null) {
      _json["clicks"] = clicks;
    }
    if (ctr != null) {
      _json["ctr"] = ctr;
    }
    if (impressions != null) {
      _json["impressions"] = impressions;
    }
    if (keys != null) {
      _json["keys"] = keys;
    }
    if (position != null) {
      _json["position"] = position;
    }
    return _json;
  }
}

/// A filter test to be applied to each row in the data set, where a match can
/// return the row. Filters are string comparisons, and values and dimension
/// names are not case-sensitive. Individual filters are either AND'ed or OR'ed
/// within their parent filter group, according to the group's group type. You
/// do not need to group by a specified dimension to filter against it.
class ApiDimensionFilter {
  ///
  /// Possible string values are:
  /// - "QUERY"
  /// - "PAGE"
  /// - "COUNTRY"
  /// - "DEVICE"
  /// - "SEARCH_APPEARANCE"
  core.String dimension;
  core.String expression;

  ///
  /// Possible string values are:
  /// - "EQUALS"
  /// - "NOT_EQUALS"
  /// - "CONTAINS"
  /// - "NOT_CONTAINS"
  core.String operator;

  ApiDimensionFilter();

  ApiDimensionFilter.fromJson(core.Map _json) {
    if (_json.containsKey("dimension")) {
      dimension = _json["dimension"];
    }
    if (_json.containsKey("expression")) {
      expression = _json["expression"];
    }
    if (_json.containsKey("operator")) {
      operator = _json["operator"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (dimension != null) {
      _json["dimension"] = dimension;
    }
    if (expression != null) {
      _json["expression"] = expression;
    }
    if (operator != null) {
      _json["operator"] = operator;
    }
    return _json;
  }
}

/// A set of dimension value filters to test against each row. Only rows that
/// pass all filter groups will be returned. All results within a filter group
/// are either AND'ed or OR'ed together, depending on the group type selected.
/// All filter groups are AND'ed together.
class ApiDimensionFilterGroup {
  core.List<ApiDimensionFilter> filters;

  ///
  /// Possible string values are:
  /// - "AND"
  core.String groupType;

  ApiDimensionFilterGroup();

  ApiDimensionFilterGroup.fromJson(core.Map _json) {
    if (_json.containsKey("filters")) {
      filters = (_json["filters"] as core.List)
          .map<ApiDimensionFilter>(
              (value) => new ApiDimensionFilter.fromJson(value))
          .toList();
    }
    if (_json.containsKey("groupType")) {
      groupType = _json["groupType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (filters != null) {
      _json["filters"] = filters.map((value) => (value).toJson()).toList();
    }
    if (groupType != null) {
      _json["groupType"] = groupType;
    }
    return _json;
  }
}

/// Blocked resource.
class BlockedResource {
  /// URL of the blocked resource.
  core.String url;

  BlockedResource();

  BlockedResource.fromJson(core.Map _json) {
    if (_json.containsKey("url")) {
      url = _json["url"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (url != null) {
      _json["url"] = url;
    }
    return _json;
  }
}

/// Describe image data.
class Image {
  /// Image data in format determined by the mime type. Currently, the format
  /// will always be "image/png", but this might change in the future.
  core.String data;
  core.List<core.int> get dataAsBytes {
    return convert.base64.decode(data);
  }

  set dataAsBytes(core.List<core.int> _bytes) {
    data =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  /// The mime-type of the image data.
  core.String mimeType;

  Image();

  Image.fromJson(core.Map _json) {
    if (_json.containsKey("data")) {
      data = _json["data"];
    }
    if (_json.containsKey("mimeType")) {
      mimeType = _json["mimeType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (data != null) {
      _json["data"] = data;
    }
    if (mimeType != null) {
      _json["mimeType"] = mimeType;
    }
    return _json;
  }
}

/// Mobile-friendly issue.
class MobileFriendlyIssue {
  /// Rule violated.
  /// Possible string values are:
  /// - "MOBILE_FRIENDLY_RULE_UNSPECIFIED" : Unknown rule. Sorry, we don't have
  /// any description for the rule that was broken.
  /// - "USES_INCOMPATIBLE_PLUGINS" : Plugins incompatible with mobile devices
  /// are being used. [Learn more]
  /// (https://support.google.com/webmasters/answer/6352293#flash_usage).
  /// - "CONFIGURE_VIEWPORT" : Viewsport is not specified using the meta
  /// viewport tag. [Learn more]
  /// (https://support.google.com/webmasters/answer/6352293#viewport_not_configured).
  /// - "FIXED_WIDTH_VIEWPORT" : Viewport defined to a fixed width. [Learn more]
  /// (https://support.google.com/webmasters/answer/6352293#fixed-width_viewport).
  /// - "SIZE_CONTENT_TO_VIEWPORT" : Content not sized to viewport. [Learn more]
  /// (https://support.google.com/webmasters/answer/6352293#content_not_sized_to_viewport).
  /// - "USE_LEGIBLE_FONT_SIZES" : Font size is too small for easy reading on a
  /// small screen. [Learn More]
  /// (https://support.google.com/webmasters/answer/6352293#small_font_size).
  /// - "TAP_TARGETS_TOO_CLOSE" : Touch elements are too close to each other.
  /// [Learn more]
  /// (https://support.google.com/webmasters/answer/6352293#touch_elements_too_close).
  core.String rule;

  MobileFriendlyIssue();

  MobileFriendlyIssue.fromJson(core.Map _json) {
    if (_json.containsKey("rule")) {
      rule = _json["rule"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (rule != null) {
      _json["rule"] = rule;
    }
    return _json;
  }
}

/// Information about a resource with issue.
class ResourceIssue {
  /// Describes a blocked resource issue.
  BlockedResource blockedResource;

  ResourceIssue();

  ResourceIssue.fromJson(core.Map _json) {
    if (_json.containsKey("blockedResource")) {
      blockedResource = new BlockedResource.fromJson(_json["blockedResource"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (blockedResource != null) {
      _json["blockedResource"] = (blockedResource).toJson();
    }
    return _json;
  }
}

/// Mobile-friendly test request.
class RunMobileFriendlyTestRequest {
  /// Whether or not screenshot is requested. Default is false.
  core.bool requestScreenshot;

  /// URL for inspection.
  core.String url;

  RunMobileFriendlyTestRequest();

  RunMobileFriendlyTestRequest.fromJson(core.Map _json) {
    if (_json.containsKey("requestScreenshot")) {
      requestScreenshot = _json["requestScreenshot"];
    }
    if (_json.containsKey("url")) {
      url = _json["url"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (requestScreenshot != null) {
      _json["requestScreenshot"] = requestScreenshot;
    }
    if (url != null) {
      _json["url"] = url;
    }
    return _json;
  }
}

/// Mobile-friendly test response, including mobile-friendly issues and resource
/// issues.
class RunMobileFriendlyTestResponse {
  /// Test verdict, whether the page is mobile friendly or not.
  /// Possible string values are:
  /// - "MOBILE_FRIENDLY_TEST_RESULT_UNSPECIFIED" : Internal error when running
  /// this test. Please try running the test again.
  /// - "MOBILE_FRIENDLY" : The page is mobile friendly.
  /// - "NOT_MOBILE_FRIENDLY" : The page is not mobile friendly.
  core.String mobileFriendliness;

  /// List of mobile-usability issues.
  core.List<MobileFriendlyIssue> mobileFriendlyIssues;

  /// Information about embedded resources issues.
  core.List<ResourceIssue> resourceIssues;

  /// Screenshot of the requested URL.
  Image screenshot;

  /// Final state of the test, can be either complete or an error.
  TestStatus testStatus;

  RunMobileFriendlyTestResponse();

  RunMobileFriendlyTestResponse.fromJson(core.Map _json) {
    if (_json.containsKey("mobileFriendliness")) {
      mobileFriendliness = _json["mobileFriendliness"];
    }
    if (_json.containsKey("mobileFriendlyIssues")) {
      mobileFriendlyIssues = (_json["mobileFriendlyIssues"] as core.List)
          .map<MobileFriendlyIssue>(
              (value) => new MobileFriendlyIssue.fromJson(value))
          .toList();
    }
    if (_json.containsKey("resourceIssues")) {
      resourceIssues = (_json["resourceIssues"] as core.List)
          .map<ResourceIssue>((value) => new ResourceIssue.fromJson(value))
          .toList();
    }
    if (_json.containsKey("screenshot")) {
      screenshot = new Image.fromJson(_json["screenshot"]);
    }
    if (_json.containsKey("testStatus")) {
      testStatus = new TestStatus.fromJson(_json["testStatus"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (mobileFriendliness != null) {
      _json["mobileFriendliness"] = mobileFriendliness;
    }
    if (mobileFriendlyIssues != null) {
      _json["mobileFriendlyIssues"] =
          mobileFriendlyIssues.map((value) => (value).toJson()).toList();
    }
    if (resourceIssues != null) {
      _json["resourceIssues"] =
          resourceIssues.map((value) => (value).toJson()).toList();
    }
    if (screenshot != null) {
      _json["screenshot"] = (screenshot).toJson();
    }
    if (testStatus != null) {
      _json["testStatus"] = (testStatus).toJson();
    }
    return _json;
  }
}

class SearchAnalyticsQueryRequest {
  /// [Optional; Default is \"auto\"] How data is aggregated. If aggregated by
  /// property, all data for the same property is aggregated; if aggregated by
  /// page, all data is aggregated by canonical URI. If you filter or group by
  /// page, choose AUTO; otherwise you can aggregate either by property or by
  /// page, depending on how you want your data calculated; see the help
  /// documentation to learn how data is calculated differently by site versus
  /// by page. **Note:** If you group or filter by page, you cannot aggregate by
  /// property. If you specify any value other than AUTO, the aggregation type
  /// in the result will match the requested type, or if you request an invalid
  /// type, you will get an error. The API will never change your aggregation
  /// type if the requested type is invalid.
  /// Possible string values are:
  /// - "AUTO"
  /// - "BY_PROPERTY"
  /// - "BY_PAGE"
  core.String aggregationType;

  /// [Optional] Zero or more filters to apply to the dimension grouping values;
  /// for example, 'query contains \"buy\"' to see only data where the query
  /// string contains the substring \"buy\" (not case-sensitive). You can filter
  /// by a dimension without grouping by it.
  core.List<ApiDimensionFilterGroup> dimensionFilterGroups;

  /// [Optional] Zero or more dimensions to group results by. Dimensions are the
  /// group-by values in the Search Analytics page. Dimensions are combined to
  /// create a unique row key for each row. Results are grouped in the order
  /// that you supply these dimensions.
  core.List<core.String> dimensions;

  /// [Required] End date of the requested date range, in YYYY-MM-DD format, in
  /// PST (UTC - 8:00). Must be greater than or equal to the start date. This
  /// value is included in the range.
  core.String endDate;

  /// [Optional; Default is 1000] The maximum number of rows to return. Must be
  /// a number from 1 to 25,000 (inclusive).
  core.int rowLimit;

  /// [Optional; Default is \"web\"] The search type to filter for.
  /// Possible string values are:
  /// - "WEB"
  /// - "IMAGE"
  /// - "VIDEO"
  core.String searchType;

  /// [Required] Start date of the requested date range, in YYYY-MM-DD format,
  /// in PST time (UTC - 8:00). Must be less than or equal to the end date. This
  /// value is included in the range.
  core.String startDate;

  /// [Optional; Default is 0] Zero-based index of the first row in the
  /// response. Must be a non-negative number.
  core.int startRow;

  SearchAnalyticsQueryRequest();

  SearchAnalyticsQueryRequest.fromJson(core.Map _json) {
    if (_json.containsKey("aggregationType")) {
      aggregationType = _json["aggregationType"];
    }
    if (_json.containsKey("dimensionFilterGroups")) {
      dimensionFilterGroups = (_json["dimensionFilterGroups"] as core.List)
          .map<ApiDimensionFilterGroup>(
              (value) => new ApiDimensionFilterGroup.fromJson(value))
          .toList();
    }
    if (_json.containsKey("dimensions")) {
      dimensions = (_json["dimensions"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("endDate")) {
      endDate = _json["endDate"];
    }
    if (_json.containsKey("rowLimit")) {
      rowLimit = _json["rowLimit"];
    }
    if (_json.containsKey("searchType")) {
      searchType = _json["searchType"];
    }
    if (_json.containsKey("startDate")) {
      startDate = _json["startDate"];
    }
    if (_json.containsKey("startRow")) {
      startRow = _json["startRow"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (aggregationType != null) {
      _json["aggregationType"] = aggregationType;
    }
    if (dimensionFilterGroups != null) {
      _json["dimensionFilterGroups"] =
          dimensionFilterGroups.map((value) => (value).toJson()).toList();
    }
    if (dimensions != null) {
      _json["dimensions"] = dimensions;
    }
    if (endDate != null) {
      _json["endDate"] = endDate;
    }
    if (rowLimit != null) {
      _json["rowLimit"] = rowLimit;
    }
    if (searchType != null) {
      _json["searchType"] = searchType;
    }
    if (startDate != null) {
      _json["startDate"] = startDate;
    }
    if (startRow != null) {
      _json["startRow"] = startRow;
    }
    return _json;
  }
}

/// A list of rows, one per result, grouped by key. Metrics in each row are
/// aggregated for all data grouped by that key either by page or property, as
/// specified by the aggregation type parameter.
class SearchAnalyticsQueryResponse {
  /// How the results were aggregated.
  /// Possible string values are:
  /// - "AUTO"
  /// - "BY_PROPERTY"
  /// - "BY_PAGE"
  core.String responseAggregationType;

  /// A list of rows grouped by the key values in the order given in the query.
  core.List<ApiDataRow> rows;

  SearchAnalyticsQueryResponse();

  SearchAnalyticsQueryResponse.fromJson(core.Map _json) {
    if (_json.containsKey("responseAggregationType")) {
      responseAggregationType = _json["responseAggregationType"];
    }
    if (_json.containsKey("rows")) {
      rows = (_json["rows"] as core.List)
          .map<ApiDataRow>((value) => new ApiDataRow.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (responseAggregationType != null) {
      _json["responseAggregationType"] = responseAggregationType;
    }
    if (rows != null) {
      _json["rows"] = rows.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// List of sitemaps.
class SitemapsListResponse {
  /// Contains detailed information about a specific URL submitted as a
  /// [sitemap](https://support.google.com/webmasters/answer/156184).
  core.List<WmxSitemap> sitemap;

  SitemapsListResponse();

  SitemapsListResponse.fromJson(core.Map _json) {
    if (_json.containsKey("sitemap")) {
      sitemap = (_json["sitemap"] as core.List)
          .map<WmxSitemap>((value) => new WmxSitemap.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (sitemap != null) {
      _json["sitemap"] = sitemap.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// List of sites with access level information.
class SitesListResponse {
  /// Contains permission level information about a Search Console site. For
  /// more information, see [Permissions in Search
  /// Console](https://support.google.com/webmasters/answer/2451999).
  core.List<WmxSite> siteEntry;

  SitesListResponse();

  SitesListResponse.fromJson(core.Map _json) {
    if (_json.containsKey("siteEntry")) {
      siteEntry = (_json["siteEntry"] as core.List)
          .map<WmxSite>((value) => new WmxSite.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (siteEntry != null) {
      _json["siteEntry"] = siteEntry.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Final state of the test, including error details if necessary.
class TestStatus {
  /// Error details if applicable.
  core.String details;

  /// Status of the test.
  /// Possible string values are:
  /// - "TEST_STATUS_UNSPECIFIED" : Internal error when running this test.
  /// Please try running the test again.
  /// - "COMPLETE" : Inspection has completed without errors.
  /// - "INTERNAL_ERROR" : Inspection terminated in an error state. This
  /// indicates a problem in Google's infrastructure, not a user error. Please
  /// try again later.
  /// - "PAGE_UNREACHABLE" : Google can not access the URL because of a user
  /// error such as a robots.txt blockage, a 403 or 500 code etc. Please make
  /// sure that the URL provided is accessible by Googlebot and is not password
  /// protected.
  core.String status;

  TestStatus();

  TestStatus.fromJson(core.Map _json) {
    if (_json.containsKey("details")) {
      details = _json["details"];
    }
    if (_json.containsKey("status")) {
      status = _json["status"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (details != null) {
      _json["details"] = details;
    }
    if (status != null) {
      _json["status"] = status;
    }
    return _json;
  }
}

/// Contains permission level information about a Search Console site. For more
/// information, see [Permissions in Search
/// Console](https://support.google.com/webmasters/answer/2451999).
class WmxSite {
  /// The user's permission level for the site.
  /// Possible string values are:
  /// - "SITE_PERMISSION_LEVEL_UNSPECIFIED"
  /// - "SITE_OWNER" : Owner has complete access to the site.
  /// - "SITE_FULL_USER" : Full users can access all data, and perform most of
  /// the operations.
  /// - "SITE_RESTRICTED_USER" : Restricted users can access most of the data,
  /// and perform some operations.
  /// - "SITE_UNVERIFIED_USER" : Unverified user has no access to site's data.
  core.String permissionLevel;

  /// The URL of the site.
  core.String siteUrl;

  WmxSite();

  WmxSite.fromJson(core.Map _json) {
    if (_json.containsKey("permissionLevel")) {
      permissionLevel = _json["permissionLevel"];
    }
    if (_json.containsKey("siteUrl")) {
      siteUrl = _json["siteUrl"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (permissionLevel != null) {
      _json["permissionLevel"] = permissionLevel;
    }
    if (siteUrl != null) {
      _json["siteUrl"] = siteUrl;
    }
    return _json;
  }
}

/// Contains detailed information about a specific URL submitted as a
/// [sitemap](https://support.google.com/webmasters/answer/156184).
class WmxSitemap {
  /// The various content types in the sitemap.
  core.List<WmxSitemapContent> contents;

  /// Number of errors in the sitemap. These are issues with the sitemap itself
  /// that need to be fixed before it can be processed correctly.
  core.String errors;

  /// If true, the sitemap has not been processed.
  core.bool isPending;

  /// If true, the sitemap is a collection of sitemaps.
  core.bool isSitemapsIndex;

  /// Date & time in which this sitemap was last downloaded. Date format is in
  /// RFC 3339 format (yyyy-mm-dd).
  core.String lastDownloaded;

  /// Date & time in which this sitemap was submitted. Date format is in RFC
  /// 3339 format (yyyy-mm-dd).
  core.String lastSubmitted;

  /// The url of the sitemap.
  core.String path;

  /// The type of the sitemap. For example: `rssFeed`.
  /// Possible string values are:
  /// - "NOT_SITEMAP"
  /// - "URL_LIST"
  /// - "SITEMAP"
  /// - "RSS_FEED"
  /// - "ATOM_FEED"
  /// - "PATTERN_SITEMAP" : Unsupported sitemap types.
  /// - "OCEANFRONT"
  core.String type;

  /// Number of warnings for the sitemap. These are generally non-critical
  /// issues with URLs in the sitemaps.
  core.String warnings;

  WmxSitemap();

  WmxSitemap.fromJson(core.Map _json) {
    if (_json.containsKey("contents")) {
      contents = (_json["contents"] as core.List)
          .map<WmxSitemapContent>(
              (value) => new WmxSitemapContent.fromJson(value))
          .toList();
    }
    if (_json.containsKey("errors")) {
      errors = _json["errors"];
    }
    if (_json.containsKey("isPending")) {
      isPending = _json["isPending"];
    }
    if (_json.containsKey("isSitemapsIndex")) {
      isSitemapsIndex = _json["isSitemapsIndex"];
    }
    if (_json.containsKey("lastDownloaded")) {
      lastDownloaded = _json["lastDownloaded"];
    }
    if (_json.containsKey("lastSubmitted")) {
      lastSubmitted = _json["lastSubmitted"];
    }
    if (_json.containsKey("path")) {
      path = _json["path"];
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
    if (_json.containsKey("warnings")) {
      warnings = _json["warnings"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (contents != null) {
      _json["contents"] = contents.map((value) => (value).toJson()).toList();
    }
    if (errors != null) {
      _json["errors"] = errors;
    }
    if (isPending != null) {
      _json["isPending"] = isPending;
    }
    if (isSitemapsIndex != null) {
      _json["isSitemapsIndex"] = isSitemapsIndex;
    }
    if (lastDownloaded != null) {
      _json["lastDownloaded"] = lastDownloaded;
    }
    if (lastSubmitted != null) {
      _json["lastSubmitted"] = lastSubmitted;
    }
    if (path != null) {
      _json["path"] = path;
    }
    if (type != null) {
      _json["type"] = type;
    }
    if (warnings != null) {
      _json["warnings"] = warnings;
    }
    return _json;
  }
}

/// Information about the various content types in the sitemap.
class WmxSitemapContent {
  /// The number of URLs from the sitemap that were indexed (of the content
  /// type).
  core.String indexed;

  /// The number of URLs in the sitemap (of the content type).
  core.String submitted;

  /// The specific type of content in this sitemap. For example: `web`.
  /// Possible string values are:
  /// - "WEB"
  /// - "IMAGE"
  /// - "VIDEO"
  /// - "NEWS"
  /// - "MOBILE"
  /// - "ANDROID_APP"
  /// - "PATTERN" : Unsupported content type.
  /// - "IOS_APP"
  /// - "DATA_FEED_ELEMENT" : Unsupported content type.
  core.String type;

  WmxSitemapContent();

  WmxSitemapContent.fromJson(core.Map _json) {
    if (_json.containsKey("indexed")) {
      indexed = _json["indexed"];
    }
    if (_json.containsKey("submitted")) {
      submitted = _json["submitted"];
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (indexed != null) {
      _json["indexed"] = indexed;
    }
    if (submitted != null) {
      _json["submitted"] = submitted;
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

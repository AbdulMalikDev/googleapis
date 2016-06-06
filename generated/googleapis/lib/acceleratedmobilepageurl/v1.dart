// This is a generated file (see the discoveryapis_generator project).

library googleapis.acceleratedmobilepageurl.v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client acceleratedmobilepageurl/v1';

/**
 * This API contains a single method, batchGet. Call this method to retrieve the
 * AMP URL (and equivalent AMP Cache URL) for given public URL(s).
 */
class AcceleratedmobilepageurlApi {

  final commons.ApiRequester _requester;

  AmpUrlsResourceApi get ampUrls => new AmpUrlsResourceApi(_requester);

  AcceleratedmobilepageurlApi(http.Client client, {core.String rootUrl: "https://acceleratedmobilepageurl.googleapis.com/", core.String servicePath: ""}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}


class AmpUrlsResourceApi {
  final commons.ApiRequester _requester;

  AmpUrlsResourceApi(commons.ApiRequester client) : 
      _requester = client;

  /**
   * Returns AMP URL(s) and equivalent
   * [AMP Cache URL(s)](/amp/cache/overview#amp-cache-url-format).
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [BatchGetAmpUrlsResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<BatchGetAmpUrlsResponse> batchGet(BatchGetAmpUrlsRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'v1/ampUrls:batchGet';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new BatchGetAmpUrlsResponse.fromJson(data));
  }

}



/** AMP URL response for a requested URL. */
class AmpUrl {
  /** The AMP URL pointing to the publisher's web server. */
  core.String ampUrl;
  /**
   * The [AMP Cache URL](/amp/cache/overview#amp-cache-url-format) pointing to
   * the cached document in the Google AMP Cache.
   */
  core.String cdnAmpUrl;
  /** The original non-AMP URL. */
  core.String originalUrl;

  AmpUrl();

  AmpUrl.fromJson(core.Map _json) {
    if (_json.containsKey("ampUrl")) {
      ampUrl = _json["ampUrl"];
    }
    if (_json.containsKey("cdnAmpUrl")) {
      cdnAmpUrl = _json["cdnAmpUrl"];
    }
    if (_json.containsKey("originalUrl")) {
      originalUrl = _json["originalUrl"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (ampUrl != null) {
      _json["ampUrl"] = ampUrl;
    }
    if (cdnAmpUrl != null) {
      _json["cdnAmpUrl"] = cdnAmpUrl;
    }
    if (originalUrl != null) {
      _json["originalUrl"] = originalUrl;
    }
    return _json;
  }
}

/** AMP URL Error resource for a requested URL that couldn't be found. */
class AmpUrlError {
  /**
   * The error code of an API call.
   * Possible string values are:
   * - "ERROR_CODE_UNSPECIFIED" : Not specified error.
   * - "INPUT_URL_NOT_FOUND" : Indicates the requested URL is not found for some
   * reason -- for example,
   * we receive an HTTP error code 404 when it is crawled.
   * - "NO_AMP_URL" : Indicates no AMP URL has been found in the HTML of the
   * requested URL.
   * - "APPLICATION_ERROR" : Indicates some kind of application error occurred
   * at the server.
   * Client advised to retry.
   * - "URL_IS_VALID_AMP" : Indicates the requested URL is a valid AMP URL.
   * - "URL_IS_INVALID_AMP" : Indicates that the requested URL is an invalid AMP
   * URL.
   */
  core.String errorCode;
  /** An optional descriptive error message. */
  core.String errorMessage;
  /** The original non-AMP URL. */
  core.String originalUrl;

  AmpUrlError();

  AmpUrlError.fromJson(core.Map _json) {
    if (_json.containsKey("errorCode")) {
      errorCode = _json["errorCode"];
    }
    if (_json.containsKey("errorMessage")) {
      errorMessage = _json["errorMessage"];
    }
    if (_json.containsKey("originalUrl")) {
      originalUrl = _json["originalUrl"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (errorCode != null) {
      _json["errorCode"] = errorCode;
    }
    if (errorMessage != null) {
      _json["errorMessage"] = errorMessage;
    }
    if (originalUrl != null) {
      _json["originalUrl"] = originalUrl;
    }
    return _json;
  }
}

/** AMP URL request for a batch of URLs. */
class BatchGetAmpUrlsRequest {
  /**
   * List of URLs to look up for the paired AMP URLs.
   * The URLs are case-sensitive. Up to 10 URLs per lookup
   * (see [Usage Limits](/amp/cache/reference/limits)).
   */
  core.List<core.String> urls;

  BatchGetAmpUrlsRequest();

  BatchGetAmpUrlsRequest.fromJson(core.Map _json) {
    if (_json.containsKey("urls")) {
      urls = _json["urls"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (urls != null) {
      _json["urls"] = urls;
    }
    return _json;
  }
}

/** Batch AMP URL response. */
class BatchGetAmpUrlsResponse {
  /**
   * For each URL in BatchAmpUrlsRequest, the URL response. The response might
   * not be in the same order as URLs in the batch request.
   * If BatchAmpUrlsRequest contains duplicate URLs, AmpUrl is generated
   * only once.
   */
  core.List<AmpUrl> ampUrls;
  /** The errors for requested URLs that have no AMP URL. */
  core.List<AmpUrlError> urlErrors;

  BatchGetAmpUrlsResponse();

  BatchGetAmpUrlsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("ampUrls")) {
      ampUrls = _json["ampUrls"].map((value) => new AmpUrl.fromJson(value)).toList();
    }
    if (_json.containsKey("urlErrors")) {
      urlErrors = _json["urlErrors"].map((value) => new AmpUrlError.fromJson(value)).toList();
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (ampUrls != null) {
      _json["ampUrls"] = ampUrls.map((value) => (value).toJson()).toList();
    }
    if (urlErrors != null) {
      _json["urlErrors"] = urlErrors.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

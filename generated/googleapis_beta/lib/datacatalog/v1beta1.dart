// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: unused_import, unnecessary_cast

library googleapis_beta.datacatalog.v1beta1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client datacatalog/v1beta1';

/// A fully managed and highly scalable data discovery and metadata management
/// service.
class DatacatalogApi {
  /// View and manage your data across Google Cloud Platform services
  static const CloudPlatformScope =
      "https://www.googleapis.com/auth/cloud-platform";

  final commons.ApiRequester _requester;

  CatalogResourceApi get catalog => new CatalogResourceApi(_requester);
  EntriesResourceApi get entries => new EntriesResourceApi(_requester);
  ProjectsResourceApi get projects => new ProjectsResourceApi(_requester);

  DatacatalogApi(http.Client client,
      {core.String rootUrl = "https://datacatalog.googleapis.com/",
      core.String servicePath = ""})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class CatalogResourceApi {
  final commons.ApiRequester _requester;

  CatalogResourceApi(commons.ApiRequester client) : _requester = client;

  /// Searches Data Catalog for multiple resources like entries, tags that match
  /// a query. This is a custom method
  /// (https://cloud.google.com/apis/design/custom_methods) and does not return
  /// the complete resource, only the resource identifier and high level fields.
  /// Clients can subsequentally call `Get` methods. Note that Data Catalog
  /// search queries do not guarantee full recall. Query results that match your
  /// query may not be returned, even in subsequent result pages. Also note that
  /// results returned (and not returned) can vary across repeated search
  /// queries. See [Data Catalog Search
  /// Syntax](https://cloud.google.com/data-catalog/docs/how-to/search-reference)
  /// for more information.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1SearchCatalogResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1SearchCatalogResponse> search(
      GoogleCloudDatacatalogV1beta1SearchCatalogRequest request,
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

    _url = 'v1beta1/catalog:search';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1SearchCatalogResponse.fromJson(data));
  }
}

class EntriesResourceApi {
  final commons.ApiRequester _requester;

  EntriesResourceApi(commons.ApiRequester client) : _requester = client;

  /// Get an entry by target resource name. This method allows clients to use
  /// the resource name from the source Google Cloud Platform service to get the
  /// Data Catalog Entry.
  ///
  /// Request parameters:
  ///
  /// [sqlResource] - The SQL name of the entry. SQL names are case-sensitive.
  /// Examples: * `pubsub.project_id.topic_id` *
  /// ``pubsub.project_id.`topic.id.with.dots` `` *
  /// `bigquery.table.project_id.dataset_id.table_id` *
  /// `bigquery.dataset.project_id.dataset_id` *
  /// `datacatalog.entry.project_id.location_id.entry_group_id.entry_id` `*_id`s
  /// shoud satisfy the standard SQL rules for identifiers.
  /// https://cloud.google.com/bigquery/docs/reference/standard-sql/lexical.
  ///
  /// [linkedResource] - The full name of the Google Cloud Platform resource the
  /// Data Catalog entry represents. See:
  /// https://cloud.google.com/apis/design/resource_names#full_resource_name.
  /// Full names are case-sensitive. Examples: *
  /// //bigquery.googleapis.com/projects/projectId/datasets/datasetId/tables/tableId
  /// * //pubsub.googleapis.com/projects/projectId/topics/topicId
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Entry].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Entry> lookup(
      {core.String sqlResource,
      core.String linkedResource,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (sqlResource != null) {
      _queryParams["sqlResource"] = [sqlResource];
    }
    if (linkedResource != null) {
      _queryParams["linkedResource"] = [linkedResource];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/entries:lookup';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudDatacatalogV1beta1Entry.fromJson(data));
  }
}

class ProjectsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsResourceApi get locations =>
      new ProjectsLocationsResourceApi(_requester);

  ProjectsResourceApi(commons.ApiRequester client) : _requester = client;
}

class ProjectsLocationsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsEntryGroupsResourceApi get entryGroups =>
      new ProjectsLocationsEntryGroupsResourceApi(_requester);
  ProjectsLocationsTagTemplatesResourceApi get tagTemplates =>
      new ProjectsLocationsTagTemplatesResourceApi(_requester);
  ProjectsLocationsTaxonomiesResourceApi get taxonomies =>
      new ProjectsLocationsTaxonomiesResourceApi(_requester);

  ProjectsLocationsResourceApi(commons.ApiRequester client)
      : _requester = client;
}

class ProjectsLocationsEntryGroupsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsEntryGroupsEntriesResourceApi get entries =>
      new ProjectsLocationsEntryGroupsEntriesResourceApi(_requester);
  ProjectsLocationsEntryGroupsTagsResourceApi get tags =>
      new ProjectsLocationsEntryGroupsTagsResourceApi(_requester);

  ProjectsLocationsEntryGroupsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// A maximum of 10,000 entry groups may be created per organization across
  /// all locations. Users should enable the Data Catalog API in the project
  /// identified by the `parent` parameter (see [Data Catalog Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the project this entry group is in.
  /// Example: * projects/{project_id}/locations/{location} Note that this
  /// EntryGroup and its child resources may not actually be stored in the
  /// location in this name.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [entryGroupId] - Required. The id of the entry group to create. The id
  /// must begin with a letter or underscore, contain only English letters,
  /// numbers and underscores, and be at most 64 characters.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1EntryGroup].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1EntryGroup> create(
      GoogleCloudDatacatalogV1beta1EntryGroup request, core.String parent,
      {core.String entryGroupId, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (entryGroupId != null) {
      _queryParams["entryGroupId"] = [entryGroupId];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/entryGroups';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1EntryGroup.fromJson(data));
  }

  /// Deletes an EntryGroup. Only entry groups that do not contain entries can
  /// be deleted. Users should enable the Data Catalog API in the project
  /// identified by the `name` parameter (see [Data Catalog Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information).
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the entry group. For example,
  /// `projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}`.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [force] - Optional. If true, deletes all entries in the entry group.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name,
      {core.bool force, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (force != null) {
      _queryParams["force"] = ["${force}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Gets an EntryGroup.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the entry group. For example,
  /// `projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}`.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [readMask] - The fields to return. If not set or empty, all fields are
  /// returned.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1EntryGroup].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1EntryGroup> get(core.String name,
      {core.String readMask, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (readMask != null) {
      _queryParams["readMask"] = [readMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1EntryGroup.fromJson(data));
  }

  /// Gets the access control policy for a resource. A `NOT_FOUND` error is
  /// returned if the resource does not exist. An empty policy is returned if
  /// the resource exists but does not have a policy set on it. Supported
  /// resources are: - Tag templates. - Entries. - Entry groups. Note, this
  /// method cannot be used to manage policies for BigQuery, Pub/Sub and any
  /// external Google Cloud Platform resources synced to Data Catalog. Callers
  /// must have following Google IAM permission -
  /// `datacatalog.tagTemplates.getIamPolicy` to get policies on tag templates.
  /// - `datacatalog.entries.getIamPolicy` to get policies on entries. -
  /// `datacatalog.entryGroups.getIamPolicy` to get policies on entry groups.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Policy> getIamPolicy(
      GetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':getIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /// Lists entry groups.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the location that contains the entry
  /// groups, which can be provided in URL format. Example: *
  /// projects/{project_id}/locations/{location}
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [pageSize] - Optional. The maximum number of items to return. Default is
  /// 10. Max limit is 1000. Throws an invalid argument for `page_size > 1000`.
  ///
  /// [pageToken] - Optional. Token that specifies which page is requested. If
  /// empty, the first page is returned.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1ListEntryGroupsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1ListEntryGroupsResponse> list(
      core.String parent,
      {core.int pageSize,
      core.String pageToken,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/entryGroups';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1ListEntryGroupsResponse.fromJson(
            data));
  }

  /// Updates an EntryGroup. The user should enable the Data Catalog API in the
  /// project identified by the `entry_group.name` parameter (see [Data Catalog
  /// Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The resource name of the entry group in URL format. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}
  /// Note that this EntryGroup and its child resources may not actually be
  /// stored in the location in this name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [updateMask] - The fields to update on the entry group. If absent or
  /// empty, all modifiable fields are updated.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1EntryGroup].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1EntryGroup> patch(
      GoogleCloudDatacatalogV1beta1EntryGroup request, core.String name,
      {core.String updateMask, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1EntryGroup.fromJson(data));
  }

  /// Sets the access control policy for a resource. Replaces any existing
  /// policy. Supported resources are: - Tag templates. - Entries. - Entry
  /// groups. Note, this method cannot be used to manage policies for BigQuery,
  /// Pub/Sub and any external Google Cloud Platform resources synced to Data
  /// Catalog. Callers must have following Google IAM permission -
  /// `datacatalog.tagTemplates.setIamPolicy` to set policies on tag templates.
  /// - `datacatalog.entries.setIamPolicy` to set policies on entries. -
  /// `datacatalog.entryGroups.setIamPolicy` to set policies on entry groups.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// specified. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Policy> setIamPolicy(
      SetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':setIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /// Returns the caller's permissions on a resource. If the resource does not
  /// exist, an empty set of permissions is returned (We don't return a
  /// `NOT_FOUND` error). Supported resources are: - Tag templates. - Entries. -
  /// Entry groups. Note, this method cannot be used to manage policies for
  /// BigQuery, Pub/Sub and any external Google Cloud Platform resources synced
  /// to Data Catalog. A caller is not required to have Google IAM permission to
  /// make this request.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy detail is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TestIamPermissionsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TestIamPermissionsResponse> testIamPermissions(
      TestIamPermissionsRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':testIamPermissions';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new TestIamPermissionsResponse.fromJson(data));
  }
}

class ProjectsLocationsEntryGroupsEntriesResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsEntryGroupsEntriesTagsResourceApi get tags =>
      new ProjectsLocationsEntryGroupsEntriesTagsResourceApi(_requester);

  ProjectsLocationsEntryGroupsEntriesResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates an entry. Only entries of 'FILESET' type or user-specified type
  /// can be created. Users should enable the Data Catalog API in the project
  /// identified by the `parent` parameter (see [Data Catalog Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information). A maximum of 100,000 entries may be created per entry
  /// group.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the entry group this entry is in.
  /// Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}
  /// Note that this Entry and its child resources may not actually be stored in
  /// the location in this name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [entryId] - Required. The id of the entry to create.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Entry].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Entry> create(
      GoogleCloudDatacatalogV1beta1Entry request, core.String parent,
      {core.String entryId, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (entryId != null) {
      _queryParams["entryId"] = [entryId];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/entries';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudDatacatalogV1beta1Entry.fromJson(data));
  }

  /// Deletes an existing entry. Only entries created through CreateEntry method
  /// can be deleted. Users should enable the Data Catalog API in the project
  /// identified by the `name` parameter (see [Data Catalog Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information).
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the entry. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/entries/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Gets an entry.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the entry. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/entries/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Entry].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Entry> get(core.String name,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudDatacatalogV1beta1Entry.fromJson(data));
  }

  /// Gets the access control policy for a resource. A `NOT_FOUND` error is
  /// returned if the resource does not exist. An empty policy is returned if
  /// the resource exists but does not have a policy set on it. Supported
  /// resources are: - Tag templates. - Entries. - Entry groups. Note, this
  /// method cannot be used to manage policies for BigQuery, Pub/Sub and any
  /// external Google Cloud Platform resources synced to Data Catalog. Callers
  /// must have following Google IAM permission -
  /// `datacatalog.tagTemplates.getIamPolicy` to get policies on tag templates.
  /// - `datacatalog.entries.getIamPolicy` to get policies on entries. -
  /// `datacatalog.entryGroups.getIamPolicy` to get policies on entry groups.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/entries/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Policy> getIamPolicy(
      GetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':getIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /// Lists entries.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the entry group that contains the
  /// entries, which can be provided in URL format. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [pageToken] - Token that specifies which page is requested. If empty, the
  /// first page is returned.
  ///
  /// [readMask] - The fields to return for each Entry. If not set or empty, all
  /// fields are returned. For example, setting read_mask to contain only one
  /// path "name" will cause ListEntries to return a list of Entries with only
  /// "name" field.
  ///
  /// [pageSize] - The maximum number of items to return. Default is 10. Max
  /// limit is 1000. Throws an invalid argument for `page_size > 1000`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1ListEntriesResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1ListEntriesResponse> list(
      core.String parent,
      {core.String pageToken,
      core.String readMask,
      core.int pageSize,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (readMask != null) {
      _queryParams["readMask"] = [readMask];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/entries';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1ListEntriesResponse.fromJson(data));
  }

  /// Updates an existing entry. Users should enable the Data Catalog API in the
  /// project identified by the `entry.name` parameter (see [Data Catalog
  /// Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The Data Catalog resource name of the entry in URL format.
  /// Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}
  /// Note that this Entry and its child resources may not actually be stored in
  /// the location in this name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/entries/[^/]+$".
  ///
  /// [updateMask] - The fields to update on the entry. If absent or empty, all
  /// modifiable fields are updated. The following fields are modifiable: * For
  /// entries with type `DATA_STREAM`: * `schema` * For entries with type
  /// `FILESET` * `schema` * `display_name` * `description` * `gcs_fileset_spec`
  /// * `gcs_fileset_spec.file_patterns` * For entries with
  /// `user_specified_type` * `schema` * `display_name` * `description` *
  /// user_specified_type * user_specified_system * linked_resource *
  /// source_system_timestamps
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Entry].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Entry> patch(
      GoogleCloudDatacatalogV1beta1Entry request, core.String name,
      {core.String updateMask, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudDatacatalogV1beta1Entry.fromJson(data));
  }

  /// Returns the caller's permissions on a resource. If the resource does not
  /// exist, an empty set of permissions is returned (We don't return a
  /// `NOT_FOUND` error). Supported resources are: - Tag templates. - Entries. -
  /// Entry groups. Note, this method cannot be used to manage policies for
  /// BigQuery, Pub/Sub and any external Google Cloud Platform resources synced
  /// to Data Catalog. A caller is not required to have Google IAM permission to
  /// make this request.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy detail is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/entries/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TestIamPermissionsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TestIamPermissionsResponse> testIamPermissions(
      TestIamPermissionsRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':testIamPermissions';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new TestIamPermissionsResponse.fromJson(data));
  }
}

class ProjectsLocationsEntryGroupsEntriesTagsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsEntryGroupsEntriesTagsResourceApi(
      commons.ApiRequester client)
      : _requester = client;

  /// Creates a tag on an Entry. Note: The project identified by the `parent`
  /// parameter for the
  /// [tag](https://cloud.google.com/data-catalog/docs/reference/rest/v1beta1/projects.locations.entryGroups.entries.tags/create#path-parameters)
  /// and the [tag
  /// template](https://cloud.google.com/data-catalog/docs/reference/rest/v1beta1/projects.locations.tagTemplates/create#path-parameters)
  /// used to create the tag must be from the same organization.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the resource to attach this tag to. Tags
  /// can be attached to Entries. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}
  /// Note that this Tag and its child resources may not actually be stored in
  /// the location in this name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/entries/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Tag].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Tag> create(
      GoogleCloudDatacatalogV1beta1Tag request, core.String parent,
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
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1beta1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/tags';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudDatacatalogV1beta1Tag.fromJson(data));
  }

  /// Deletes a tag.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the tag to delete. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}/tags/{tag_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/entries/[^/]+/tags/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Lists the tags on an Entry.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the Data Catalog resource to list the
  /// tags of. The resource could be an Entry or an EntryGroup. Examples: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id} *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/entries/[^/]+$".
  ///
  /// [pageToken] - Token that specifies which page is requested. If empty, the
  /// first page is returned.
  ///
  /// [pageSize] - The maximum number of tags to return. Default is 10. Max
  /// limit is 1000.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1ListTagsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1ListTagsResponse> list(
      core.String parent,
      {core.String pageToken,
      core.int pageSize,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1beta1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/tags';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1ListTagsResponse.fromJson(data));
  }

  /// Updates an existing tag.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The resource name of the tag in URL format. Example: *
  /// projects/{project_id}/locations/{location}/entrygroups/{entry_group_id}/entries/{entry_id}/tags/{tag_id}
  /// where `tag_id` is a system-generated identifier. Note that this Tag may
  /// not actually be stored in the location in this name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/entries/[^/]+/tags/[^/]+$".
  ///
  /// [updateMask] - The fields to update on the Tag. If absent or empty, all
  /// modifiable fields are updated. Currently the only modifiable field is the
  /// field `fields`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Tag].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Tag> patch(
      GoogleCloudDatacatalogV1beta1Tag request, core.String name,
      {core.String updateMask, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudDatacatalogV1beta1Tag.fromJson(data));
  }
}

class ProjectsLocationsEntryGroupsTagsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsEntryGroupsTagsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a tag on an Entry. Note: The project identified by the `parent`
  /// parameter for the
  /// [tag](https://cloud.google.com/data-catalog/docs/reference/rest/v1beta1/projects.locations.entryGroups.entries.tags/create#path-parameters)
  /// and the [tag
  /// template](https://cloud.google.com/data-catalog/docs/reference/rest/v1beta1/projects.locations.tagTemplates/create#path-parameters)
  /// used to create the tag must be from the same organization.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the resource to attach this tag to. Tags
  /// can be attached to Entries. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}
  /// Note that this Tag and its child resources may not actually be stored in
  /// the location in this name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Tag].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Tag> create(
      GoogleCloudDatacatalogV1beta1Tag request, core.String parent,
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
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1beta1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/tags';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudDatacatalogV1beta1Tag.fromJson(data));
  }

  /// Deletes a tag.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the tag to delete. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}/tags/{tag_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/tags/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Lists the tags on an Entry.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the Data Catalog resource to list the
  /// tags of. The resource could be an Entry or an EntryGroup. Examples: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id} *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+$".
  ///
  /// [pageSize] - The maximum number of tags to return. Default is 10. Max
  /// limit is 1000.
  ///
  /// [pageToken] - Token that specifies which page is requested. If empty, the
  /// first page is returned.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1ListTagsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1ListTagsResponse> list(
      core.String parent,
      {core.int pageSize,
      core.String pageToken,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1beta1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/tags';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1ListTagsResponse.fromJson(data));
  }

  /// Updates an existing tag.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The resource name of the tag in URL format. Example: *
  /// projects/{project_id}/locations/{location}/entrygroups/{entry_group_id}/entries/{entry_id}/tags/{tag_id}
  /// where `tag_id` is a system-generated identifier. Note that this Tag may
  /// not actually be stored in the location in this name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/entryGroups/[^/]+/tags/[^/]+$".
  ///
  /// [updateMask] - The fields to update on the Tag. If absent or empty, all
  /// modifiable fields are updated. Currently the only modifiable field is the
  /// field `fields`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Tag].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Tag> patch(
      GoogleCloudDatacatalogV1beta1Tag request, core.String name,
      {core.String updateMask, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudDatacatalogV1beta1Tag.fromJson(data));
  }
}

class ProjectsLocationsTagTemplatesResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsTagTemplatesFieldsResourceApi get fields =>
      new ProjectsLocationsTagTemplatesFieldsResourceApi(_requester);

  ProjectsLocationsTagTemplatesResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a tag template. The user should enable the Data Catalog API in the
  /// project identified by the `parent` parameter (see [Data Catalog Resource
  /// Project](https://cloud.google.com/data-catalog/docs/concepts/resource-project)
  /// for more information).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the project and the template location
  /// [region](https://cloud.google.com/data-catalog/docs/concepts/regions.
  /// Example: * projects/{project_id}/locations/us-central1
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [tagTemplateId] - Required. The id of the tag template to create.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1TagTemplate].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1TagTemplate> create(
      GoogleCloudDatacatalogV1beta1TagTemplate request, core.String parent,
      {core.String tagTemplateId, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (tagTemplateId != null) {
      _queryParams["tagTemplateId"] = [tagTemplateId];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/tagTemplates';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1TagTemplate.fromJson(data));
  }

  /// Deletes a tag template and all tags using the template. Users should
  /// enable the Data Catalog API in the project identified by the `name`
  /// parameter (see [Data Catalog Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information).
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the tag template to delete. Example: *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+$".
  ///
  /// [force] - Required. Currently, this field must always be set to `true`.
  /// This confirms the deletion of any possible tags using this template.
  /// `force = false` will be supported in the future.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name,
      {core.bool force, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (force != null) {
      _queryParams["force"] = ["${force}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Gets a tag template.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the tag template. Example: *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1TagTemplate].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1TagTemplate> get(core.String name,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1TagTemplate.fromJson(data));
  }

  /// Gets the access control policy for a resource. A `NOT_FOUND` error is
  /// returned if the resource does not exist. An empty policy is returned if
  /// the resource exists but does not have a policy set on it. Supported
  /// resources are: - Tag templates. - Entries. - Entry groups. Note, this
  /// method cannot be used to manage policies for BigQuery, Pub/Sub and any
  /// external Google Cloud Platform resources synced to Data Catalog. Callers
  /// must have following Google IAM permission -
  /// `datacatalog.tagTemplates.getIamPolicy` to get policies on tag templates.
  /// - `datacatalog.entries.getIamPolicy` to get policies on entries. -
  /// `datacatalog.entryGroups.getIamPolicy` to get policies on entry groups.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Policy> getIamPolicy(
      GetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':getIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /// Updates a tag template. This method cannot be used to update the fields of
  /// a template. The tag template fields are represented as separate resources
  /// and should be updated using their own create/update/delete methods. Users
  /// should enable the Data Catalog API in the project identified by the
  /// `tag_template.name` parameter (see [Data Catalog Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The resource name of the tag template in URL format. Example: *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template_id}
  /// Note that this TagTemplate and its child resources may not actually be
  /// stored in the location in this name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+$".
  ///
  /// [updateMask] - The field mask specifies the parts of the template to
  /// overwrite. Allowed fields: * `display_name` If absent or empty, all of the
  /// allowed fields above will be updated.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1TagTemplate].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1TagTemplate> patch(
      GoogleCloudDatacatalogV1beta1TagTemplate request, core.String name,
      {core.String updateMask, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1TagTemplate.fromJson(data));
  }

  /// Sets the access control policy for a resource. Replaces any existing
  /// policy. Supported resources are: - Tag templates. - Entries. - Entry
  /// groups. Note, this method cannot be used to manage policies for BigQuery,
  /// Pub/Sub and any external Google Cloud Platform resources synced to Data
  /// Catalog. Callers must have following Google IAM permission -
  /// `datacatalog.tagTemplates.setIamPolicy` to set policies on tag templates.
  /// - `datacatalog.entries.setIamPolicy` to set policies on entries. -
  /// `datacatalog.entryGroups.setIamPolicy` to set policies on entry groups.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// specified. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Policy> setIamPolicy(
      SetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':setIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /// Returns the caller's permissions on a resource. If the resource does not
  /// exist, an empty set of permissions is returned (We don't return a
  /// `NOT_FOUND` error). Supported resources are: - Tag templates. - Entries. -
  /// Entry groups. Note, this method cannot be used to manage policies for
  /// BigQuery, Pub/Sub and any external Google Cloud Platform resources synced
  /// to Data Catalog. A caller is not required to have Google IAM permission to
  /// make this request.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy detail is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TestIamPermissionsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TestIamPermissionsResponse> testIamPermissions(
      TestIamPermissionsRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':testIamPermissions';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new TestIamPermissionsResponse.fromJson(data));
  }
}

class ProjectsLocationsTagTemplatesFieldsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsTagTemplatesFieldsEnumValuesResourceApi get enumValues =>
      new ProjectsLocationsTagTemplatesFieldsEnumValuesResourceApi(_requester);

  ProjectsLocationsTagTemplatesFieldsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a field in a tag template. The user should enable the Data Catalog
  /// API in the project identified by the `parent` parameter (see [Data Catalog
  /// Resource
  /// Project](https://cloud.google.com/data-catalog/docs/concepts/resource-project)
  /// for more information).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the project and the template location
  /// [region](https://cloud.google.com/data-catalog/docs/concepts/regions).
  /// Example: *
  /// projects/{project_id}/locations/us-central1/tagTemplates/{tag_template_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+$".
  ///
  /// [tagTemplateFieldId] - Required. The ID of the tag template field to
  /// create. Field ids can contain letters (both uppercase and lowercase),
  /// numbers (0-9), underscores (_) and dashes (-). Field IDs must be at least
  /// 1 character long and at most 128 characters long. Field IDs must also be
  /// unique within their template.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1TagTemplateField].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1TagTemplateField> create(
      GoogleCloudDatacatalogV1beta1TagTemplateField request, core.String parent,
      {core.String tagTemplateFieldId, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (tagTemplateFieldId != null) {
      _queryParams["tagTemplateFieldId"] = [tagTemplateFieldId];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/fields';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1TagTemplateField.fromJson(data));
  }

  /// Deletes a field in a tag template and all uses of that field. Users should
  /// enable the Data Catalog API in the project identified by the `name`
  /// parameter (see [Data Catalog Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information).
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the tag template field to delete. Example:
  /// *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template_id}/fields/{tag_template_field_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+/fields/[^/]+$".
  ///
  /// [force] - Required. Currently, this field must always be set to `true`.
  /// This confirms the deletion of this field from any tags using this field.
  /// `force = false` will be supported in the future.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name,
      {core.bool force, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (force != null) {
      _queryParams["force"] = ["${force}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Updates a field in a tag template. This method cannot be used to update
  /// the field type. Users should enable the Data Catalog API in the project
  /// identified by the `name` parameter (see [Data Catalog Resource Project]
  /// (https://cloud.google.com/data-catalog/docs/concepts/resource-project) for
  /// more information).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the tag template field. Example: *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template_id}/fields/{tag_template_field_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+/fields/[^/]+$".
  ///
  /// [updateMask] - Optional. The field mask specifies the parts of the
  /// template to be updated. Allowed fields: * `display_name` *
  /// `type.enum_type` * `is_required` If `update_mask` is not set or empty, all
  /// of the allowed fields above will be updated. When updating an enum type,
  /// the provided values will be merged with the existing values. Therefore,
  /// enum values can only be added, existing enum values cannot be deleted nor
  /// renamed. Updating a template field from optional to required is NOT
  /// allowed.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1TagTemplateField].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1TagTemplateField> patch(
      GoogleCloudDatacatalogV1beta1TagTemplateField request, core.String name,
      {core.String updateMask, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1TagTemplateField.fromJson(data));
  }

  /// Renames a field in a tag template. The user should enable the Data Catalog
  /// API in the project identified by the `name` parameter (see [Data Catalog
  /// Resource
  /// Project](https://cloud.google.com/data-catalog/docs/concepts/resource-project)
  /// for more information).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the tag template. Example: *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template_id}/fields/{tag_template_field_id}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+/fields/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1TagTemplateField].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1TagTemplateField> rename(
      GoogleCloudDatacatalogV1beta1RenameTagTemplateFieldRequest request,
      core.String name,
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
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name') + ':rename';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1TagTemplateField.fromJson(data));
  }
}

class ProjectsLocationsTagTemplatesFieldsEnumValuesResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsTagTemplatesFieldsEnumValuesResourceApi(
      commons.ApiRequester client)
      : _requester = client;

  /// Renames an enum value in a tag template. The enum values have to be unique
  /// within one enum field. Thus, an enum value cannot be renamed with a name
  /// used in any other enum value within the same enum field.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the enum field value. Example: *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template_id}/fields/{tag_template_field_id}/enumValues/{enum_value_display_name}
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/tagTemplates/[^/]+/fields/[^/]+/enumValues/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1TagTemplateField].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1TagTemplateField> rename(
      GoogleCloudDatacatalogV1beta1RenameTagTemplateFieldEnumValueRequest
          request,
      core.String name,
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
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name') + ':rename';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1TagTemplateField.fromJson(data));
  }
}

class ProjectsLocationsTaxonomiesResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsTaxonomiesPolicyTagsResourceApi get policyTags =>
      new ProjectsLocationsTaxonomiesPolicyTagsResourceApi(_requester);

  ProjectsLocationsTaxonomiesResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a taxonomy in the specified project.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Resource name of the project that the taxonomy will
  /// belong to.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Taxonomy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Taxonomy> create(
      GoogleCloudDatacatalogV1beta1Taxonomy request, core.String parent,
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
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/taxonomies';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1Taxonomy.fromJson(data));
  }

  /// Deletes a taxonomy. This operation will also delete all policy tags in
  /// this taxonomy along with their associated policies.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. Resource name of the taxonomy to be deleted. All policy
  /// tags in this taxonomy will also be deleted.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Exports all taxonomies and their policy tags in a project. This method
  /// generates SerializedTaxonomy protos with nested policy tags that can be
  /// used as an input for future ImportTaxonomies calls.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Resource name of the project that taxonomies to be
  /// exported will share.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [taxonomies] - Required. Resource names of the taxonomies to be exported.
  ///
  /// [serializedTaxonomies] - Export taxonomies as serialized taxonomies.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1ExportTaxonomiesResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1ExportTaxonomiesResponse> export(
      core.String parent,
      {core.List<core.String> taxonomies,
      core.bool serializedTaxonomies,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (taxonomies != null) {
      _queryParams["taxonomies"] = taxonomies;
    }
    if (serializedTaxonomies != null) {
      _queryParams["serializedTaxonomies"] = ["${serializedTaxonomies}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/taxonomies:export';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1ExportTaxonomiesResponse.fromJson(
            data));
  }

  /// Gets a taxonomy.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. Resource name of the requested taxonomy.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Taxonomy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Taxonomy> get(core.String name,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1Taxonomy.fromJson(data));
  }

  /// Gets the IAM policy for a taxonomy or a policy tag.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Policy> getIamPolicy(
      GetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':getIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /// Imports all taxonomies and their policy tags to a project as new
  /// taxonomies. This method provides a bulk taxonomy / policy tag creation
  /// using nested proto structure.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Resource name of project that the imported taxonomies
  /// will belong to.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1ImportTaxonomiesResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1ImportTaxonomiesResponse> import(
      GoogleCloudDatacatalogV1beta1ImportTaxonomiesRequest request,
      core.String parent,
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
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/taxonomies:import';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1ImportTaxonomiesResponse.fromJson(
            data));
  }

  /// Lists all taxonomies in a project in a particular location that the caller
  /// has permission to view.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Resource name of the project to list the taxonomies
  /// of.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [pageToken] - The next_page_token value returned from a previous list
  /// request, if any. If not set, defaults to an empty string.
  ///
  /// [pageSize] - The maximum number of items to return. Must be a value
  /// between 1 and 1000. If not set, defaults to 50.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1ListTaxonomiesResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1ListTaxonomiesResponse> list(
      core.String parent,
      {core.String pageToken,
      core.int pageSize,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/taxonomies';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1ListTaxonomiesResponse.fromJson(data));
  }

  /// Updates a taxonomy.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Output only. Resource name of this taxonomy, whose format is:
  /// "projects/{project_number}/locations/{location_id}/taxonomies/{id}".
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+$".
  ///
  /// [updateMask] - The update mask applies to the resource. For the
  /// `FieldMask` definition, see
  /// https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#fieldmask
  /// If not set, defaults to all of the fields that are allowed to update.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1Taxonomy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1Taxonomy> patch(
      GoogleCloudDatacatalogV1beta1Taxonomy request, core.String name,
      {core.String updateMask, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1Taxonomy.fromJson(data));
  }

  /// Sets the IAM policy for a taxonomy or a policy tag.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// specified. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Policy> setIamPolicy(
      SetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':setIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /// Returns the permissions that a caller has on the specified taxonomy or
  /// policy tag.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy detail is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TestIamPermissionsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TestIamPermissionsResponse> testIamPermissions(
      TestIamPermissionsRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':testIamPermissions';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new TestIamPermissionsResponse.fromJson(data));
  }
}

class ProjectsLocationsTaxonomiesPolicyTagsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsTaxonomiesPolicyTagsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a policy tag in the specified taxonomy.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Resource name of the taxonomy that the policy tag
  /// will belong to.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1PolicyTag].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1PolicyTag> create(
      GoogleCloudDatacatalogV1beta1PolicyTag request, core.String parent,
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
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/policyTags';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1PolicyTag.fromJson(data));
  }

  /// Deletes a policy tag. Also deletes all of its descendant policy tags.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. Resource name of the policy tag to be deleted. All of
  /// its descendant policy tags will also be deleted.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+/policyTags/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Gets a policy tag.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. Resource name of the requested policy tag.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+/policyTags/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1PolicyTag].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1PolicyTag> get(core.String name,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1PolicyTag.fromJson(data));
  }

  /// Gets the IAM policy for a taxonomy or a policy tag.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+/policyTags/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Policy> getIamPolicy(
      GetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':getIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /// Lists all policy tags in a taxonomy.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Resource name of the taxonomy to list the policy tags
  /// of.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+$".
  ///
  /// [pageSize] - The maximum number of items to return. Must be a value
  /// between 1 and 1000. If not set, defaults to 50.
  ///
  /// [pageToken] - The next_page_token value returned from a previous List
  /// request, if any. If not set, defaults to an empty string.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1ListPolicyTagsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1ListPolicyTagsResponse> list(
      core.String parent,
      {core.int pageSize,
      core.String pageToken,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/policyTags';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudDatacatalogV1beta1ListPolicyTagsResponse.fromJson(data));
  }

  /// Updates a policy tag.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Output only. Resource name of this policy tag, whose format is:
  /// "projects/{project_number}/locations/{location_id}/taxonomies/{taxonomy_id}/policyTags/{id}".
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+/policyTags/[^/]+$".
  ///
  /// [updateMask] - The update mask applies to the resource. Only display_name,
  /// description and parent_policy_tag can be updated and thus can be listed in
  /// the mask. If update_mask is not provided, all allowed fields (i.e.
  /// display_name, description and parent) will be updated. For more
  /// information including the `FieldMask` definition, see
  /// https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#fieldmask
  /// If not set, defaults to all of the fields that are allowed to update.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudDatacatalogV1beta1PolicyTag].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudDatacatalogV1beta1PolicyTag> patch(
      GoogleCloudDatacatalogV1beta1PolicyTag request, core.String name,
      {core.String updateMask, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudDatacatalogV1beta1PolicyTag.fromJson(data));
  }

  /// Sets the IAM policy for a taxonomy or a policy tag.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// specified. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+/policyTags/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Policy> setIamPolicy(
      SetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':setIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /// Returns the permissions that a caller has on the specified taxonomy or
  /// policy tag.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy detail is being
  /// requested. See the operation documentation for the appropriate value for
  /// this field.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/taxonomies/[^/]+/policyTags/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TestIamPermissionsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TestIamPermissionsResponse> testIamPermissions(
      TestIamPermissionsRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1beta1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':testIamPermissions';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new TestIamPermissionsResponse.fromJson(data));
  }
}

/// Associates `members` with a `role`.
class Binding {
  /// A client-specified ID for this binding. Expected to be globally unique to
  /// support the internal bindings-by-ID API.
  core.String bindingId;

  /// The condition that is associated with this binding. If the condition
  /// evaluates to `true`, then this binding applies to the current request. If
  /// the condition evaluates to `false`, then this binding does not apply to
  /// the current request. However, a different role binding might grant the
  /// same role to one or more of the members in this binding. To learn which
  /// resources support conditions in their IAM policies, see the [IAM
  /// documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
  Expr condition;

  /// Specifies the identities requesting access for a Cloud Platform resource.
  /// `members` can have the following values: * `allUsers`: A special
  /// identifier that represents anyone who is on the internet; with or without
  /// a Google account. * `allAuthenticatedUsers`: A special identifier that
  /// represents anyone who is authenticated with a Google account or a service
  /// account. * `user:{emailid}`: An email address that represents a specific
  /// Google account. For example, `alice@example.com` . *
  /// `serviceAccount:{emailid}`: An email address that represents a service
  /// account. For example, `my-other-app@appspot.gserviceaccount.com`. *
  /// `group:{emailid}`: An email address that represents a Google group. For
  /// example, `admins@example.com`. * `deleted:user:{emailid}?uid={uniqueid}`:
  /// An email address (plus unique identifier) representing a user that has
  /// been recently deleted. For example,
  /// `alice@example.com?uid=123456789012345678901`. If the user is recovered,
  /// this value reverts to `user:{emailid}` and the recovered user retains the
  /// role in the binding. * `deleted:serviceAccount:{emailid}?uid={uniqueid}`:
  /// An email address (plus unique identifier) representing a service account
  /// that has been recently deleted. For example,
  /// `my-other-app@appspot.gserviceaccount.com?uid=123456789012345678901`. If
  /// the service account is undeleted, this value reverts to
  /// `serviceAccount:{emailid}` and the undeleted service account retains the
  /// role in the binding. * `deleted:group:{emailid}?uid={uniqueid}`: An email
  /// address (plus unique identifier) representing a Google group that has been
  /// recently deleted. For example,
  /// `admins@example.com?uid=123456789012345678901`. If the group is recovered,
  /// this value reverts to `group:{emailid}` and the recovered group retains
  /// the role in the binding. * `domain:{domain}`: The G Suite domain (primary)
  /// that represents all the users of that domain. For example, `google.com` or
  /// `example.com`.
  core.List<core.String> members;

  /// Role that is assigned to `members`. For example, `roles/viewer`,
  /// `roles/editor`, or `roles/owner`.
  core.String role;

  Binding();

  Binding.fromJson(core.Map _json) {
    if (_json.containsKey("bindingId")) {
      bindingId = _json["bindingId"];
    }
    if (_json.containsKey("condition")) {
      condition = new Expr.fromJson(_json["condition"]);
    }
    if (_json.containsKey("members")) {
      members = (_json["members"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("role")) {
      role = _json["role"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (bindingId != null) {
      _json["bindingId"] = bindingId;
    }
    if (condition != null) {
      _json["condition"] = (condition).toJson();
    }
    if (members != null) {
      _json["members"] = members;
    }
    if (role != null) {
      _json["role"] = role;
    }
    return _json;
  }
}

/// A generic empty message that you can re-use to avoid defining duplicated
/// empty messages in your APIs. A typical example is to use it as the request
/// or the response type of an API method. For instance: service Foo { rpc
/// Bar(google.protobuf.Empty) returns (google.protobuf.Empty); } The JSON
/// representation for `Empty` is empty JSON object `{}`.
class Empty {
  Empty();

  Empty.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// Represents a textual expression in the Common Expression Language (CEL)
/// syntax. CEL is a C-like expression language. The syntax and semantics of CEL
/// are documented at https://github.com/google/cel-spec. Example (Comparison):
/// title: "Summary size limit" description: "Determines if a summary is less
/// than 100 chars" expression: "document.summary.size() < 100" Example
/// (Equality): title: "Requestor is owner" description: "Determines if
/// requestor is the document owner" expression: "document.owner ==
/// request.auth.claims.email" Example (Logic): title: "Public documents"
/// description: "Determine whether the document should be publicly visible"
/// expression: "document.type != 'private' && document.type != 'internal'"
/// Example (Data Manipulation): title: "Notification string" description:
/// "Create a notification string with a timestamp." expression: "'New message
/// received at ' + string(document.create_time)" The exact variables and
/// functions that may be referenced within an expression are determined by the
/// service that evaluates it. See the service documentation for additional
/// information.
class Expr {
  /// Optional. Description of the expression. This is a longer text which
  /// describes the expression, e.g. when hovered over it in a UI.
  core.String description;

  /// Textual representation of an expression in Common Expression Language
  /// syntax.
  core.String expression;

  /// Optional. String indicating the location of the expression for error
  /// reporting, e.g. a file name and a position in the file.
  core.String location;

  /// Optional. Title for the expression, i.e. a short string describing its
  /// purpose. This can be used e.g. in UIs which allow to enter the expression.
  core.String title;

  Expr();

  Expr.fromJson(core.Map _json) {
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("expression")) {
      expression = _json["expression"];
    }
    if (_json.containsKey("location")) {
      location = _json["location"];
    }
    if (_json.containsKey("title")) {
      title = _json["title"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (description != null) {
      _json["description"] = description;
    }
    if (expression != null) {
      _json["expression"] = expression;
    }
    if (location != null) {
      _json["location"] = location;
    }
    if (title != null) {
      _json["title"] = title;
    }
    return _json;
  }
}

/// Request message for `GetIamPolicy` method.
class GetIamPolicyRequest {
  /// OPTIONAL: A `GetPolicyOptions` object for specifying options to
  /// `GetIamPolicy`.
  GetPolicyOptions options;

  GetIamPolicyRequest();

  GetIamPolicyRequest.fromJson(core.Map _json) {
    if (_json.containsKey("options")) {
      options = new GetPolicyOptions.fromJson(_json["options"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (options != null) {
      _json["options"] = (options).toJson();
    }
    return _json;
  }
}

/// Encapsulates settings provided to GetIamPolicy.
class GetPolicyOptions {
  /// Optional. The policy format version to be returned. Valid values are 0, 1,
  /// and 3. Requests specifying an invalid value will be rejected. Requests for
  /// policies with any conditional bindings must specify version 3. Policies
  /// without any conditional bindings may specify any valid value or leave the
  /// field unset. To learn which resources support conditions in their IAM
  /// policies, see the [IAM
  /// documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
  core.int requestedPolicyVersion;

  GetPolicyOptions();

  GetPolicyOptions.fromJson(core.Map _json) {
    if (_json.containsKey("requestedPolicyVersion")) {
      requestedPolicyVersion = _json["requestedPolicyVersion"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (requestedPolicyVersion != null) {
      _json["requestedPolicyVersion"] = requestedPolicyVersion;
    }
    return _json;
  }
}

/// Spec for a group of BigQuery tables with name pattern `[prefix]YYYYMMDD`.
/// Context:
/// https://cloud.google.com/bigquery/docs/partitioned-tables#partitioning_versus_sharding
class GoogleCloudDatacatalogV1beta1BigQueryDateShardedSpec {
  /// Output only. The Data Catalog resource name of the dataset entry the
  /// current table belongs to, for example,
  /// `projects/{project_id}/locations/{location}/entrygroups/{entry_group_id}/entries/{entry_id}`.
  core.String dataset;

  /// Output only. Total number of shards.
  core.String shardCount;

  /// Output only. The table name prefix of the shards. The name of any given
  /// shard is `[table_prefix]YYYYMMDD`, for example, for shard
  /// `MyTable20180101`, the `table_prefix` is `MyTable`.
  core.String tablePrefix;

  GoogleCloudDatacatalogV1beta1BigQueryDateShardedSpec();

  GoogleCloudDatacatalogV1beta1BigQueryDateShardedSpec.fromJson(
      core.Map _json) {
    if (_json.containsKey("dataset")) {
      dataset = _json["dataset"];
    }
    if (_json.containsKey("shardCount")) {
      shardCount = _json["shardCount"];
    }
    if (_json.containsKey("tablePrefix")) {
      tablePrefix = _json["tablePrefix"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (dataset != null) {
      _json["dataset"] = dataset;
    }
    if (shardCount != null) {
      _json["shardCount"] = shardCount;
    }
    if (tablePrefix != null) {
      _json["tablePrefix"] = tablePrefix;
    }
    return _json;
  }
}

/// Describes a BigQuery table.
class GoogleCloudDatacatalogV1beta1BigQueryTableSpec {
  /// Output only. The table source type.
  /// Possible string values are:
  /// - "TABLE_SOURCE_TYPE_UNSPECIFIED" : Default unknown type.
  /// - "BIGQUERY_VIEW" : Table view.
  /// - "BIGQUERY_TABLE" : BigQuery native table.
  /// - "BIGQUERY_MATERIALIZED_VIEW" : BigQuery materialized view.
  core.String tableSourceType;

  /// Spec of a BigQuery table. This field should only be populated if
  /// `table_source_type` is `BIGQUERY_TABLE`.
  GoogleCloudDatacatalogV1beta1TableSpec tableSpec;

  /// Table view specification. This field should only be populated if
  /// `table_source_type` is `BIGQUERY_VIEW`.
  GoogleCloudDatacatalogV1beta1ViewSpec viewSpec;

  GoogleCloudDatacatalogV1beta1BigQueryTableSpec();

  GoogleCloudDatacatalogV1beta1BigQueryTableSpec.fromJson(core.Map _json) {
    if (_json.containsKey("tableSourceType")) {
      tableSourceType = _json["tableSourceType"];
    }
    if (_json.containsKey("tableSpec")) {
      tableSpec = new GoogleCloudDatacatalogV1beta1TableSpec.fromJson(
          _json["tableSpec"]);
    }
    if (_json.containsKey("viewSpec")) {
      viewSpec =
          new GoogleCloudDatacatalogV1beta1ViewSpec.fromJson(_json["viewSpec"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (tableSourceType != null) {
      _json["tableSourceType"] = tableSourceType;
    }
    if (tableSpec != null) {
      _json["tableSpec"] = (tableSpec).toJson();
    }
    if (viewSpec != null) {
      _json["viewSpec"] = (viewSpec).toJson();
    }
    return _json;
  }
}

/// Representation of a column within a schema. Columns could be nested inside
/// other columns.
class GoogleCloudDatacatalogV1beta1ColumnSchema {
  /// Required. Name of the column.
  core.String column;

  /// Optional. Description of the column. Default value is an empty string.
  core.String description;

  /// Optional. A column's mode indicates whether the values in this column are
  /// required, nullable, etc. Only `NULLABLE`, `REQUIRED` and `REPEATED` are
  /// supported. Default mode is `NULLABLE`.
  core.String mode;

  /// Optional. Schema of sub-columns. A column can have zero or more
  /// sub-columns.
  core.List<GoogleCloudDatacatalogV1beta1ColumnSchema> subcolumns;

  /// Required. Type of the column.
  core.String type;

  GoogleCloudDatacatalogV1beta1ColumnSchema();

  GoogleCloudDatacatalogV1beta1ColumnSchema.fromJson(core.Map _json) {
    if (_json.containsKey("column")) {
      column = _json["column"];
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("mode")) {
      mode = _json["mode"];
    }
    if (_json.containsKey("subcolumns")) {
      subcolumns = (_json["subcolumns"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1ColumnSchema>((value) =>
              new GoogleCloudDatacatalogV1beta1ColumnSchema.fromJson(value))
          .toList();
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (column != null) {
      _json["column"] = column;
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (mode != null) {
      _json["mode"] = mode;
    }
    if (subcolumns != null) {
      _json["subcolumns"] =
          subcolumns.map((value) => (value).toJson()).toList();
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

/// Entry Metadata. A Data Catalog Entry resource represents another resource in
/// Google Cloud Platform (such as a BigQuery dataset or a Pub/Sub topic), or
/// outside of Google Cloud Platform. Clients can use the `linked_resource`
/// field in the Entry resource to refer to the original resource ID of the
/// source system. An Entry resource contains resource details, such as its
/// schema. An Entry can also be used to attach flexible metadata, such as a
/// Tag.
class GoogleCloudDatacatalogV1beta1Entry {
  /// Specification for a group of BigQuery tables with name pattern
  /// `[prefix]YYYYMMDD`. Context:
  /// https://cloud.google.com/bigquery/docs/partitioned-tables#partitioning_versus_sharding.
  GoogleCloudDatacatalogV1beta1BigQueryDateShardedSpec bigqueryDateShardedSpec;

  /// Specification that applies to a BigQuery table. This is only valid on
  /// entries of type `TABLE`.
  GoogleCloudDatacatalogV1beta1BigQueryTableSpec bigqueryTableSpec;

  /// Entry description, which can consist of several sentences or paragraphs
  /// that describe entry contents. Default value is an empty string.
  core.String description;

  /// Display information such as title and description. A short name to
  /// identify the entry, for example, "Analytics Data - Jan 2011". Default
  /// value is an empty string.
  core.String displayName;

  /// Specification that applies to a Cloud Storage fileset. This is only valid
  /// on entries of type FILESET.
  GoogleCloudDatacatalogV1beta1GcsFilesetSpec gcsFilesetSpec;

  /// Output only. This field indicates the entry's source system that Data
  /// Catalog integrates with, such as BigQuery or Pub/Sub.
  /// Possible string values are:
  /// - "INTEGRATED_SYSTEM_UNSPECIFIED" : Default unknown system.
  /// - "BIGQUERY" : BigQuery.
  /// - "CLOUD_PUBSUB" : Cloud Pub/Sub.
  core.String integratedSystem;

  /// The resource this metadata entry refers to. For Google Cloud Platform
  /// resources, `linked_resource` is the [full name of the
  /// resource](https://cloud.google.com/apis/design/resource_names#full_resource_name).
  /// For example, the `linked_resource` for a table resource from BigQuery is:
  /// *
  /// //bigquery.googleapis.com/projects/projectId/datasets/datasetId/tables/tableId
  /// Output only when Entry is of type in the EntryType enum. For entries with
  /// user_specified_type, this field is optional and defaults to an empty
  /// string.
  core.String linkedResource;

  /// The Data Catalog resource name of the entry in URL format. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}/entries/{entry_id}
  /// Note that this Entry and its child resources may not actually be stored in
  /// the location in this name.
  core.String name;

  /// Schema of the entry. An entry might not have any schema attached to it.
  GoogleCloudDatacatalogV1beta1Schema schema;

  /// Output only. Timestamps about the underlying resource, not about this Data
  /// Catalog entry. Output only when Entry is of type in the EntryType enum.
  /// For entries with user_specified_type, this field is optional and defaults
  /// to an empty timestamp.
  GoogleCloudDatacatalogV1beta1SystemTimestamps sourceSystemTimestamps;

  /// The type of the entry. Only used for Entries with types in the EntryType
  /// enum.
  /// Possible string values are:
  /// - "ENTRY_TYPE_UNSPECIFIED" : Default unknown type.
  /// - "TABLE" : Output only. The type of entry that has a GoogleSQL schema,
  /// including logical views.
  /// - "MODEL" : Output only. The type of models.
  /// https://cloud.google.com/bigquery-ml/docs/bigqueryml-intro
  /// - "DATA_STREAM" : Output only. An entry type which is used for streaming
  /// entries. Example: Pub/Sub topic.
  /// - "FILESET" : An entry type which is a set of files or objects. Example:
  /// Cloud Storage fileset.
  core.String type;

  /// This field indicates the entry's source system that Data Catalog does not
  /// integrate with. `user_specified_system` strings must begin with a letter
  /// or underscore and can only contain letters, numbers, and underscores; are
  /// case insensitive; must be at least 1 character and at most 64 characters
  /// long.
  core.String userSpecifiedSystem;

  /// Entry type if it does not fit any of the input-allowed values listed in
  /// `EntryType` enum above. When creating an entry, users should check the
  /// enum values first, if nothing matches the entry to be created, then
  /// provide a custom value, for example "my_special_type".
  /// `user_specified_type` strings must begin with a letter or underscore and
  /// can only contain letters, numbers, and underscores; are case insensitive;
  /// must be at least 1 character and at most 64 characters long. Currently,
  /// only FILESET enum value is allowed. All other entries created through Data
  /// Catalog must use `user_specified_type`.
  core.String userSpecifiedType;

  GoogleCloudDatacatalogV1beta1Entry();

  GoogleCloudDatacatalogV1beta1Entry.fromJson(core.Map _json) {
    if (_json.containsKey("bigqueryDateShardedSpec")) {
      bigqueryDateShardedSpec =
          new GoogleCloudDatacatalogV1beta1BigQueryDateShardedSpec.fromJson(
              _json["bigqueryDateShardedSpec"]);
    }
    if (_json.containsKey("bigqueryTableSpec")) {
      bigqueryTableSpec =
          new GoogleCloudDatacatalogV1beta1BigQueryTableSpec.fromJson(
              _json["bigqueryTableSpec"]);
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("gcsFilesetSpec")) {
      gcsFilesetSpec = new GoogleCloudDatacatalogV1beta1GcsFilesetSpec.fromJson(
          _json["gcsFilesetSpec"]);
    }
    if (_json.containsKey("integratedSystem")) {
      integratedSystem = _json["integratedSystem"];
    }
    if (_json.containsKey("linkedResource")) {
      linkedResource = _json["linkedResource"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("schema")) {
      schema =
          new GoogleCloudDatacatalogV1beta1Schema.fromJson(_json["schema"]);
    }
    if (_json.containsKey("sourceSystemTimestamps")) {
      sourceSystemTimestamps =
          new GoogleCloudDatacatalogV1beta1SystemTimestamps.fromJson(
              _json["sourceSystemTimestamps"]);
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
    if (_json.containsKey("userSpecifiedSystem")) {
      userSpecifiedSystem = _json["userSpecifiedSystem"];
    }
    if (_json.containsKey("userSpecifiedType")) {
      userSpecifiedType = _json["userSpecifiedType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (bigqueryDateShardedSpec != null) {
      _json["bigqueryDateShardedSpec"] = (bigqueryDateShardedSpec).toJson();
    }
    if (bigqueryTableSpec != null) {
      _json["bigqueryTableSpec"] = (bigqueryTableSpec).toJson();
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (gcsFilesetSpec != null) {
      _json["gcsFilesetSpec"] = (gcsFilesetSpec).toJson();
    }
    if (integratedSystem != null) {
      _json["integratedSystem"] = integratedSystem;
    }
    if (linkedResource != null) {
      _json["linkedResource"] = linkedResource;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (schema != null) {
      _json["schema"] = (schema).toJson();
    }
    if (sourceSystemTimestamps != null) {
      _json["sourceSystemTimestamps"] = (sourceSystemTimestamps).toJson();
    }
    if (type != null) {
      _json["type"] = type;
    }
    if (userSpecifiedSystem != null) {
      _json["userSpecifiedSystem"] = userSpecifiedSystem;
    }
    if (userSpecifiedType != null) {
      _json["userSpecifiedType"] = userSpecifiedType;
    }
    return _json;
  }
}

/// EntryGroup Metadata. An EntryGroup resource represents a logical grouping of
/// zero or more Data Catalog Entry resources.
class GoogleCloudDatacatalogV1beta1EntryGroup {
  /// Output only. Timestamps about this EntryGroup. Default value is empty
  /// timestamps.
  GoogleCloudDatacatalogV1beta1SystemTimestamps dataCatalogTimestamps;

  /// Entry group description, which can consist of several sentences or
  /// paragraphs that describe entry group contents. Default value is an empty
  /// string.
  core.String description;

  /// A short name to identify the entry group, for example, "analytics data -
  /// jan 2011". Default value is an empty string.
  core.String displayName;

  /// The resource name of the entry group in URL format. Example: *
  /// projects/{project_id}/locations/{location}/entryGroups/{entry_group_id}
  /// Note that this EntryGroup and its child resources may not actually be
  /// stored in the location in this name.
  core.String name;

  GoogleCloudDatacatalogV1beta1EntryGroup();

  GoogleCloudDatacatalogV1beta1EntryGroup.fromJson(core.Map _json) {
    if (_json.containsKey("dataCatalogTimestamps")) {
      dataCatalogTimestamps =
          new GoogleCloudDatacatalogV1beta1SystemTimestamps.fromJson(
              _json["dataCatalogTimestamps"]);
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (dataCatalogTimestamps != null) {
      _json["dataCatalogTimestamps"] = (dataCatalogTimestamps).toJson();
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (name != null) {
      _json["name"] = name;
    }
    return _json;
  }
}

/// Response message for ExportTaxonomies.
class GoogleCloudDatacatalogV1beta1ExportTaxonomiesResponse {
  /// List of taxonomies and policy tags in a tree structure.
  core.List<GoogleCloudDatacatalogV1beta1SerializedTaxonomy> taxonomies;

  GoogleCloudDatacatalogV1beta1ExportTaxonomiesResponse();

  GoogleCloudDatacatalogV1beta1ExportTaxonomiesResponse.fromJson(
      core.Map _json) {
    if (_json.containsKey("taxonomies")) {
      taxonomies = (_json["taxonomies"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1SerializedTaxonomy>((value) =>
              new GoogleCloudDatacatalogV1beta1SerializedTaxonomy.fromJson(
                  value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (taxonomies != null) {
      _json["taxonomies"] =
          taxonomies.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class GoogleCloudDatacatalogV1beta1FieldType {
  /// Represents an enum type.
  GoogleCloudDatacatalogV1beta1FieldTypeEnumType enumType;

  /// Represents primitive types - string, bool etc.
  /// Possible string values are:
  /// - "PRIMITIVE_TYPE_UNSPECIFIED" : This is the default invalid value for a
  /// type.
  /// - "DOUBLE" : A double precision number.
  /// - "STRING" : An UTF-8 string.
  /// - "BOOL" : A boolean value.
  /// - "TIMESTAMP" : A timestamp.
  core.String primitiveType;

  GoogleCloudDatacatalogV1beta1FieldType();

  GoogleCloudDatacatalogV1beta1FieldType.fromJson(core.Map _json) {
    if (_json.containsKey("enumType")) {
      enumType = new GoogleCloudDatacatalogV1beta1FieldTypeEnumType.fromJson(
          _json["enumType"]);
    }
    if (_json.containsKey("primitiveType")) {
      primitiveType = _json["primitiveType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (enumType != null) {
      _json["enumType"] = (enumType).toJson();
    }
    if (primitiveType != null) {
      _json["primitiveType"] = primitiveType;
    }
    return _json;
  }
}

class GoogleCloudDatacatalogV1beta1FieldTypeEnumType {
  /// The set of allowed values for this enum. This set must not be empty, the
  /// display names of the values in this set must not be empty and the display
  /// names of the values must be case-insensitively unique within this set. The
  /// order of items in this list is preserved. This field can be used to
  /// Required on create; optional on update. The set of allowed values for this
  /// enum. This set must not be empty, the display names of the values in this
  /// set must not be empty and the display names of the values must be
  /// case-insensitively unique within this set. Currently, enum values can only
  /// be added to the list of allowed values. Deletion and renaming of enum
  /// values are not supported. Can have up to 500 allowed values.
  core.List<GoogleCloudDatacatalogV1beta1FieldTypeEnumTypeEnumValue>
      allowedValues;

  GoogleCloudDatacatalogV1beta1FieldTypeEnumType();

  GoogleCloudDatacatalogV1beta1FieldTypeEnumType.fromJson(core.Map _json) {
    if (_json.containsKey("allowedValues")) {
      allowedValues = (_json["allowedValues"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1FieldTypeEnumTypeEnumValue>(
              (value) =>
                  new GoogleCloudDatacatalogV1beta1FieldTypeEnumTypeEnumValue
                      .fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (allowedValues != null) {
      _json["allowedValues"] =
          allowedValues.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class GoogleCloudDatacatalogV1beta1FieldTypeEnumTypeEnumValue {
  /// Required. The display name of the enum value. Must not be an empty string.
  core.String displayName;

  GoogleCloudDatacatalogV1beta1FieldTypeEnumTypeEnumValue();

  GoogleCloudDatacatalogV1beta1FieldTypeEnumTypeEnumValue.fromJson(
      core.Map _json) {
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    return _json;
  }
}

/// Specifications of a single file in Cloud Storage.
class GoogleCloudDatacatalogV1beta1GcsFileSpec {
  /// Required. The full file path. Example: `gs://bucket_name/a/b.txt`.
  core.String filePath;

  /// Output only. Timestamps about the Cloud Storage file.
  GoogleCloudDatacatalogV1beta1SystemTimestamps gcsTimestamps;

  /// Output only. The size of the file, in bytes.
  core.String sizeBytes;

  GoogleCloudDatacatalogV1beta1GcsFileSpec();

  GoogleCloudDatacatalogV1beta1GcsFileSpec.fromJson(core.Map _json) {
    if (_json.containsKey("filePath")) {
      filePath = _json["filePath"];
    }
    if (_json.containsKey("gcsTimestamps")) {
      gcsTimestamps =
          new GoogleCloudDatacatalogV1beta1SystemTimestamps.fromJson(
              _json["gcsTimestamps"]);
    }
    if (_json.containsKey("sizeBytes")) {
      sizeBytes = _json["sizeBytes"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (filePath != null) {
      _json["filePath"] = filePath;
    }
    if (gcsTimestamps != null) {
      _json["gcsTimestamps"] = (gcsTimestamps).toJson();
    }
    if (sizeBytes != null) {
      _json["sizeBytes"] = sizeBytes;
    }
    return _json;
  }
}

/// Describes a Cloud Storage fileset entry.
class GoogleCloudDatacatalogV1beta1GcsFilesetSpec {
  /// Required. Patterns to identify a set of files in Google Cloud Storage. See
  /// [Cloud Storage
  /// documentation](https://cloud.google.com/storage/docs/gsutil/addlhelp/WildcardNames)
  /// for more information. Note that bucket wildcards are currently not
  /// supported. Examples of valid file_patterns: * `gs://bucket_name/dir / * `:
  /// matches all files within `bucket_name/dir` directory. *
  /// `gs://bucket_name/dir / * *`: matches all files in `bucket_name/dir`
  /// spanning all subdirectories. * `gs://bucket_name/file*`: matches files
  /// prefixed by `file` in `bucket_name` * `gs://bucket_name/??.txt`: matches
  /// files with two characters followed by `.txt` in `bucket_name` *
  /// `gs://bucket_name/[aeiou].txt`: matches files that contain a single vowel
  /// character followed by `.txt` in `bucket_name` *
  /// `gs://bucket_name/[a-m].txt`: matches files that contain `a`, `b`, ... or
  /// `m` followed by `.txt` in `bucket_name` * `gs://bucket_name/a / * /b`:
  /// matches all files in `bucket_name` that match `a / * /b` pattern, such as
  /// `a/c/b`, `a/d/b` * `gs://another_bucket/a.txt`: matches
  /// `gs://another_bucket/a.txt` You can combine wildcards to provide more
  /// powerful matches, for example: * `gs://bucket_name/[a-m]??.j*g`
  core.List<core.String> filePatterns;

  /// Output only. Sample files contained in this fileset, not all files
  /// contained in this fileset are represented here.
  core.List<GoogleCloudDatacatalogV1beta1GcsFileSpec> sampleGcsFileSpecs;

  GoogleCloudDatacatalogV1beta1GcsFilesetSpec();

  GoogleCloudDatacatalogV1beta1GcsFilesetSpec.fromJson(core.Map _json) {
    if (_json.containsKey("filePatterns")) {
      filePatterns = (_json["filePatterns"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("sampleGcsFileSpecs")) {
      sampleGcsFileSpecs = (_json["sampleGcsFileSpecs"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1GcsFileSpec>((value) =>
              new GoogleCloudDatacatalogV1beta1GcsFileSpec.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (filePatterns != null) {
      _json["filePatterns"] = filePatterns;
    }
    if (sampleGcsFileSpecs != null) {
      _json["sampleGcsFileSpecs"] =
          sampleGcsFileSpecs.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Request message for ImportTaxonomies.
class GoogleCloudDatacatalogV1beta1ImportTaxonomiesRequest {
  /// Inline source used for taxonomies to be imported.
  GoogleCloudDatacatalogV1beta1InlineSource inlineSource;

  GoogleCloudDatacatalogV1beta1ImportTaxonomiesRequest();

  GoogleCloudDatacatalogV1beta1ImportTaxonomiesRequest.fromJson(
      core.Map _json) {
    if (_json.containsKey("inlineSource")) {
      inlineSource = new GoogleCloudDatacatalogV1beta1InlineSource.fromJson(
          _json["inlineSource"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (inlineSource != null) {
      _json["inlineSource"] = (inlineSource).toJson();
    }
    return _json;
  }
}

/// Response message for ImportTaxonomies.
class GoogleCloudDatacatalogV1beta1ImportTaxonomiesResponse {
  /// Taxonomies that were imported.
  core.List<GoogleCloudDatacatalogV1beta1Taxonomy> taxonomies;

  GoogleCloudDatacatalogV1beta1ImportTaxonomiesResponse();

  GoogleCloudDatacatalogV1beta1ImportTaxonomiesResponse.fromJson(
      core.Map _json) {
    if (_json.containsKey("taxonomies")) {
      taxonomies = (_json["taxonomies"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1Taxonomy>((value) =>
              new GoogleCloudDatacatalogV1beta1Taxonomy.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (taxonomies != null) {
      _json["taxonomies"] =
          taxonomies.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Inline source used for taxonomies import.
class GoogleCloudDatacatalogV1beta1InlineSource {
  /// Required. Taxonomies to be imported.
  core.List<GoogleCloudDatacatalogV1beta1SerializedTaxonomy> taxonomies;

  GoogleCloudDatacatalogV1beta1InlineSource();

  GoogleCloudDatacatalogV1beta1InlineSource.fromJson(core.Map _json) {
    if (_json.containsKey("taxonomies")) {
      taxonomies = (_json["taxonomies"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1SerializedTaxonomy>((value) =>
              new GoogleCloudDatacatalogV1beta1SerializedTaxonomy.fromJson(
                  value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (taxonomies != null) {
      _json["taxonomies"] =
          taxonomies.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Response message for ListEntries.
class GoogleCloudDatacatalogV1beta1ListEntriesResponse {
  /// Entry details.
  core.List<GoogleCloudDatacatalogV1beta1Entry> entries;

  /// Token to retrieve the next page of results. It is set to empty if no items
  /// remain in results.
  core.String nextPageToken;

  GoogleCloudDatacatalogV1beta1ListEntriesResponse();

  GoogleCloudDatacatalogV1beta1ListEntriesResponse.fromJson(core.Map _json) {
    if (_json.containsKey("entries")) {
      entries = (_json["entries"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1Entry>(
              (value) => new GoogleCloudDatacatalogV1beta1Entry.fromJson(value))
          .toList();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (entries != null) {
      _json["entries"] = entries.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// Response message for ListEntryGroups.
class GoogleCloudDatacatalogV1beta1ListEntryGroupsResponse {
  /// EntryGroup details.
  core.List<GoogleCloudDatacatalogV1beta1EntryGroup> entryGroups;

  /// Token to retrieve the next page of results. It is set to empty if no items
  /// remain in results.
  core.String nextPageToken;

  GoogleCloudDatacatalogV1beta1ListEntryGroupsResponse();

  GoogleCloudDatacatalogV1beta1ListEntryGroupsResponse.fromJson(
      core.Map _json) {
    if (_json.containsKey("entryGroups")) {
      entryGroups = (_json["entryGroups"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1EntryGroup>((value) =>
              new GoogleCloudDatacatalogV1beta1EntryGroup.fromJson(value))
          .toList();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (entryGroups != null) {
      _json["entryGroups"] =
          entryGroups.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// Response message for ListPolicyTags.
class GoogleCloudDatacatalogV1beta1ListPolicyTagsResponse {
  /// Token used to retrieve the next page of results, or empty if there are no
  /// more results in the list.
  core.String nextPageToken;

  /// The policy tags that are in the requested taxonomy.
  core.List<GoogleCloudDatacatalogV1beta1PolicyTag> policyTags;

  GoogleCloudDatacatalogV1beta1ListPolicyTagsResponse();

  GoogleCloudDatacatalogV1beta1ListPolicyTagsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("policyTags")) {
      policyTags = (_json["policyTags"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1PolicyTag>((value) =>
              new GoogleCloudDatacatalogV1beta1PolicyTag.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    if (policyTags != null) {
      _json["policyTags"] =
          policyTags.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Response message for ListTags.
class GoogleCloudDatacatalogV1beta1ListTagsResponse {
  /// Token to retrieve the next page of results. It is set to empty if no items
  /// remain in results.
  core.String nextPageToken;

  /// Tag details.
  core.List<GoogleCloudDatacatalogV1beta1Tag> tags;

  GoogleCloudDatacatalogV1beta1ListTagsResponse();

  GoogleCloudDatacatalogV1beta1ListTagsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("tags")) {
      tags = (_json["tags"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1Tag>(
              (value) => new GoogleCloudDatacatalogV1beta1Tag.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    if (tags != null) {
      _json["tags"] = tags.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Response message for ListTaxonomies.
class GoogleCloudDatacatalogV1beta1ListTaxonomiesResponse {
  /// Token used to retrieve the next page of results, or empty if there are no
  /// more results in the list.
  core.String nextPageToken;

  /// Taxonomies that the project contains.
  core.List<GoogleCloudDatacatalogV1beta1Taxonomy> taxonomies;

  GoogleCloudDatacatalogV1beta1ListTaxonomiesResponse();

  GoogleCloudDatacatalogV1beta1ListTaxonomiesResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("taxonomies")) {
      taxonomies = (_json["taxonomies"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1Taxonomy>((value) =>
              new GoogleCloudDatacatalogV1beta1Taxonomy.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    if (taxonomies != null) {
      _json["taxonomies"] =
          taxonomies.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Denotes one policy tag in a taxonomy (e.g. ssn). Policy Tags can be defined
/// in a hierarchy. For example, consider the following hierarchy: Geolocation
/// -> (LatLong, City, ZipCode). PolicyTag "Geolocation" contains three child
/// policy tags: "LatLong", "City", and "ZipCode".
class GoogleCloudDatacatalogV1beta1PolicyTag {
  /// Output only. Resource names of child policy tags of this policy tag.
  core.List<core.String> childPolicyTags;

  /// Description of this policy tag. It must: contain only unicode characters,
  /// tabs, newlines, carriage returns and page breaks; and be at most 2000
  /// bytes long when encoded in UTF-8. If not set, defaults to an empty
  /// description. If not set, defaults to an empty description.
  core.String description;

  /// Required. User defined name of this policy tag. It must: be unique within
  /// the parent taxonomy; contain only unicode letters, numbers, underscores,
  /// dashes and spaces; not start or end with spaces; and be at most 200 bytes
  /// long when encoded in UTF-8.
  core.String displayName;

  /// Output only. Resource name of this policy tag, whose format is:
  /// "projects/{project_number}/locations/{location_id}/taxonomies/{taxonomy_id}/policyTags/{id}".
  core.String name;

  /// Resource name of this policy tag's parent policy tag (e.g. for the
  /// "LatLong" policy tag in the example above, this field contains the
  /// resource name of the "Geolocation" policy tag). If empty, it means this
  /// policy tag is a top level policy tag (e.g. this field is empty for the
  /// "Geolocation" policy tag in the example above). If not set, defaults to an
  /// empty string.
  core.String parentPolicyTag;

  GoogleCloudDatacatalogV1beta1PolicyTag();

  GoogleCloudDatacatalogV1beta1PolicyTag.fromJson(core.Map _json) {
    if (_json.containsKey("childPolicyTags")) {
      childPolicyTags =
          (_json["childPolicyTags"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("parentPolicyTag")) {
      parentPolicyTag = _json["parentPolicyTag"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (childPolicyTags != null) {
      _json["childPolicyTags"] = childPolicyTags;
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (parentPolicyTag != null) {
      _json["parentPolicyTag"] = parentPolicyTag;
    }
    return _json;
  }
}

/// Request message for RenameTagTemplateFieldEnumValue.
class GoogleCloudDatacatalogV1beta1RenameTagTemplateFieldEnumValueRequest {
  /// Required. The new display name of the enum value. For example,
  /// `my_new_enum_value`.
  core.String newEnumValueDisplayName;

  GoogleCloudDatacatalogV1beta1RenameTagTemplateFieldEnumValueRequest();

  GoogleCloudDatacatalogV1beta1RenameTagTemplateFieldEnumValueRequest.fromJson(
      core.Map _json) {
    if (_json.containsKey("newEnumValueDisplayName")) {
      newEnumValueDisplayName = _json["newEnumValueDisplayName"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (newEnumValueDisplayName != null) {
      _json["newEnumValueDisplayName"] = newEnumValueDisplayName;
    }
    return _json;
  }
}

/// Request message for RenameTagTemplateField.
class GoogleCloudDatacatalogV1beta1RenameTagTemplateFieldRequest {
  /// Required. The new ID of this tag template field. For example,
  /// `my_new_field`.
  core.String newTagTemplateFieldId;

  GoogleCloudDatacatalogV1beta1RenameTagTemplateFieldRequest();

  GoogleCloudDatacatalogV1beta1RenameTagTemplateFieldRequest.fromJson(
      core.Map _json) {
    if (_json.containsKey("newTagTemplateFieldId")) {
      newTagTemplateFieldId = _json["newTagTemplateFieldId"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (newTagTemplateFieldId != null) {
      _json["newTagTemplateFieldId"] = newTagTemplateFieldId;
    }
    return _json;
  }
}

/// Represents a schema (e.g. BigQuery, GoogleSQL, Avro schema).
class GoogleCloudDatacatalogV1beta1Schema {
  /// Required. Schema of columns. A maximum of 10,000 columns and sub-columns
  /// can be specified.
  core.List<GoogleCloudDatacatalogV1beta1ColumnSchema> columns;

  GoogleCloudDatacatalogV1beta1Schema();

  GoogleCloudDatacatalogV1beta1Schema.fromJson(core.Map _json) {
    if (_json.containsKey("columns")) {
      columns = (_json["columns"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1ColumnSchema>((value) =>
              new GoogleCloudDatacatalogV1beta1ColumnSchema.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (columns != null) {
      _json["columns"] = columns.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Request message for SearchCatalog.
class GoogleCloudDatacatalogV1beta1SearchCatalogRequest {
  /// Specifies the ordering of results, currently supported case-sensitive
  /// choices are: * `relevance`, only supports descending *
  /// `last_modified_timestamp [asc|desc]`, defaults to descending if not
  /// specified If not specified, defaults to `relevance` descending.
  core.String orderBy;

  /// Number of results in the search page. If <=0 then defaults to 10. Max
  /// limit for page_size is 1000. Throws an invalid argument for page_size >
  /// 1000.
  core.int pageSize;

  /// Optional. Pagination token returned in an earlier
  /// SearchCatalogResponse.next_page_token, which indicates that this is a
  /// continuation of a prior SearchCatalogRequest call, and that the system
  /// should return the next page of data. If empty, the first page is returned.
  core.String pageToken;

  /// Optional. The query string in search query syntax. An empty query string
  /// will result in all data assets (in the specified scope) that the user has
  /// access to. Query strings can be simple as "x" or more qualified as: *
  /// name:x * column:x * description:y Note: Query tokens need to have a
  /// minimum of 3 characters for substring matching to work correctly. See
  /// [Data Catalog Search
  /// Syntax](https://cloud.google.com/data-catalog/docs/how-to/search-reference)
  /// for more information.
  core.String query;

  /// Required. The scope of this search request. A `scope` that has empty
  /// `include_org_ids`, `include_project_ids` AND false
  /// `include_gcp_public_datasets` is considered invalid. Data Catalog will
  /// return an error in such a case.
  GoogleCloudDatacatalogV1beta1SearchCatalogRequestScope scope;

  GoogleCloudDatacatalogV1beta1SearchCatalogRequest();

  GoogleCloudDatacatalogV1beta1SearchCatalogRequest.fromJson(core.Map _json) {
    if (_json.containsKey("orderBy")) {
      orderBy = _json["orderBy"];
    }
    if (_json.containsKey("pageSize")) {
      pageSize = _json["pageSize"];
    }
    if (_json.containsKey("pageToken")) {
      pageToken = _json["pageToken"];
    }
    if (_json.containsKey("query")) {
      query = _json["query"];
    }
    if (_json.containsKey("scope")) {
      scope =
          new GoogleCloudDatacatalogV1beta1SearchCatalogRequestScope.fromJson(
              _json["scope"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (orderBy != null) {
      _json["orderBy"] = orderBy;
    }
    if (pageSize != null) {
      _json["pageSize"] = pageSize;
    }
    if (pageToken != null) {
      _json["pageToken"] = pageToken;
    }
    if (query != null) {
      _json["query"] = query;
    }
    if (scope != null) {
      _json["scope"] = (scope).toJson();
    }
    return _json;
  }
}

/// The criteria that select the subspace used for query matching.
class GoogleCloudDatacatalogV1beta1SearchCatalogRequestScope {
  /// If `true`, include Google Cloud Platform (GCP) public datasets in the
  /// search results. Info on GCP public datasets is available at
  /// https://cloud.google.com/public-datasets/. By default, GCP public datasets
  /// are excluded.
  core.bool includeGcpPublicDatasets;

  /// The list of organization IDs to search within. To find your organization
  /// ID, follow instructions in
  /// https://cloud.google.com/resource-manager/docs/creating-managing-organization.
  core.List<core.String> includeOrgIds;

  /// The list of project IDs to search within. To learn more about the
  /// distinction between project names/IDs/numbers, go to
  /// https://cloud.google.com/docs/overview/#projects.
  core.List<core.String> includeProjectIds;

  /// Optional. The list of locations to search within. 1. If empty, search will
  /// be performed in all locations; 2. If any of the locations are NOT in the
  /// valid locations list, error will be returned; 3. Otherwise, search only
  /// the given locations for matching results. Typical usage is to leave this
  /// field empty. When a location is unreachable as returned in the
  /// `SearchCatalogResponse.unreachable` field, users can repeat the search
  /// request with this parameter set to get additional information on the
  /// error. Valid locations: * asia-east1 * asia-east2 * asia-northeast1 *
  /// asia-northeast2 * asia-northeast3 * asia-south1 * asia-southeast1 *
  /// australia-southeast1 * eu * europe-north1 * europe-west1 * europe-west2 *
  /// europe-west3 * europe-west4 * europe-west6 * global *
  /// northamerica-northeast1 * southamerica-east1 * us * us-central1 * us-east1
  /// * us-east4 * us-west1 * us-west2
  core.List<core.String> restrictedLocations;

  GoogleCloudDatacatalogV1beta1SearchCatalogRequestScope();

  GoogleCloudDatacatalogV1beta1SearchCatalogRequestScope.fromJson(
      core.Map _json) {
    if (_json.containsKey("includeGcpPublicDatasets")) {
      includeGcpPublicDatasets = _json["includeGcpPublicDatasets"];
    }
    if (_json.containsKey("includeOrgIds")) {
      includeOrgIds = (_json["includeOrgIds"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("includeProjectIds")) {
      includeProjectIds =
          (_json["includeProjectIds"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("restrictedLocations")) {
      restrictedLocations =
          (_json["restrictedLocations"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (includeGcpPublicDatasets != null) {
      _json["includeGcpPublicDatasets"] = includeGcpPublicDatasets;
    }
    if (includeOrgIds != null) {
      _json["includeOrgIds"] = includeOrgIds;
    }
    if (includeProjectIds != null) {
      _json["includeProjectIds"] = includeProjectIds;
    }
    if (restrictedLocations != null) {
      _json["restrictedLocations"] = restrictedLocations;
    }
    return _json;
  }
}

/// Response message for SearchCatalog.
class GoogleCloudDatacatalogV1beta1SearchCatalogResponse {
  /// The token that can be used to retrieve the next page of results.
  core.String nextPageToken;

  /// Search results.
  core.List<GoogleCloudDatacatalogV1beta1SearchCatalogResult> results;

  /// Unreachable locations. Search result does not include data from those
  /// locations. Users can get additional information on the error by repeating
  /// the search request with a more restrictive parameter -- setting the value
  /// for `SearchDataCatalogRequest.scope.restricted_locations`.
  core.List<core.String> unreachable;

  GoogleCloudDatacatalogV1beta1SearchCatalogResponse();

  GoogleCloudDatacatalogV1beta1SearchCatalogResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("results")) {
      results = (_json["results"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1SearchCatalogResult>((value) =>
              new GoogleCloudDatacatalogV1beta1SearchCatalogResult.fromJson(
                  value))
          .toList();
    }
    if (_json.containsKey("unreachable")) {
      unreachable = (_json["unreachable"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    if (results != null) {
      _json["results"] = results.map((value) => (value).toJson()).toList();
    }
    if (unreachable != null) {
      _json["unreachable"] = unreachable;
    }
    return _json;
  }
}

/// A result that appears in the response of a search request. Each result
/// captures details of one entry that matches the search.
class GoogleCloudDatacatalogV1beta1SearchCatalogResult {
  /// The full name of the cloud resource the entry belongs to. See:
  /// https://cloud.google.com/apis/design/resource_names#full_resource_name.
  /// Example: *
  /// `//bigquery.googleapis.com/projects/projectId/datasets/datasetId/tables/tableId`
  core.String linkedResource;

  /// The relative resource name of the resource in URL format. Examples: *
  /// `projects/{project_id}/locations/{location_id}/entryGroups/{entry_group_id}/entries/{entry_id}`
  /// * `projects/{project_id}/tagTemplates/{tag_template_id}`
  core.String relativeResourceName;

  /// Sub-type of the search result. This is a dot-delimited description of the
  /// resource's full type, and is the same as the value callers would provide
  /// in the "type" search facet. Examples: `entry.table`, `entry.dataStream`,
  /// `tagTemplate`.
  core.String searchResultSubtype;

  /// Type of the search result. This field can be used to determine which Get
  /// method to call to fetch the full resource.
  /// Possible string values are:
  /// - "SEARCH_RESULT_TYPE_UNSPECIFIED" : Default unknown type.
  /// - "ENTRY" : An Entry.
  /// - "TAG_TEMPLATE" : A TagTemplate.
  /// - "ENTRY_GROUP" : An EntryGroup.
  core.String searchResultType;

  GoogleCloudDatacatalogV1beta1SearchCatalogResult();

  GoogleCloudDatacatalogV1beta1SearchCatalogResult.fromJson(core.Map _json) {
    if (_json.containsKey("linkedResource")) {
      linkedResource = _json["linkedResource"];
    }
    if (_json.containsKey("relativeResourceName")) {
      relativeResourceName = _json["relativeResourceName"];
    }
    if (_json.containsKey("searchResultSubtype")) {
      searchResultSubtype = _json["searchResultSubtype"];
    }
    if (_json.containsKey("searchResultType")) {
      searchResultType = _json["searchResultType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (linkedResource != null) {
      _json["linkedResource"] = linkedResource;
    }
    if (relativeResourceName != null) {
      _json["relativeResourceName"] = relativeResourceName;
    }
    if (searchResultSubtype != null) {
      _json["searchResultSubtype"] = searchResultSubtype;
    }
    if (searchResultType != null) {
      _json["searchResultType"] = searchResultType;
    }
    return _json;
  }
}

/// Message representing one policy tag when exported as a nested proto.
class GoogleCloudDatacatalogV1beta1SerializedPolicyTag {
  /// Children of the policy tag if any.
  core.List<GoogleCloudDatacatalogV1beta1SerializedPolicyTag> childPolicyTags;

  /// Description of the serialized policy tag. The length of the description is
  /// limited to 2000 bytes when encoded in UTF-8. If not set, defaults to an
  /// empty description.
  core.String description;

  /// Required. Display name of the policy tag. Max 200 bytes when encoded in
  /// UTF-8.
  core.String displayName;

  /// Resource name of the policy tag. This field will be ignored when calling
  /// ImportTaxonomies.
  core.String policyTag;

  GoogleCloudDatacatalogV1beta1SerializedPolicyTag();

  GoogleCloudDatacatalogV1beta1SerializedPolicyTag.fromJson(core.Map _json) {
    if (_json.containsKey("childPolicyTags")) {
      childPolicyTags = (_json["childPolicyTags"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1SerializedPolicyTag>((value) =>
              new GoogleCloudDatacatalogV1beta1SerializedPolicyTag.fromJson(
                  value))
          .toList();
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("policyTag")) {
      policyTag = _json["policyTag"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (childPolicyTags != null) {
      _json["childPolicyTags"] =
          childPolicyTags.map((value) => (value).toJson()).toList();
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (policyTag != null) {
      _json["policyTag"] = policyTag;
    }
    return _json;
  }
}

/// Message capturing a taxonomy and its policy tag hierarchy as a nested proto.
/// Used for taxonomy import/export and mutation.
class GoogleCloudDatacatalogV1beta1SerializedTaxonomy {
  /// Description of the serialized taxonomy. The length of the description is
  /// limited to 2000 bytes when encoded in UTF-8. If not set, defaults to an
  /// empty description.
  core.String description;

  /// Required. Display name of the taxonomy. Max 200 bytes when encoded in
  /// UTF-8.
  core.String displayName;

  /// Top level policy tags associated with the taxonomy if any.
  core.List<GoogleCloudDatacatalogV1beta1SerializedPolicyTag> policyTags;

  GoogleCloudDatacatalogV1beta1SerializedTaxonomy();

  GoogleCloudDatacatalogV1beta1SerializedTaxonomy.fromJson(core.Map _json) {
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("policyTags")) {
      policyTags = (_json["policyTags"] as core.List)
          .map<GoogleCloudDatacatalogV1beta1SerializedPolicyTag>((value) =>
              new GoogleCloudDatacatalogV1beta1SerializedPolicyTag.fromJson(
                  value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (description != null) {
      _json["description"] = description;
    }
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (policyTags != null) {
      _json["policyTags"] =
          policyTags.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Timestamps about this resource according to a particular system.
class GoogleCloudDatacatalogV1beta1SystemTimestamps {
  /// The creation time of the resource within the given system.
  core.String createTime;

  /// Output only. The expiration time of the resource within the given system.
  /// Currently only apllicable to BigQuery resources.
  core.String expireTime;

  /// The last-modified time of the resource within the given system.
  core.String updateTime;

  GoogleCloudDatacatalogV1beta1SystemTimestamps();

  GoogleCloudDatacatalogV1beta1SystemTimestamps.fromJson(core.Map _json) {
    if (_json.containsKey("createTime")) {
      createTime = _json["createTime"];
    }
    if (_json.containsKey("expireTime")) {
      expireTime = _json["expireTime"];
    }
    if (_json.containsKey("updateTime")) {
      updateTime = _json["updateTime"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (createTime != null) {
      _json["createTime"] = createTime;
    }
    if (expireTime != null) {
      _json["expireTime"] = expireTime;
    }
    if (updateTime != null) {
      _json["updateTime"] = updateTime;
    }
    return _json;
  }
}

/// Normal BigQuery table spec.
class GoogleCloudDatacatalogV1beta1TableSpec {
  /// Output only. If the table is a dated shard, i.e., with name pattern
  /// `[prefix]YYYYMMDD`, `grouped_entry` is the Data Catalog resource name of
  /// the date sharded grouped entry, for example,
  /// `projects/{project_id}/locations/{location}/entrygroups/{entry_group_id}/entries/{entry_id}`.
  /// Otherwise, `grouped_entry` is empty.
  core.String groupedEntry;

  GoogleCloudDatacatalogV1beta1TableSpec();

  GoogleCloudDatacatalogV1beta1TableSpec.fromJson(core.Map _json) {
    if (_json.containsKey("groupedEntry")) {
      groupedEntry = _json["groupedEntry"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (groupedEntry != null) {
      _json["groupedEntry"] = groupedEntry;
    }
    return _json;
  }
}

/// Tags are used to attach custom metadata to Data Catalog resources. Tags
/// conform to the specifications within their tag template. See [Data Catalog
/// IAM](https://cloud.google.com/data-catalog/docs/concepts/iam) for
/// information on the permissions needed to create or view tags.
class GoogleCloudDatacatalogV1beta1Tag {
  /// Resources like Entry can have schemas associated with them. This scope
  /// allows users to attach tags to an individual column based on that schema.
  /// For attaching a tag to a nested column, use `.` to separate the column
  /// names. Example: * `outer_column.inner_column`
  core.String column;

  /// Required. This maps the ID of a tag field to the value of and additional
  /// information about that field. Valid field IDs are defined by the tag's
  /// template. A tag must have at least 1 field and at most 500 fields.
  core.Map<core.String, GoogleCloudDatacatalogV1beta1TagField> fields;

  /// The resource name of the tag in URL format. Example: *
  /// projects/{project_id}/locations/{location}/entrygroups/{entry_group_id}/entries/{entry_id}/tags/{tag_id}
  /// where `tag_id` is a system-generated identifier. Note that this Tag may
  /// not actually be stored in the location in this name.
  core.String name;

  /// Required. The resource name of the tag template that this tag uses.
  /// Example: *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template_id}
  /// This field cannot be modified after creation.
  core.String template;

  /// Output only. The display name of the tag template.
  core.String templateDisplayName;

  GoogleCloudDatacatalogV1beta1Tag();

  GoogleCloudDatacatalogV1beta1Tag.fromJson(core.Map _json) {
    if (_json.containsKey("column")) {
      column = _json["column"];
    }
    if (_json.containsKey("fields")) {
      fields = commons.mapMap<core.Map, GoogleCloudDatacatalogV1beta1TagField>(
          _json["fields"].cast<core.String, core.Map>(),
          (core.Map item) =>
              new GoogleCloudDatacatalogV1beta1TagField.fromJson(item));
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("template")) {
      template = _json["template"];
    }
    if (_json.containsKey("templateDisplayName")) {
      templateDisplayName = _json["templateDisplayName"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (column != null) {
      _json["column"] = column;
    }
    if (fields != null) {
      _json["fields"] = commons.mapMap<GoogleCloudDatacatalogV1beta1TagField,
              core.Map<core.String, core.Object>>(fields,
          (GoogleCloudDatacatalogV1beta1TagField item) => (item).toJson());
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (template != null) {
      _json["template"] = template;
    }
    if (templateDisplayName != null) {
      _json["templateDisplayName"] = templateDisplayName;
    }
    return _json;
  }
}

/// Contains the value and supporting information for a field within a Tag.
class GoogleCloudDatacatalogV1beta1TagField {
  /// Holds the value for a tag field with boolean type.
  core.bool boolValue;

  /// Output only. The display name of this field.
  core.String displayName;

  /// Holds the value for a tag field with double type.
  core.double doubleValue;

  /// Holds the value for a tag field with enum type. This value must be one of
  /// the allowed values in the definition of this enum.
  GoogleCloudDatacatalogV1beta1TagFieldEnumValue enumValue;

  /// Output only. The order of this field with respect to other fields in this
  /// tag. It can be set in Tag. For example, a higher value can indicate a more
  /// important field. The value can be negative. Multiple fields can have the
  /// same order, and field orders within a tag do not have to be sequential.
  core.int order;

  /// Holds the value for a tag field with string type.
  core.String stringValue;

  /// Holds the value for a tag field with timestamp type.
  core.String timestampValue;

  GoogleCloudDatacatalogV1beta1TagField();

  GoogleCloudDatacatalogV1beta1TagField.fromJson(core.Map _json) {
    if (_json.containsKey("boolValue")) {
      boolValue = _json["boolValue"];
    }
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("doubleValue")) {
      doubleValue = _json["doubleValue"].toDouble();
    }
    if (_json.containsKey("enumValue")) {
      enumValue = new GoogleCloudDatacatalogV1beta1TagFieldEnumValue.fromJson(
          _json["enumValue"]);
    }
    if (_json.containsKey("order")) {
      order = _json["order"];
    }
    if (_json.containsKey("stringValue")) {
      stringValue = _json["stringValue"];
    }
    if (_json.containsKey("timestampValue")) {
      timestampValue = _json["timestampValue"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (boolValue != null) {
      _json["boolValue"] = boolValue;
    }
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (doubleValue != null) {
      _json["doubleValue"] = doubleValue;
    }
    if (enumValue != null) {
      _json["enumValue"] = (enumValue).toJson();
    }
    if (order != null) {
      _json["order"] = order;
    }
    if (stringValue != null) {
      _json["stringValue"] = stringValue;
    }
    if (timestampValue != null) {
      _json["timestampValue"] = timestampValue;
    }
    return _json;
  }
}

/// Holds an enum value.
class GoogleCloudDatacatalogV1beta1TagFieldEnumValue {
  /// The display name of the enum value.
  core.String displayName;

  GoogleCloudDatacatalogV1beta1TagFieldEnumValue();

  GoogleCloudDatacatalogV1beta1TagFieldEnumValue.fromJson(core.Map _json) {
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    return _json;
  }
}

/// A tag template defines a tag, which can have one or more typed fields. The
/// template is used to create and attach the tag to GCP resources. [Tag
/// template
/// roles](https://cloud.google.com/iam/docs/understanding-roles#data-catalog-roles)
/// provide permissions to create, edit, and use the template. See, for example,
/// the [TagTemplate
/// User](https://cloud.google.com/data-catalog/docs/how-to/template-user) role,
/// which includes permission to use the tag template to tag resources.
class GoogleCloudDatacatalogV1beta1TagTemplate {
  /// The display name for this template. Defaults to an empty string.
  core.String displayName;

  /// Required. Map of tag template field IDs to the settings for the field.
  /// This map is an exhaustive list of the allowed fields. This map must
  /// contain at least one field and at most 500 fields. The keys to this map
  /// are tag template field IDs. Field IDs can contain letters (both uppercase
  /// and lowercase), numbers (0-9) and underscores (_). Field IDs must be at
  /// least 1 character long and at most 64 characters long. Field IDs must
  /// start with a letter or underscore.
  core.Map<core.String, GoogleCloudDatacatalogV1beta1TagTemplateField> fields;

  /// The resource name of the tag template in URL format. Example: *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template_id}
  /// Note that this TagTemplate and its child resources may not actually be
  /// stored in the location in this name.
  core.String name;

  GoogleCloudDatacatalogV1beta1TagTemplate();

  GoogleCloudDatacatalogV1beta1TagTemplate.fromJson(core.Map _json) {
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("fields")) {
      fields = commons.mapMap<core.Map,
              GoogleCloudDatacatalogV1beta1TagTemplateField>(
          _json["fields"].cast<core.String, core.Map>(),
          (core.Map item) =>
              new GoogleCloudDatacatalogV1beta1TagTemplateField.fromJson(item));
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (fields != null) {
      _json["fields"] = commons.mapMap<
              GoogleCloudDatacatalogV1beta1TagTemplateField,
              core.Map<core.String, core.Object>>(
          fields,
          (GoogleCloudDatacatalogV1beta1TagTemplateField item) =>
              (item).toJson());
    }
    if (name != null) {
      _json["name"] = name;
    }
    return _json;
  }
}

/// The template for an individual field within a tag template.
class GoogleCloudDatacatalogV1beta1TagTemplateField {
  /// The display name for this field. Defaults to an empty string.
  core.String displayName;

  /// Whether this is a required field. Defaults to false.
  core.bool isRequired;

  /// Output only. The resource name of the tag template field in URL format.
  /// Example: *
  /// projects/{project_id}/locations/{location}/tagTemplates/{tag_template}/fields/{field}
  /// Note that this TagTemplateField may not actually be stored in the location
  /// in this name.
  core.String name;

  /// The order of this field with respect to other fields in this tag template.
  /// A higher value indicates a more important field. The value can be
  /// negative. Multiple fields can have the same order, and field orders within
  /// a tag do not have to be sequential.
  core.int order;

  /// Required. The type of value this tag field can contain.
  GoogleCloudDatacatalogV1beta1FieldType type;

  GoogleCloudDatacatalogV1beta1TagTemplateField();

  GoogleCloudDatacatalogV1beta1TagTemplateField.fromJson(core.Map _json) {
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("isRequired")) {
      isRequired = _json["isRequired"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("order")) {
      order = _json["order"];
    }
    if (_json.containsKey("type")) {
      type = new GoogleCloudDatacatalogV1beta1FieldType.fromJson(_json["type"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (isRequired != null) {
      _json["isRequired"] = isRequired;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (order != null) {
      _json["order"] = order;
    }
    if (type != null) {
      _json["type"] = (type).toJson();
    }
    return _json;
  }
}

/// A taxonomy is a collection of policy tags that classify data along a common
/// axis. For instance a data *sensitivity* taxonomy could contain policy tags
/// denoting PII such as age, zipcode, and SSN. A data *origin* taxonomy could
/// contain policy tags to distinguish user data, employee data, partner data,
/// public data.
class GoogleCloudDatacatalogV1beta1Taxonomy {
  /// Optional. A list of policy types that are activated for this taxonomy. If
  /// not set, defaults to an empty list.
  core.List<core.String> activatedPolicyTypes;

  /// Optional. Description of this taxonomy. It must: contain only unicode
  /// characters, tabs, newlines, carriage returns and page breaks; and be at
  /// most 2000 bytes long when encoded in UTF-8. If not set, defaults to an
  /// empty description.
  core.String description;

  /// Required. User defined name of this taxonomy. It must: contain only
  /// unicode letters, numbers, underscores, dashes and spaces; not start or end
  /// with spaces; and be at most 200 bytes long when encoded in UTF-8.
  core.String displayName;

  /// Output only. Resource name of this taxonomy, whose format is:
  /// "projects/{project_number}/locations/{location_id}/taxonomies/{id}".
  core.String name;

  GoogleCloudDatacatalogV1beta1Taxonomy();

  GoogleCloudDatacatalogV1beta1Taxonomy.fromJson(core.Map _json) {
    if (_json.containsKey("activatedPolicyTypes")) {
      activatedPolicyTypes =
          (_json["activatedPolicyTypes"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (activatedPolicyTypes != null) {
      _json["activatedPolicyTypes"] = activatedPolicyTypes;
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (name != null) {
      _json["name"] = name;
    }
    return _json;
  }
}

/// Table view specification.
class GoogleCloudDatacatalogV1beta1ViewSpec {
  /// Output only. The query that defines the table view.
  core.String viewQuery;

  GoogleCloudDatacatalogV1beta1ViewSpec();

  GoogleCloudDatacatalogV1beta1ViewSpec.fromJson(core.Map _json) {
    if (_json.containsKey("viewQuery")) {
      viewQuery = _json["viewQuery"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (viewQuery != null) {
      _json["viewQuery"] = viewQuery;
    }
    return _json;
  }
}

/// An Identity and Access Management (IAM) policy, which specifies access
/// controls for Google Cloud resources. A `Policy` is a collection of
/// `bindings`. A `binding` binds one or more `members` to a single `role`.
/// Members can be user accounts, service accounts, Google groups, and domains
/// (such as G Suite). A `role` is a named list of permissions; each `role` can
/// be an IAM predefined role or a user-created custom role. For some types of
/// Google Cloud resources, a `binding` can also specify a `condition`, which is
/// a logical expression that allows access to a resource only if the expression
/// evaluates to `true`. A condition can add constraints based on attributes of
/// the request, the resource, or both. To learn which resources support
/// conditions in their IAM policies, see the [IAM
/// documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
/// **JSON example:** { "bindings": [ { "role":
/// "roles/resourcemanager.organizationAdmin", "members": [
/// "user:mike@example.com", "group:admins@example.com", "domain:google.com",
/// "serviceAccount:my-project-id@appspot.gserviceaccount.com" ] }, { "role":
/// "roles/resourcemanager.organizationViewer", "members": [
/// "user:eve@example.com" ], "condition": { "title": "expirable access",
/// "description": "Does not grant access after Sep 2020", "expression":
/// "request.time < timestamp('2020-10-01T00:00:00.000Z')", } } ], "etag":
/// "BwWWja0YfJA=", "version": 3 } **YAML example:** bindings: - members: -
/// user:mike@example.com - group:admins@example.com - domain:google.com -
/// serviceAccount:my-project-id@appspot.gserviceaccount.com role:
/// roles/resourcemanager.organizationAdmin - members: - user:eve@example.com
/// role: roles/resourcemanager.organizationViewer condition: title: expirable
/// access description: Does not grant access after Sep 2020 expression:
/// request.time < timestamp('2020-10-01T00:00:00.000Z') - etag: BwWWja0YfJA= -
/// version: 3 For a description of IAM and its features, see the [IAM
/// documentation](https://cloud.google.com/iam/docs/).
class Policy {
  /// Associates a list of `members` to a `role`. Optionally, may specify a
  /// `condition` that determines how and when the `bindings` are applied. Each
  /// of the `bindings` must contain at least one member.
  core.List<Binding> bindings;

  /// `etag` is used for optimistic concurrency control as a way to help prevent
  /// simultaneous updates of a policy from overwriting each other. It is
  /// strongly suggested that systems make use of the `etag` in the
  /// read-modify-write cycle to perform policy updates in order to avoid race
  /// conditions: An `etag` is returned in the response to `getIamPolicy`, and
  /// systems are expected to put that etag in the request to `setIamPolicy` to
  /// ensure that their change will be applied to the same version of the
  /// policy. **Important:** If you use IAM Conditions, you must include the
  /// `etag` field whenever you call `setIamPolicy`. If you omit this field,
  /// then IAM allows you to overwrite a version `3` policy with a version `1`
  /// policy, and all of the conditions in the version `3` policy are lost.
  core.String etag;
  core.List<core.int> get etagAsBytes {
    return convert.base64.decode(etag);
  }

  set etagAsBytes(core.List<core.int> _bytes) {
    etag =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  /// Specifies the format of the policy. Valid values are `0`, `1`, and `3`.
  /// Requests that specify an invalid value are rejected. Any operation that
  /// affects conditional role bindings must specify version `3`. This
  /// requirement applies to the following operations: * Getting a policy that
  /// includes a conditional role binding * Adding a conditional role binding to
  /// a policy * Changing a conditional role binding in a policy * Removing any
  /// role binding, with or without a condition, from a policy that includes
  /// conditions **Important:** If you use IAM Conditions, you must include the
  /// `etag` field whenever you call `setIamPolicy`. If you omit this field,
  /// then IAM allows you to overwrite a version `3` policy with a version `1`
  /// policy, and all of the conditions in the version `3` policy are lost. If a
  /// policy does not include any conditions, operations on that policy may
  /// specify any valid version or leave the field unset. To learn which
  /// resources support conditions in their IAM policies, see the [IAM
  /// documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
  core.int version;

  Policy();

  Policy.fromJson(core.Map _json) {
    if (_json.containsKey("bindings")) {
      bindings = (_json["bindings"] as core.List)
          .map<Binding>((value) => new Binding.fromJson(value))
          .toList();
    }
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("version")) {
      version = _json["version"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (bindings != null) {
      _json["bindings"] = bindings.map((value) => (value).toJson()).toList();
    }
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (version != null) {
      _json["version"] = version;
    }
    return _json;
  }
}

/// Request message for `SetIamPolicy` method.
class SetIamPolicyRequest {
  /// REQUIRED: The complete policy to be applied to the `resource`. The size of
  /// the policy is limited to a few 10s of KB. An empty policy is a valid
  /// policy but certain Cloud Platform services (such as Projects) might reject
  /// them.
  Policy policy;

  SetIamPolicyRequest();

  SetIamPolicyRequest.fromJson(core.Map _json) {
    if (_json.containsKey("policy")) {
      policy = new Policy.fromJson(_json["policy"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (policy != null) {
      _json["policy"] = (policy).toJson();
    }
    return _json;
  }
}

/// Request message for `TestIamPermissions` method.
class TestIamPermissionsRequest {
  /// The set of permissions to check for the `resource`. Permissions with
  /// wildcards (such as '*' or 'storage.*') are not allowed. For more
  /// information see [IAM
  /// Overview](https://cloud.google.com/iam/docs/overview#permissions).
  core.List<core.String> permissions;

  TestIamPermissionsRequest();

  TestIamPermissionsRequest.fromJson(core.Map _json) {
    if (_json.containsKey("permissions")) {
      permissions = (_json["permissions"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (permissions != null) {
      _json["permissions"] = permissions;
    }
    return _json;
  }
}

/// Response message for `TestIamPermissions` method.
class TestIamPermissionsResponse {
  /// A subset of `TestPermissionsRequest.permissions` that the caller is
  /// allowed.
  core.List<core.String> permissions;

  TestIamPermissionsResponse();

  TestIamPermissionsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("permissions")) {
      permissions = (_json["permissions"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (permissions != null) {
      _json["permissions"] = permissions;
    }
    return _json;
  }
}

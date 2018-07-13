# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/compute/property/backendservice_backends'
require 'google/compute/property/backendservice_cache_key_policy'
require 'google/compute/property/backendservice_cdn_policy'
require 'google/compute/property/backendservice_connection_draining'
require 'google/compute/property/boolean'
require 'google/compute/property/double'
require 'google/compute/property/enum'
require 'google/compute/property/instancegroup_selflink'
require 'google/compute/property/integer'
require 'google/compute/property/region_selflink'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/time'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcompute_backend_service) do
  @doc = <<-DOC
    Creates a BackendService resource in the specified project using the data included in the
    request.
  DOC

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  ensurable

  newparam :credential do
    desc <<-DESC
      A gauth_credential name to be used to authenticate with Google Cloud
      Platform.
    DESC
  end

  newparam(:project) do
    desc 'A Google Cloud Platform project to manage.'
  end

  newparam(:name, namevar: true) do
    # TODO(nelsona): Make this description to match the key of the object.
    desc 'The name of the BackendService.'
  end

  newproperty(:affinity_cookie_ttl_sec, parent: Google::Compute::Property::Integer) do
    desc <<-DOC
      Lifetime of cookies in seconds if session_affinity is GENERATED_COOKIE. If set to 0, the
      cookie is non-persistent and lasts only until the end of the browser session (or equivalent).
      The maximum allowed value for TTL is one day. When the load balancing scheme is INTERNAL,
      this field is not used.
    DOC
  end

  newproperty(:backends, parent: Google::Compute::Property::BackendServiceBackendArray) do
    desc 'The list of backends that serve this BackendService.'
  end

  newproperty(:cdn_policy, parent: Google::Compute::Property::BackeServiCdnPolic) do
    desc 'Cloud CDN configuration for this BackendService.'
  end

  newproperty(:connection_draining, parent: Google::Compute::Property::BackeServiConneDrain) do
    desc 'Settings for connection draining'
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc 'An optional description of this resource.'
  end

  newproperty(:enable_cdn, parent: Google::Compute::Property::Boolean) do
    desc <<-DOC
      If true, enable Cloud CDN for this BackendService. When the load balancing scheme is
      INTERNAL, this field is not used.
    DOC
    newvalue(:true)
    newvalue(:false)
  end

  newproperty(:health_checks, parent: Google::Compute::Property::StringArray) do
    desc <<-DOC
      The list of URLs to the HttpHealthCheck or HttpsHealthCheck resource for health checking this
      BackendService. Currently at most one health check can be specified, and a health check is
      required. For internal load balancing, a URL to a HealthCheck resource must be specified
      instead.
    DOC
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc 'The unique identifier for the resource. (output only)'
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc <<-DOC
      Name of the resource. Provided by the client when the resource is created. The name must be
      1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters
      long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first
      character must be a lowercase letter, and all following characters must be a dash, lowercase
      letter, or digit, except the last character, which cannot be a dash.
    DOC
  end

  newproperty(:port_name, parent: Google::Compute::Property::String) do
    desc <<-DOC
      Name of backend port. The same name should appear in the instance groups referenced by this
      service. Required when the load balancing scheme is EXTERNAL. When the load balancing scheme
      is INTERNAL, this field is not used.
    DOC
  end

  newproperty(:protocol, parent: Google::Compute::Property::Enum) do
    desc <<-DOC
      The protocol this BackendService uses to communicate with backends. Possible values are HTTP,
      HTTPS, TCP, and SSL. The default is HTTP. For internal load balancing, the possible values
      are TCP and UDP, and the default is TCP.
    DOC
    newvalue(:HTTP)
    newvalue(:HTTPS)
    newvalue(:TCP)
    newvalue(:SSL)
  end

  newproperty(:region, parent: Google::Compute::Property::RegioSelfLinkRef) do
    desc <<-DOC
      The region where the regional backend service resides. This field is not applicable to global
      backend services.
    DOC
  end

  newproperty(:session_affinity, parent: Google::Compute::Property::Enum) do
    desc <<-DOC
      Type of session affinity to use. The default is NONE. When the load balancing scheme is
      EXTERNAL, can be NONE, CLIENT_IP, or GENERATED_COOKIE. When the load balancing scheme is
      INTERNAL, can be NONE, CLIENT_IP, CLIENT_IP_PROTO, or CLIENT_IP_PORT_PROTO. When the protocol
      is UDP, this field is not used.
    DOC
    newvalue(:NONE)
    newvalue(:CLIENT_IP)
    newvalue(:GENERATED_COOKIE)
    newvalue(:CLIENT_IP_PROTO)
    newvalue(:CLIENT_IP_PORT_PROTO)
  end

  newproperty(:timeout_sec, parent: Google::Compute::Property::Integer) do
    desc <<-DOC
      How many seconds to wait for the backend before considering it a failed request. Default is
      30 seconds. Valid range is [1, 86400].
    DOC
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end

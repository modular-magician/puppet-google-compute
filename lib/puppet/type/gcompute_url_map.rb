# Copyright 2017 Google Inc.
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
#     This file is automatically generated by puppet-codegen and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/compute/property/backendservice_selflink'
require 'google/compute/property/integer'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/time'
require 'google/compute/property/urlmap_host_rules'
require 'google/compute/property/urlmap_path_matchers'
require 'google/compute/property/urlmap_path_rules'
require 'google/compute/property/urlmap_tests'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcompute_url_map) do
  @doc = <<-DOC
    UrlMaps are used to route requests to a backend service based on rules that
    you define for the host and path of an incoming URL.
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
    desc 'The name of the UrlMap.'
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:default_service,
              parent: Google::Compute::Property::BackServSelfLinkRef) do
    desc 'A reference to BackendService resource'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc <<-DOC
      An optional description of this resource. Provide this property when you
      create the resource.
    DOC
  end

  newproperty(:host_rules,
              parent: Google::Compute::Property::UrlMapHostRulesArray) do
    desc 'The list of HostRules to use against the URL.'
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc 'The unique identifier for the resource. (output only)'
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc <<-DOC
      Name of the resource. Provided by the client when the resource is
      created. The name must be 1-63 characters long, and comply with RFC1035.
      Specifically, the name must be 1-63 characters long and match the regular
      expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character
      must be a lowercase letter, and all following characters must be a dash,
      lowercase letter, or digit, except the last character, which cannot be a
      dash.
    DOC
  end

  newproperty(:path_matchers,
              parent: Google::Compute::Property::UrlMapPathMatchArray) do
    desc 'The list of named PathMatchers to use against the URL.'
  end

  newproperty(:tests, parent: Google::Compute::Property::UrlMapTestsArray) do
    desc <<-DOC
      The list of expected URL mappings. Request to update this UrlMap will
      succeed only if all of the test cases pass.
    DOC
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end

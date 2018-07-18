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

require 'google/compute/property/global_address_ip_version'
require 'google/compute/property/integer'
require 'google/compute/property/region_selflink'
require 'google/compute/property/string'
require 'google/compute/property/time'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcompute_global_address) do
  @doc = <<-DOC
    Represents a Global Address resource. Global addresses are used for HTTP(S) load balancing.
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
    desc 'The name of the GlobalAddress.'
  end

  newproperty(:address, parent: Google::Compute::Property::String) do
    desc 'The static external IP address represented by this resource. (output only)'
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc <<-DOC
      An optional description of this resource. Provide this property when you create the resource.
    DOC
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc <<-DOC
      The unique identifier for the resource. This identifier is defined by the server. (output
      only)
    DOC
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

  newproperty(:ip_version, parent: Google::Compute::Property::IpVersionEnum) do
    desc <<-DOC
      The IP Version that will be used by this address. Valid options are IPV4 or IPV6. The default
      value is IPV4.
    DOC
    newvalue(:IPV4)
    newvalue(:IPV6)
  end

  newproperty(:region, parent: Google::Compute::Property::RegioSelfLinkRef) do
    desc 'A reference to the region where the regional address resides. (output only)'
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end

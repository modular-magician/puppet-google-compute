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
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/compute/property/boolean'
require 'google/compute/property/integer'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/time'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcompute_network) do
  @doc = <<-DOC
    Represents a Network resource. Your Cloud Platform Console project can
    contain multiple networks, and each network can have multiple instances
    attached to it. A network allows you to define a gateway IP and the network
    range for the instances attached to that network. Every project is provided
    with a default network with preset configurations and firewall rules. You
    can choose to customize the default network by adding or removing rules, or
    you can create new networks in that project. Generally, most users only
    need one network, although you can have up to five networks per project by
    default. A network belongs to only one project, and each instance can only
    belong to one network. All Compute Engine networks use the IPv4 protocol.
    Compute Engine currently does not support IPv6. However, Google is a major
    advocate of IPv6 and it is an important future direction.
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
    desc 'The name of the Network.'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc <<-DOC
      An optional description of this resource. Provide this property when you
      create the resource.
    DOC
  end

  newproperty(:gateway_ipv4, parent: Google::Compute::Property::String) do
    desc <<-DOC
      A gateway address for default routing to other networks. This value is
      read only and is selected by the Google Compute Engine, typically as the
      first usable address in the IPv4Range.
    DOC
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc 'The unique identifier for the resource. (output only)'
  end

  newproperty(:ipv4_range, parent: Google::Compute::Property::String) do
    desc <<-DOC
      The range of internal addresses that are legal on this network. This
      range is a CIDR specification, for example: 192.168.0.0/16. Provided by
      the client when the network is created.
    DOC
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc <<-DOC
      Name of the resource. Provided by the client when the resource is
      created. The name must be 1-63 characters long, and comply with RFC1035.
      Specifically, the name must be 1-63 characters long and match the regular
      expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character
      must be a lowercase letter, and all following characters must be a dash,
      lowercase letter, or digit, except the last character, which cannot be a
      dash.
    DOC
  end

  newproperty(:subnetworks, parent: Google::Compute::Property::StringArray) do
    desc <<-DOC
      Server-defined fully-qualified URLs for all subnetworks in this network.
      (output only)
    DOC
  end

  newproperty(:auto_create_subnetworks,
              parent: Google::Compute::Property::Boolean) do
    desc <<-DOC
      When set to true, the network is created in "auto subnet mode". When set
      to false, the network is in "custom subnet mode". In "auto subnet mode",
      a newly created network is assigned the default CIDR of 10.128.0.0/9 and
      it automatically creates one subnetwork per region.
    DOC
    newvalue(:true)
    newvalue(:false)
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end

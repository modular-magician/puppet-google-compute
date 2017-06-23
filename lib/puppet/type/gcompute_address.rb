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

require 'google/compute/property/integer'
require 'google/compute/property/resourceref'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/time'
require 'puppet'

Puppet::Type.newtype(:gcompute_address) do
  @doc = <<-EOT
    Represents an Address resource. Each virtual machine instance has an
    ephemeral internal IP address and, optionally, an external IP address. To
    communicate between instances on the same network, you can use an
    instance's internal IP address. To communicate with the Internet and
    instances outside of the same network, you must specify the instance's
    external IP address. Internal IP addresses are ephemeral and only belong to
    an instance for the lifetime of the instance; if the instance is deleted
    and recreated, the instance is assigned a new internal IP address, either
    by Compute Engine or by you. External IP addresses can be either ephemeral
    or static.
  EOT

  autorequire(:gauth_credential) do
    [self[:credential]]
  end

  autorequire(:gcompute_region) do
    [self[:region]]
  end

  ensurable

  newparam :credential do
    desc <<-EOT
      A gauth_credential name to be used to authenticate with Google Cloud
      Platform.
    EOT
  end

  newparam(:project) do
    desc 'A Google Cloud Platform project to manage.'
  end

  newparam(:name, namevar: true) do
    # TODO(nelsona): Make this description to match the key of the object.
    desc 'The name of the Address.'
  end

  newparam(:region, parent: Google::Compute::Property::ResourceRef) do
    desc 'A reference to Region resource'
  end

  newproperty(:address, parent: Google::Compute::Property::String) do
    desc <<-EOT
      The static external IP address represented by this resource. Only IPv4 is
      supported.
    EOT
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc 'An optional description of this resource.'
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc 'The unique identifier for the resource. (output only)'
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc 'Name of the resource.'
  end

  newproperty(:users, parent: Google::Compute::Property::StringArray) do
    desc 'The URLs of the resources that are using this address. (output only)'
  end
end
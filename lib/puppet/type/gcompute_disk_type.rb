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

require 'google/compute/property/disktype_deprecated'
require 'google/compute/property/enum'
require 'google/compute/property/integer'
require 'google/compute/property/string'
require 'google/compute/property/time'
require 'google/compute/property/zone_name'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcompute_disk_type) do
  @doc = <<-DOC
    Represents a DiskType resource. A DiskType resource represents the type of
    disk to use, such as a pd-ssd or pd-standard. To reference a disk type, use
    the disk type's full or partial URL.
  DOC

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  autorequire(:gcompute_zone) do
    reference = self[:zone]
    raise "#{ref} required property 'zone' is missing" if reference.nil?
    reference.autorequires
  end

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
    desc 'The name of the DiskType.'
  end

  newparam(:zone, parent: Google::Compute::Property::ZoneNameRef) do
    desc 'A reference to Zone resource'
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:default_disk_size_gb,
              parent: Google::Compute::Property::Integer) do
    desc 'Server-defined default disk size in GB. (output only)'
  end

  newproperty(:deprecated,
              parent: Google::Compute::Property::DiskTypeDepreca) do
    desc 'The deprecation status associated with this disk type. (output only)'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc 'An optional description of this resource. (output only)'
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc 'The unique identifier for the resource. (output only)'
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc 'Name of the resource.'
  end

  newproperty(:valid_disk_size, parent: Google::Compute::Property::String) do
    desc <<-DOC
      An optional textual description of the valid disk size, such as
      "10GB-10TB". (output only)
    DOC
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end

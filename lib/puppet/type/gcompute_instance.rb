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

require 'google/compute/property/address_address'
require 'google/compute/property/boolean'
require 'google/compute/property/disk_selflink'
require 'google/compute/property/disktype_selflink'
require 'google/compute/property/enum'
require 'google/compute/property/instance_access_configs'
require 'google/compute/property/instance_alias_ip_ranges'
require 'google/compute/property/instance_disk_encryption_key'
require 'google/compute/property/instance_disks'
require 'google/compute/property/instance_guest_accelerators'
require 'google/compute/property/instance_initialize_params'
require 'google/compute/property/instance_network_interfaces'
require 'google/compute/property/instance_scheduling'
require 'google/compute/property/instance_service_accounts'
require 'google/compute/property/instance_source_image_encryption_key'
require 'google/compute/property/instance_tags'
require 'google/compute/property/integer'
require 'google/compute/property/machinetype_selflink'
require 'google/compute/property/namevalues'
require 'google/compute/property/network_selflink'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/subnetwork_selflink'
require 'google/compute/property/zone_name'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcompute_instance) do
  @doc = <<-DOC
    An instance is a virtual machine (VM) hosted on Google's infrastructure.
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
    desc 'The name of the Instance.'
  end

  newparam(:zone, parent: Google::Compute::Property::ZoneNameRef) do
    desc 'A reference to Zone resource'
  end

  newproperty(:can_ip_forward, parent: Google::Compute::Property::Boolean) do
    desc <<-DOC
      Allows this instance to send and receive packets with non-matching
      destination or source IPs. This is required if you plan to use this
      instance to forward routes.
    DOC
    newvalue(:true)
    newvalue(:false)
  end

  newproperty(:cpu_platform, parent: Google::Compute::Property::String) do
    desc 'The CPU platform used by this instance. (output only)'
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::String) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:disks, parent: Google::Compute::Property::InstanceDisksArray) do
    desc <<-DOC
      An array of disks that are associated with the instances that are created
      from this template.
    DOC
  end

  newproperty(:guest_accelerators,
              parent: Google::Compute::Property::InstancGuestAccelerArray) do
    desc <<-DOC
      List of the type and count of accelerator cards attached to the instance
    DOC
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc <<-DOC
      The unique identifier for the resource. This identifier is defined by the
      server. (output only)
    DOC
  end

  newproperty(:label_fingerprint, parent: Google::Compute::Property::String) do
    desc <<-DOC
      A fingerprint for this request, which is essentially a hash of the
      metadata's contents and used for optimistic locking. The fingerprint is
      initially generated by Compute Engine and changes after every request to
      modify or update metadata. You must always provide an up-to-date
      fingerprint hash in order to update or change metadata.
    DOC
  end

  newproperty(:metadata, parent: Google::Compute::Property::NameValues) do
    desc <<-DOC
      The metadata key/value pairs to assign to instances that are created from
      this template. These pairs can consist of custom metadata or predefined
      keys.
    DOC
  end

  newproperty(:machine_type,
              parent: Google::Compute::Property::MachTypeSelfLinkRef) do
    desc 'A reference to MachineType resource'
  end

  newproperty(:min_cpu_platform, parent: Google::Compute::Property::String) do
    desc <<-DOC
      Specifies a minimum CPU platform for the VM instance. Applicable values
      are the friendly names of CPU platforms
    DOC
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc <<-DOC
      The name of the resource, provided by the client when initially creating
      the resource. The resource name must be 1-63 characters long, and comply
      with RFC1035. Specifically, the name must be 1-63 characters long and
      match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the
      first character must be a lowercase letter, and all following characters
      must be a dash, lowercase letter, or digit, except the last character,
      which cannot be a dash.
    DOC
  end

  newproperty(:network_interfaces,
              parent: Google::Compute::Property::InstancNetworkInterfaArray) do
    desc <<-DOC
      An array of configurations for this interface. This specifies how this
      interface is configured to interact with other network services, such as
      connecting to the internet. Only one network interface is supported per
      instance.
    DOC
  end

  newproperty(:scheduling,
              parent: Google::Compute::Property::InstanceScheduling) do
    desc 'Sets the scheduling options for this instance.'
  end

  newproperty(:service_accounts,
              parent: Google::Compute::Property::InstancServiceAccountArray) do
    desc <<-DOC
      A list of service accounts, with their specified scopes, authorized for
      this instance. Only one service account per VM instance is supported.
    DOC
  end

  newproperty(:status, parent: Google::Compute::Property::String) do
    desc <<-DOC
      The status of the instance. One of the following values: PROVISIONING,
      STAGING, RUNNING, STOPPING, SUSPENDING, SUSPENDED, and TERMINATED.
      (output only)
    DOC
  end

  newproperty(:status_message, parent: Google::Compute::Property::String) do
    desc 'An optional, human-readable explanation of the status. (output only)'
  end

  newproperty(:tags, parent: Google::Compute::Property::InstanceTags) do
    desc <<-DOC
      A list of tags to apply to this instance. Tags are used to identify valid
      sources or targets for network firewalls and are specified by the client
      during instance creation. The tags can be later modified by the setTags
      method. Each tag within the list must comply with RFC1035.
    DOC
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end

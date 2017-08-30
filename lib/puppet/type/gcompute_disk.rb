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

require 'google/compute/property/disk_disk_encryption_key'
require 'google/compute/property/disk_source_image_encryption_key'
require 'google/compute/property/disk_source_snapshot_encryption_key'
require 'google/compute/property/integer'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/time'
require 'google/compute/property/zone_name'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcompute_disk) do
  @doc = <<-EOT
    Persistent disks are durable storage devices that function similarly to the
    physical disks in a desktop or a server. Compute Engine manages the
    hardware behind these devices to ensure data redundancy and optimize
    performance for you. Persistent disks are available as either standard hard
    disk drives (HDD) or solid-state drives (SSD). Persistent disks are located
    independently from your virtual machine instances, so you can detach or
    move persistent disks to keep your data even after you delete your
    instances. Persistent disk performance scales automatically with size, so
    you can resize your existing persistent disks or add more persistent disks
    to an instance to meet your performance and storage space requirements. Add
    a persistent disk to your instance when you need reliable and affordable
    storage with consistent performance characteristics.
  EOT

  autorequire(:gauth_credential) do
    [self[:credential]]
  end

  autorequire(:gcompute_zone) do
    self[:zone].autorequires
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
    desc 'The name of the Disk.'
  end

  newparam(:zone, parent: Google::Compute::Property::ZoneNameRef) do
    desc 'A reference to Zone resource'
  end

  newparam(:disk_encryption_key,
           parent: Google::Compute::Property::DiskDiskEncryKey) do
    desc <<-EOT
      Encrypts the disk using a customer-supplied encryption key. After you
      encrypt a disk with a customer-supplied key, you must provide the same
      key if you use the disk later (e.g. to create a disk snapshot or an
      image, or to attach the disk to a virtual machine). Customer-supplied
      encryption keys do not protect access to metadata of the disk. If you do
      not provide an encryption key when creating the disk, then the disk will
      be encrypted using an automatically generated key and you do not need to
      provide a key to use the disk later.
    EOT
  end

  newparam(:source_image_encryption_key,
           parent: Google::Compute::Property::DiskSourImagEncrKey) do
    desc <<-EOT
      The customer-supplied encryption key of the source image. Required if the
      source image is protected by a customer-supplied encryption key.
    EOT
  end

  newparam(:source_image_id, parent: Google::Compute::Property::String) do
    desc <<-EOT
      The ID value of the image used to create this disk. This value identifies
      the exact image that was used to create this persistent disk. For
      example, if you created the persistent disk from an image that was later
      deleted and recreated under the same name, the source image ID would
      identify the exact version of the image that was used.
    EOT
  end

  newparam(:source_snapshot, parent: Google::Compute::Property::String) do
    desc <<-EOT
      The source snapshot used to create this disk. You can provide this as a
      partial or full URL to the resource. For example, the following are valid
      values: * https://www.googleapis.com/compute/v1/projects/project/global/
      snapshots/snapshot * projects/project/global/snapshots/snapshot *
      global/snapshots/snapshot
    EOT
  end

  newparam(:source_snapshot_encryption_key,
           parent: Google::Compute::Property::DiskSourSnapEncrKey) do
    desc <<-EOT
      The customer-supplied encryption key of the source snapshot. Required if
      the source snapshot is protected by a customer-supplied encryption key.
    EOT
  end

  newparam(:source_snapshot_id, parent: Google::Compute::Property::String) do
    desc <<-EOT
      The unique ID of the snapshot used to create this disk. This value
      identifies the exact snapshot that was used to create this persistent
      disk. For example, if you created the persistent disk from a snapshot
      that was later deleted and recreated under the same name, the source
      snapshot ID would identify the exact version of the snapshot that was
      used.
    EOT
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc <<-EOT
      An optional description of this resource. Provide this property when you
      create the resource.
    EOT
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc 'The unique identifier for the resource. (output only)'
  end

  newproperty(:last_attach_timestamp,
              parent: Google::Compute::Property::Time) do
    desc 'Last attach timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:last_detach_timestamp,
              parent: Google::Compute::Property::Time) do
    desc 'Last dettach timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:licenses, parent: Google::Compute::Property::StringArray) do
    desc 'Any applicable publicly visible licenses.'
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc <<-EOT
      Name of the resource. Provided by the client when the resource is
      created. The name must be 1-63 characters long, and comply with RFC1035.
      Specifically, the name must be 1-63 characters long and match the regular
      expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character
      must be a lowercase letter, and all following characters must be a dash,
      lowercase letter, or digit, except the last character, which cannot be a
      dash.
    EOT
  end

  newproperty(:size_gb, parent: Google::Compute::Property::Integer) do
    desc <<-EOT
      Size of the persistent disk, specified in GB. You can specify this field
      when creating a persistent disk using the sourceImage or sourceSnapshot
      parameter, or specify it alone to create an empty persistent disk. If you
      specify this field along with sourceImage or sourceSnapshot, the value of
      sizeGb must not be less than the size of the sourceImage or the size of
      the snapshot.
    EOT
  end

  newproperty(:source_image, parent: Google::Compute::Property::String) do
    desc <<-EOT
      The source image used to create this disk. If the source image is
      deleted, this field will not be set. To create a disk with one of the
      public operating system images, specify the image by its family name. For
      example, specify family/debian-8 to use the latest Debian 8 image:
      projects/debian-cloud/global/images/family/debian-8 Alternatively, use a
      specific version of a public operating system image:
      projects/debian-cloud/global/images/debian-8-jessie-vYYYYMMDD To create a
      disk with a private image that you created, specify the image name in the
      following format: global/images/my-private-image You can also specify a
      private image by its image family, which returns the latest version of
      the image in that family. Replace the image name with family/family-name:
      global/images/family/my-private-family
    EOT
  end

  newproperty(:type, parent: Google::Compute::Property::String) do
    desc <<-EOT
      URL of the disk type resource describing which disk type to use to create
      the disk. Provide this when creating the disk. (output only)
    EOT
  end

  newproperty(:users, parent: Google::Compute::Property::StringArray) do
    desc <<-EOT
      Links to the users of the disk (attached instances) in form:
      project/zones/zone/instances/instance (output only)
    EOT
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end

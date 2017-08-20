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

require 'google/compute/network/delete'
require 'google/compute/network/get'
require 'google/compute/network/post'
require 'google/compute/network/put'
require 'google/compute/property/disk_selflink'
require 'google/compute/property/enum'
require 'google/compute/property/image_deprecated'
require 'google/compute/property/image_guest_os_features'
require 'google/compute/property/image_image_encryption_key'
require 'google/compute/property/image_raw_disk'
require 'google/compute/property/image_source_disk_encryption_key'
require 'google/compute/property/integer'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/time'
require 'google/hash_utils'
require 'puppet'

Puppet::Type.type(:gcompute_image).provide(:google) do
  mk_resource_methods

  def self.instances
    debug('instances')
    raise [
      '"puppet resource" is not supported at the moment:',
      'TODO(nelsonjr): https://goto.google.com/graphite-bugs-view?id=167'
    ].join(' ')
  end

  def self.prefetch(resources)
    debug('prefetch')
    resources.each do |name, resource|
      project = resource[:project]
      debug("prefetch #{name}") if project.nil?
      debug("prefetch #{name} @ #{project}") unless project.nil?
      fetch = fetch_resource(resource, self_link(resource), 'compute#image')
      resource.provider = present(name, fetch) unless fetch.nil?
    end
  end

  def self.present(name, fetch)
    result = new({ title: name, ensure: :present }.merge(fetch_to_hash(fetch)))
    result
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def self.fetch_to_hash(fetch)
    {
      archive_size_bytes:
        Google::Compute::Property::Integer.api_munge(fetch['archiveSizeBytes']),
      creation_timestamp:
        Google::Compute::Property::Time.api_munge(fetch['creationTimestamp']),
      deprecated: Google::Compute::Property::ImageDeprecated.api_munge(
        fetch['deprecated']
      ),
      description:
        Google::Compute::Property::String.api_munge(fetch['description']),
      disk_size_gb:
        Google::Compute::Property::Integer.api_munge(fetch['diskSizeGb']),
      family: Google::Compute::Property::String.api_munge(fetch['family']),
      guest_os_features:
        Google::Compute::Property::ImageGuestOsFeatuArray.api_munge(
          fetch['guestOsFeatures']
        ),
      id: Google::Compute::Property::Integer.api_munge(fetch['id']),
      image_encryption_key:
        Google::Compute::Property::ImageImageEncryKey.api_munge(
          fetch['imageEncryptionKey']
        ),
      licenses:
        Google::Compute::Property::StringArray.api_munge(fetch['licenses']),
      name: Google::Compute::Property::String.api_munge(fetch['name']),
      raw_disk:
        Google::Compute::Property::ImageRawDisk.api_munge(fetch['rawDisk']),
      source_disk: Google::Compute::Property::DiskSelfLinkRef.api_munge(
        fetch['sourceDisk']
      ),
      source_disk_encryption_key:
        Google::Compute::Property::ImagSourDiskEncrKey.api_munge(
          fetch['sourceDiskEncryptionKey']
        ),
      source_disk_id:
        Google::Compute::Property::String.api_munge(fetch['sourceDiskId']),
      source_type:
        Google::Compute::Property::Enum.api_munge(fetch['sourceType'])
    }.reject { |_, v| v.nil? }
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  def exists?
    debug("exists? #{@property_hash[:ensure] == :present}")
    @property_hash[:ensure] == :present
  end

  def create
    debug('create')
    @created = true
    # Family is a virtual resource. If we reached the create method it means
    # ensure => present was specified yet the family is not found
    unless @resource[:family].nil?
      raise ["Family '#{@resource[:family]}' does not exist ",
             "on '#{@resource[:project]}'"].join
    create_req = Google::Compute::Network::Post.new(collection(@resource),
                                                    fetch_auth(@resource),
                                                    'application/json',
                                                    resource_to_request)
    wait_for_operation create_req.send, @resource
    @property_hash[:ensure] = :present
  end

  def destroy
    debug('destroy')
    @deleted = true
    delete_req = Google::Compute::Network::Delete.new(self_link(@resource),
                                                      fetch_auth(@resource))
    wait_for_operation delete_req.send, @resource
    @property_hash[:ensure] = :absent
  end

  def flush
    debug('flush')
    # return on !@dirty is for aiding testing (puppet already guarantees that)
    return if @created || @deleted || !@dirty
    update_req = Google::Compute::Network::Put.new(self_link(@resource),
                                                   fetch_auth(@resource),
                                                   'application/json',
                                                   resource_to_request)
    wait_for_operation update_req.send, @resource
  end

  def dirty(field, from, to)
    @dirty = {} if @dirty.nil?
    @dirty[field] = {
      from: from,
      to: to
    }
  end

  private

  # rubocop:disable Metrics/MethodLength
  def self.resource_to_hash(resource)
    {
      project: resource[:project],
      name: resource[:name],
      kind: 'compute#image',
      archive_size_bytes: resource[:archive_size_bytes],
      creation_timestamp: resource[:creation_timestamp],
      deprecated: resource[:deprecated],
      description: resource[:description],
      disk_size_gb: resource[:disk_size_gb],
      family: resource[:family],
      guest_os_features: resource[:guest_os_features],
      id: resource[:id],
      image_encryption_key: resource[:image_encryption_key],
      licenses: resource[:licenses],
      raw_disk: resource[:raw_disk],
      source_disk: resource[:source_disk],
      source_disk_encryption_key: resource[:source_disk_encryption_key],
      source_disk_id: resource[:source_disk_id],
      source_type: resource[:source_type]
    }.reject { |_, v| v.nil? }
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  def resource_to_request
    request = {
      kind: 'compute#image',
      description: @resource[:description],
      diskSizeGb: @resource[:disk_size_gb],
      family: @resource[:family],
      guestOsFeatures: @resource[:guest_os_features],
      imageEncryptionKey: @resource[:image_encryption_key],
      licenses: @resource[:licenses],
      name: @resource[:name],
      rawDisk: @resource[:raw_disk],
      sourceDisk: @resource[:source_disk],
      sourceDiskEncryptionKey: @resource[:source_disk_encryption_key],
      sourceDiskId: @resource[:source_disk_id],
      sourceType: @resource[:source_type]
    }.reject { |_, v| v.nil? }
    debug "request: #{request}" unless ENV['PUPPET_HTTP_DEBUG'].nil?
    request.to_json
  end
  # rubocop:enable Metrics/MethodLength

  def fetch_auth(resource)
    self.class.fetch_auth(resource)
  end

  def self.fetch_auth(resource)
    Puppet::Type.type(:gauth_credential).fetch(resource)
  end

  def debug(message)
    puts("DEBUG: #{message}") if ENV['PUPPET_HTTP_VERBOSE']
    super(message)
  end

  def self.collection(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/global/images',
        data
      )
    )
  end

  def collection(data)
    self.class.collection(data)
  end

  def self.self_link(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/global/images/{{name}}',
        data
      )
    )
  end

  def self_link(data)
    self.class.self_link(data)
  end

  def get_from_family(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/global/images/family/{{name}}',
        data
      )
    )
  end

  def self.return_if_object(response, kind)
    raise "Bad response: #{response}" \
      unless response.is_a?(Net::HTTPResponse)
    return if response.is_a?(Net::HTTPNotFound)
    return if response.is_a?(Net::HTTPNoContent)
    result = JSON.parse(response.body)
    raise_if_errors result, %w[error errors], 'message'
    raise "Bad response: #{response}" unless response.is_a?(Net::HTTPOK)
    raise "Incorrect result: #{result['kind']} (expected '#{kind}')" \
      unless result['kind'] == kind
    result
  end

  def return_if_object(response, kind)
    self.class.return_if_object(response, kind)
  end

  def self.extract_variables(template)
    template.scan(/{{[^}]*}}/).map { |v| v.gsub(/{{([^}]*)}}/, '\1') }
            .map(&:to_sym)
  end

  def self.expand_variables(template, var_data, extra_data = {})
    data = if var_data.class <= Hash
             var_data.merge(extra_data)
           else
             resource_to_hash(var_data).merge(extra_data)
           end
    extract_variables(template).each do |v|
      unless data.key?(v)
        raise "Missing variable :#{v} in #{data} on #{caller.join("\n")}}"
      end
      template.gsub!(/{{#{v}}}/, CGI.escape(data[v].to_s))
    end
    template
  end

  def expand_variables(template, var_data, extra_data = {})
    self.class.expand_variables(template, var_data, extra_data)
  end

  def fetch_resource(resource, self_link, kind)
    self.class.fetch_resource(resource, self_link, kind)
  end

  def async_op_url(data, extra_data = {})
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/global/operations/{{op_id}}',
        data, extra_data
      )
    )
  end

  def wait_for_operation(response, resource)
    op_result = return_if_object(response, 'compute#operation')
    return if op_result.nil?
    status = ::Google::HashUtils.navigate(op_result, %w[status])
    fetch_resource(
      resource,
      URI.parse(::Google::HashUtils.navigate(wait_for_completion(status,
                                                                 op_result,
                                                                 resource),
                                             %w[targetLink])),
      'compute#image'
    )
  end

  def wait_for_completion(status, op_result, resource)
    op_id = ::Google::HashUtils.navigate(op_result, %w[name])
    op_uri = async_op_url(resource, op_id: op_id)
    while status != 'DONE'
      debug("Waiting for completion of operation #{op_id}")
      raise_if_errors op_result, %w[error errors], 'message'
      sleep 1.0
      raise "Invalid result '#{status}' on gcompute_image." \
        unless %w[PENDING RUNNING DONE].include?(status)
      op_result = fetch_resource(resource, op_uri, 'compute#operation')
      status = ::Google::HashUtils.navigate(op_result, %w[status])
    end
    op_result
  end

  def raise_if_errors(response, err_path, msg_field)
    self.class.raise_if_errors(response, err_path, msg_field)
  end

  def self.fetch_resource(resource, self_link, kind)
    get_request = ::Google::Compute::Network::Get.new(
      self_link, fetch_auth(resource)
    )
    return_if_object get_request.send, kind
  end

  def self.raise_if_errors(response, err_path, msg_field)
    errors = ::Google::HashUtils.navigate(response, err_path)
    raise_error(errors, msg_field) unless errors.nil?
  end

  def self.raise_error(errors, msg_field)
    raise IOError, ['Operation failed:',
                    errors.map { |e| e[msg_field] }.join(', ')].join(' ')
  end
end

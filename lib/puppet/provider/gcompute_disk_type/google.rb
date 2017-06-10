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
# ----------------------------------------------------------------------------

require 'google/compute/property/enum'
require 'google/compute/property/integer'
require 'google/compute/property/string'
require 'google/compute/property/time'
require 'google/hash_utils'
require 'google/request/delete'
require 'google/request/get'
require 'google/request/post'
require 'google/request/put'
require 'puppet'

Puppet::Type.type(:gcompute_disk_type).provide(:google) do
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
      fetch = fetch_resource(resource, self_link(resource),
                             'compute#diskType')
      resource.provider = present(name, fetch) unless fetch.nil?
    end
  end

  def self.present(name, fetch)
    result = new({ title: name, ensure: :present }.merge(fetch_to_hash(fetch)))
    result.instance_variable_set(:@fetched, fetch)
    result
  end

  # rubocop:disable Metrics/MethodLength
  def self.fetch_to_hash(fetch)
    {
      creation_timestamp:
        Google::Compute::Property::Time.parse(fetch['creationTimestamp']),
      default_disk_size_gb:
        Google::Compute::Property::Integer.parse(fetch['defaultDiskSizeGb']),
      deprecated_deleted: Google::Compute::Property::Time.parse(
        Google::HashUtils.navigate(fetch, %w[deprecated deleted])
      ),
      deprecated_deprecated: Google::Compute::Property::Time.parse(
        Google::HashUtils.navigate(fetch, %w[deprecated deprecated])
      ),
      deprecated_obsolete: Google::Compute::Property::Time.parse(
        Google::HashUtils.navigate(fetch, %w[deprecated obsolete])
      ),
      deprecated_replacement: Google::Compute::Property::String.parse(
        Google::HashUtils.navigate(fetch, %w[deprecated replacement])
      ),
      deprecated_state: Google::Compute::Property::Enum.parse(
        Google::HashUtils.navigate(fetch, %w[deprecated state])
      ),
      description:
        Google::Compute::Property::String.parse(fetch['description']),
      id: Google::Compute::Property::Integer.parse(fetch['id']),
      name: Google::Compute::Property::String.parse(fetch['name']),
      valid_disk_size:
        Google::Compute::Property::String.parse(fetch['validDiskSize'])
    }.reject { |_, v| v.nil? }
  end
  # rubocop:enable Metrics/MethodLength

  def flush
    debug('flush')
    # return on !@dirty is for aiding testing (puppet already guarantees that)
    return if @created || @deleted || !@dirty
    raise [
      'DiskType requirements specified in the manifest do not match',
      "values provided by Google Cloud Platform: #{dirty_display_formatted}"
    ].join(' ')
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
      kind: 'compute#diskType',
      creation_timestamp: resource[:creation_timestamp],
      default_disk_size_gb: resource[:default_disk_size_gb],
      deprecated_deleted: resource[:deprecated_deleted],
      deprecated_deprecated: resource[:deprecated_deprecated],
      deprecated_obsolete: resource[:deprecated_obsolete],
      deprecated_replacement: resource[:deprecated_replacement],
      deprecated_state: resource[:deprecated_state],
      description: resource[:description],
      id: resource[:id],
      valid_disk_size: resource[:valid_disk_size],
      zone: resource[:zone]
    }.reject { |_, v| v.nil? }
  end
  # rubocop:enable Metrics/MethodLength

  def resource_to_request
    request = {
      kind: 'compute#diskType'
    }.reject { |_, v| v.nil? }
    debug "request: #{request}" unless ENV['PUPPET_HTTP_DEBUG'].nil?
    request.to_json
  end

  def fetch_auth(resource)
    self.class.fetch_auth(resource)
  end

  def self.fetch_auth(resource)
    Puppet::Type.type(:gauth_credential).fetch(resource)
  end

  def debug(message)
    puts("DEBUG: #{message}") if ENV['DEBUG_HTTP_VERBOSE']
    super(message)
  end

  def self.collection(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/zones/{{zone}}/diskTypes',
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
        'projects/{{project}}/zones/{{zone}}/diskTypes/{{name}}',
        data
      )
    )
  end

  def self_link(data)
    self.class.self_link(data)
  end

  def self.return_if_object(response, kind)
    raise "Bad response: #{response}" \
      unless response.is_a?(Net::HTTPResponse)
    return if response.is_a?(Net::HTTPNotFound)
    return if response.is_a?(Net::HTTPNoContent)
    result = JSON.parse(response.body)
    raise_if_errors result, %w[error errors], 'message'
    raise "Bad response: #{response}" unless response.is_a?(Net::HTTPOK)
    raise "Incorrect result: #{result['kind']} (expecting #{kind})" \
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

  def dirty_display_formatted
    @dirty.map do |name, change|
      ["#{name.id2name} expected #{change[:to]},",
       "but platform reports #{change[:from]}"].join(' ')
    end.join('. Also ')
  end

  def self.fetch_resource(resource, self_link, kind)
    get_request = ::Google::Request::Get.new(self_link,
                                             fetch_auth(resource))
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

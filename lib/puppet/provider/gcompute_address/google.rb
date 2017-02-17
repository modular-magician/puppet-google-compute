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

require 'google/hash_utils'
require 'net/http'
require 'puppet'

Puppet::Type.type(:gcompute_address).provide(:google) do
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
      fetch = prefetch_one_resource resource
      resource.provider = if fetch.nil?
                            new(title: name, ensure: :absent)
                          else
                            present(name, fetch)
                          end
    end
  end

  def self.present(name, fetch)
    result = new(
      title: name,
      ensure: :present,
      address: Google::Property::String.parse(fetch['address']),
      creation_timestamp:
        Google::Property::Time.parse(fetch['creationTimestamp']),
      description: Google::Property::String.parse(fetch['description']),
      id: Google::Property::Integer.parse(fetch['id']),
      name: Google::Property::String.parse(fetch['name']),
      users: Google::Property::Array.parse(fetch['users'])
    )
    result.instance_variable_set(:@fetched, fetch)
    result
  end

  def exists?
    debug("exists? #{@property_hash[:ensure] == :present}")
    @property_hash[:ensure] == :present
  end

  def create
    debug('create')
    @created = true
    cred = Puppet::Type.type(:gauth_credential).fetch(@resource)
    create_req = cred.authorize(
      Net::HTTP::Post.new(collection(@resource))
    )
    create_req.content_type = 'application/json'
    create_req.body = resource_to_request
    wait_for_operation transport(create_req).request(create_req)
  end

  def delete
    debug('delete')
    @deleted = true
    cred = Puppet::Type.type(:gauth_credential).fetch(@resource)
    delete_req = cred.authorize(
      Net::HTTP::Delete.new(self_link(@resource))
    )
    wait_for_operation transport(delete_req).request(delete_req)
  end

  def flush
    debug('flush')
    # return on !@dirty is for aiding testing (puppet already guarantees that)
    return if @created || @deleted || !@dirty
    raise 'Saving not implemented yet.'
  end

  def dirty(field, from, to)
    @dirty = {} if @dirty.nil?
    @dirty[field] = {
      from: from,
      to: to
    }
  end

  private

  def self.resource_to_hash(resource)
    {
      project: resource[:project],
      name: resource[:name],
      kind: 'compute#address',
      address: resource[:address],
      creation_timestamp: resource[:creation_timestamp],
      description: resource[:description],
      id: resource[:id],
      users: resource[:users],
      region: resource[:region]
    }.select { |_, v| !v.nil? }
  end

  def self.extract_variables(template)
    template.scan(/{{[^}]*}}/).map { |v| v.gsub(/{{([^}]*)}}/, '\1') }
            .map(&:to_sym)
  end

  def self.expand_variables(template, var_data, extra_data = {})
    data = resource_to_hash(var_data).merge(extra_data)
    extract_variables(template).each do |v|
      unless data.key?(v)
        raise "Missing variable :#{v} in #{data} on #{caller.join("\n")}}"
      end
      template.gsub!(/{{#{v}}}/, CGI.escape(data[v].to_s))
    end
    template
  end

  def self.collection(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/regions/{{region}}/addresses',
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
        'projects/{{project}}/regions/{{region}}/addresses/{{name}}',
        data
      )
    )
  end

  def self_link(data)
    self.class.self_link(data)
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
        'projects/{{project}}/regions/{{region}}/operations/{{op_id}}',
        data, extra_data
      )
    )
  end

  def resource_to_request
    request = Google::HashUtils.camelize_keys(
      kind: 'compute#address',
      address: @resource[:address],
      description: @resource[:description],
      name: @resource[:name]
    ).select { |_, v| !v.nil? }.to_json
    debug "request: #{request}" unless ENV['PUPPET_HTTP_DEBUG'].nil?
    request
  end

  def wait_for_operation(response)
    op_result = return_if_object(response, 'compute#operation')
    status = Google::HashUtils.navigate(op_result, %w(status))
    fetch_resource(
      @resource,
      URI.parse(Google::HashUtils.navigate(wait_for_completion(status,
                                                               op_result),
                                           %w(targetLink))),
      'compute#address'
    )
  end

  def wait_for_completion(status, op_result)
    op_id = Google::HashUtils.navigate(op_result, %w(name))
    op_uri = async_op_url(@resource, op_id: op_id)
    while status != 'DONE'
      debug("Waiting for completion of operation #{op_id}")
      raise_if_errors op_result, %w(error errors), 'message'
      sleep 1.0
      raise "Invalid result '#{status}' on gcompute_address." \
        unless %w(PENDING RUNNING DONE).include?(status)
      op_result = fetch_resource(@resource, op_uri, 'compute#operation')
      status = Google::HashUtils.navigate(op_result, %w(status))
    end
    op_result
  end

  def self.return_if_object(response, kind)
    raise "Bad response: #{response}" unless response.is_a?(Net::HTTPResponse)
    return if response.is_a?(Net::HTTPNotFound)
    return if response.is_a?(Net::HTTPNoContent)
    result = JSON.parse(response.body)
    raise_if_errors result, %w(error errors), 'message'
    raise "Bad response: #{response}" unless response.is_a?(Net::HTTPOK)
    raise "Incorrect result: #{result['kind']} (expecting #{kind})" \
      unless result['kind'] == kind
    result
  end

  def return_if_object(response, kind)
    self.class.return_if_object(response, kind)
  end

  def self.raise_if_errors(response, err_path, msg_field)
    errors = Google::HashUtils.navigate(response, err_path)
    raise "Operation failed: #{errors.map { |e| e[msg_field] }.join(', ')}" \
      unless errors.nil?
  end

  def raise_if_errors(response, err_path, msg_field)
    self.class.raise_if_errors(response, err_path, msg_field)
  end

  def self.transport(request)
    uri = request.uri
    puts "network(#{request}: #{uri})" unless ENV['PUPPET_HTTP_VERBOSE'].nil?
    transport = Net::HTTP.new(uri.host, uri.port)
    transport.use_ssl = uri.is_a?(URI::HTTPS)
    transport.verify_mode = OpenSSL::SSL::VERIFY_PEER
    transport.set_debug_output $stderr unless ENV['PUPPET_HTTP_DEBUG'].nil?
    transport
  end

  def transport(request)
    self.class.transport(request)
  end

  def self.prefetch_one_resource(resource)
    fetch_resource resource, self_link(resource), 'compute#address'
  end

  def self.fetch_resource(resource, self_link, kind)
    cred = Puppet::Type.type(:gauth_credential).fetch(resource)
    get_request = cred.authorize(
      Net::HTTP::Get.new(self_link)
    )
    return_if_object transport(get_request).request(get_request), kind
  end
end

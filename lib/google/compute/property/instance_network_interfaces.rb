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

require 'google/compute/property/array'
require 'google/compute/property/base'

module Google
  module Compute
    module Data
      # A class to manage data for NetworkInterfaces for instance.
      class InstanceNetworkinterfaces
        include Comparable

        attr_reader :access_configs
        attr_reader :alias_ip_ranges
        attr_reader :name
        attr_reader :network
        attr_reader :network_ip
        attr_reader :subnetwork

        def to_json(_arg = nil)
          {
            'accessConfigs' => access_configs,
            'aliasIpRanges' => alias_ip_ranges,
            'name' => name,
            'network' => network,
            'networkIP' => network_ip,
            'subnetwork' => subnetwork
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            access_configs: ['[',
                             (access_configs || []).map(&:to_json).join(', '),
                             ']'].join(' '),
            alias_ip_ranges: ['[',
                              (alias_ip_ranges || []).map(&:to_json).join(', '),
                              ']'].join(' '),
            name: name,
            network: network,
            network_ip: network_ip,
            subnetwork: subnetwork
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstanceNetworkinterfaces
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstanceNetworkinterfaces
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        private

        def compare_fields(other)
          [
            { self: access_configs, other: other.access_configs },
            { self: alias_ip_ranges, other: other.alias_ip_ranges },
            { self: name, other: other.name },
            { self: network, other: other.network },
            { self: network_ip, other: other.network_ip },
            { self: subnetwork, other: other.subnetwork }
          ]
        end
      end

      # Manages a InstanceNetworkinterfaces nested object
      # Data is coming from the GCP API
      class InstanceNetworkinterfacesApi < InstanceNetworkinterfaces
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @access_configs =
            Google::Compute::Property::InstanceAccessconfigsArray.api_munge(args['accessConfigs'])
          @alias_ip_ranges =
            Google::Compute::Property::InstanceAliasiprangesArray.api_munge(args['aliasIpRanges'])
          @name = Google::Compute::Property::String.api_munge(args['name'])
          @network = Google::Compute::Property::NetworkSelflinkRef.api_munge(args['network'])
          @network_ip = Google::Compute::Property::String.api_munge(args['networkIP'])
          @subnetwork =
            Google::Compute::Property::SubnetworkSelflinkRef.api_munge(args['subnetwork'])
        end
        # rubocop:enable Metrics/MethodLength
      end

      # Manages a InstanceNetworkinterfaces nested object
      # Data is coming from the Puppet manifest
      class InstanceNetworkinterfacesCatalog < InstanceNetworkinterfaces
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @access_configs = Google::Compute::Property::InstanceAccessconfigsArray.unsafe_munge(
            args['access_configs']
          )
          @alias_ip_ranges = Google::Compute::Property::InstanceAliasiprangesArray.unsafe_munge(
            args['alias_ip_ranges']
          )
          @name = Google::Compute::Property::String.unsafe_munge(args['name'])
          @network = Google::Compute::Property::NetworkSelflinkRef.unsafe_munge(args['network'])
          @network_ip = Google::Compute::Property::String.unsafe_munge(args['network_ip'])
          @subnetwork =
            Google::Compute::Property::SubnetworkSelflinkRef.unsafe_munge(args['subnetwork'])
        end
        # rubocop:enable Metrics/MethodLength
      end
    end

    module Property
      # A class to manage input to NetworkInterfaces for instance.
      class InstanceNetworkinterfaces < Google::Compute::Property::Base
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::InstanceNetworkinterfacesCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::InstanceNetworkinterfacesApi.new(value)
        end
      end

      # A Puppet property that holds an integer
      class InstanceNetworkinterfacesArray < Google::Compute::Property::Array
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          return InstanceNetworkinterfaces.unsafe_munge(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstanceNetworkinterfaces.unsafe_munge(v) }
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          return InstanceNetworkinterfaces.api_munge(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstanceNetworkinterfaces.api_munge(v) }
        end
      end
    end
  end
end

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

require 'google/compute/property/array'
require 'puppet/property'

module Google
  module Compute
    module Data
      # A class to manage data for allowed for firewall.
      class FirewallAllowed
        include Comparable

        attr_reader :ip_protocol
        attr_reader :ports

        def to_json(_arg = nil)
          {
            'IPProtocol' => ip_protocol,
            'ports' => ports
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            ip_protocol: ip_protocol,
            ports: ports
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? FirewallAllowed
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? FirewallAllowed
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
            { self: ip_protocol, other: other.ip_protocol },
            { self: ports, other: other.ports }
          ]
        end
      end

      # Manages a FirewallAllowed nested object
      # Data is coming from the GCP API
      class FirewallAllowedApi < FirewallAllowed
        def initialize(args)
          @ip_protocol =
            Google::Compute::Property::String.api_munge(args['IPProtocol'])
          @ports =
            Google::Compute::Property::StringArray.api_munge(args['ports'])
        end
      end

      # Manages a FirewallAllowed nested object
      # Data is coming from the Puppet manifest
      class FirewallAllowedCatalog < FirewallAllowed
        def initialize(args)
          @ip_protocol =
            Google::Compute::Property::String.unsafe_munge(args['ip_protocol'])
          @ports =
            Google::Compute::Property::StringArray.unsafe_munge(args['ports'])
        end
      end
    end

    module Property
      # A class to manage input to allowed for firewall.
      class FirewallAllowed < Puppet::Property
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::FirewallAllowedCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::FirewallAllowedApi.new(value)
        end
      end

      # A Puppet property that holds an integer
      class FirewallAllowedArray < Google::Compute::Property::Array
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          return FirewallAllowed.unsafe_munge(value) \
            unless value.is_a?(::Array)
          value.map { |v| FirewallAllowed.unsafe_munge(v) }
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          return FirewallAllowed.api_munge(value) \
            unless value.is_a?(::Array)
          value.map { |v| FirewallAllowed.api_munge(v) }
        end
      end
    end
  end
end

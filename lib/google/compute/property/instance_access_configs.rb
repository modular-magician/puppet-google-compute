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

require 'google/compute/property/array'
require 'puppet/property'

module Google
  module Compute
    module Data
      # A class to manage data for access_configs for instance.
      class InstancAccessConfigs
        include Comparable

        attr_reader :name
        attr_reader :nat_ip
        attr_reader :type

        def to_json(_arg = nil)
          {
            'name' => name,
            'natIP' => nat_ip,
            'type' => type
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            name: name,
            nat_ip: nat_ip,
            type: type
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstancAccessConfigs
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstancAccessConfigs
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
            { self: name, other: other.name },
            { self: nat_ip, other: other.nat_ip },
            { self: type, other: other.type }
          ]
        end
      end

      # Manages a InstancAccessConfigs nested object
      # Data is coming from the GCP API
      class InstancAccessConfigsApi < InstancAccessConfigs
        def initialize(args)
          @name = Google::Compute::Property::String.api_munge(args['name'])
          @nat_ip = Google::Compute::Property::AddressAddressRef.api_munge(
            args['natIP']
          )
          @type = Google::Compute::Property::Enum.api_munge(args['type'])
        end
      end

      # Manages a InstancAccessConfigs nested object
      # Data is coming from the Puppet manifest
      class InstancAccessConfigsCatalog < InstancAccessConfigs
        def initialize(args)
          @name = Google::Compute::Property::String.unsafe_munge(args['name'])
          @nat_ip = Google::Compute::Property::AddressAddressRef.unsafe_munge(
            args['nat_ip']
          )
          @type = Google::Compute::Property::Enum.unsafe_munge(args['type'])
        end
      end
    end

    module Property
      # A class to manage input to access_configs for instance.
      class InstancAccessConfigs < Puppet::Property
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::InstancAccessConfigsCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::InstancAccessConfigsApi.new(value)
        end
      end

      # A Puppet property that holds an integer
      class InstancAccessConfigsArray < Google::Compute::Property::Array
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          return InstancAccessConfigs.unsafe_munge(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstancAccessConfigs.unsafe_munge(v) }
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          return InstancAccessConfigs.api_munge(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstancAccessConfigs.api_munge(v) }
        end
      end
    end
  end
end
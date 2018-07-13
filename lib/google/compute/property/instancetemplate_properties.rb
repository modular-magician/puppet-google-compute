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

require 'google/compute/property/base'

module Google
  module Compute
    module Data
      # A class to manage data for Properties for instance_template.
      class InstancTemplatPropert
        include Comparable

        attr_reader :can_ip_forward
        attr_reader :description
        attr_reader :disks
        attr_reader :machine_type
        attr_reader :metadata
        attr_reader :guest_accelerators
        attr_reader :network_interfaces
        attr_reader :scheduling
        attr_reader :service_accounts
        attr_reader :tags

        def to_json(_arg = nil)
          {
            'canIpForward' => can_ip_forward,
            'description' => description,
            'disks' => disks,
            'machineType' => machine_type,
            'metadata' => metadata,
            'guestAccelerators' => guest_accelerators,
            'networkInterfaces' => network_interfaces,
            'scheduling' => scheduling,
            'serviceAccounts' => service_accounts,
            'tags' => tags
          }.reject { |_k, v| v.nil? }.to_json
        end

        # rubocop:disable Metrics/MethodLength
        def to_s
          {
            can_ip_forward: can_ip_forward,
            description: description,
            disks: ['[',
                    (disks || []).map(&:to_json).join(', '),
                    ']'].join(' '),
            machine_type: machine_type,
            metadata: metadata,
            guest_accelerators: ['[',
                                 (guest_accelerators || []).map(&:to_json).join(', '),
                                 ']'].join(' '),
            network_interfaces: ['[',
                                 (network_interfaces || []).map(&:to_json).join(', '),
                                 ']'].join(' '),
            scheduling: scheduling,
            service_accounts: ['[',
                               (service_accounts || []).map(&:to_json).join(', '),
                               ']'].join(' '),
            tags: tags
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end
        # rubocop:enable Metrics/MethodLength

        def ==(other)
          return false unless other.is_a? InstancTemplatPropert
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstancTemplatPropert
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
            { self: can_ip_forward, other: other.can_ip_forward },
            { self: description, other: other.description },
            { self: disks, other: other.disks },
            { self: machine_type, other: other.machine_type },
            { self: metadata, other: other.metadata },
            { self: guest_accelerators, other: other.guest_accelerators },
            { self: network_interfaces, other: other.network_interfaces },
            { self: scheduling, other: other.scheduling },
            { self: service_accounts, other: other.service_accounts },
            { self: tags, other: other.tags }
          ]
        end
      end

      # Manages a InstancTemplatPropert nested object
      # Data is coming from the GCP API
      class InstancTemplatPropertApi < InstancTemplatPropert
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @can_ip_forward = Google::Compute::Property::Boolean.api_munge(args['canIpForward'])
          @description = Google::Compute::Property::String.api_munge(args['description'])
          @disks = Google::Compute::Property::InstancTemplatDisksArray.api_munge(args['disks'])
          @machine_type = Google::Compute::Property::MachiTypeNameRef.api_munge(args['machineType'])
          @metadata = Google::Compute::Property::NameValues.api_munge(args['metadata'])
          @guest_accelerators = Google::Compute::Property::InstaTemplGuestAccelArray.api_munge(
            args['guestAccelerators']
          )
          @network_interfaces = Google::Compute::Property::InstaTemplNetwoInterArray.api_munge(
            args['networkInterfaces']
          )
          @scheduling =
            Google::Compute::Property::InstancTemplatSchedul.api_munge(args['scheduling'])
          @service_accounts =
            Google::Compute::Property::InstaTemplServiAccouArray.api_munge(args['serviceAccounts'])
          @tags = Google::Compute::Property::InstancTemplatTags.api_munge(args['tags'])
        end
        # rubocop:enable Metrics/MethodLength
      end

      # Manages a InstancTemplatPropert nested object
      # Data is coming from the Puppet manifest
      class InstancTemplatPropertCatalog < InstancTemplatPropert
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @can_ip_forward = Google::Compute::Property::Boolean.unsafe_munge(args['can_ip_forward'])
          @description = Google::Compute::Property::String.unsafe_munge(args['description'])
          @disks = Google::Compute::Property::InstancTemplatDisksArray.unsafe_munge(args['disks'])
          @machine_type =
            Google::Compute::Property::MachiTypeNameRef.unsafe_munge(args['machine_type'])
          @metadata = Google::Compute::Property::NameValues.unsafe_munge(args['metadata'])
          @guest_accelerators = Google::Compute::Property::InstaTemplGuestAccelArray.unsafe_munge(
            args['guest_accelerators']
          )
          @network_interfaces = Google::Compute::Property::InstaTemplNetwoInterArray.unsafe_munge(
            args['network_interfaces']
          )
          @scheduling =
            Google::Compute::Property::InstancTemplatSchedul.unsafe_munge(args['scheduling'])
          @service_accounts = Google::Compute::Property::InstaTemplServiAccouArray.unsafe_munge(
            args['service_accounts']
          )
          @tags = Google::Compute::Property::InstancTemplatTags.unsafe_munge(args['tags'])
        end
        # rubocop:enable Metrics/MethodLength
      end
    end

    module Property
      # A class to manage input to Properties for instance_template.
      class InstancTemplatPropert < Google::Compute::Property::Base
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::InstancTemplatPropertCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::InstancTemplatPropertApi.new(value)
        end
      end
    end
  end
end

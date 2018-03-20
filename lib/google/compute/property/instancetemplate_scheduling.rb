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

require 'puppet/property'

module Google
  module Compute
    module Data
      # A class to manage data for scheduling for instance_template.
      class InstancTemplatSchedul
        include Comparable

        attr_reader :automatic_restart
        attr_reader :on_host_maintenance
        attr_reader :preemptible

        def to_json(_arg = nil)
          {
            'automaticRestart' => automatic_restart,
            'onHostMaintenance' => on_host_maintenance,
            'preemptible' => preemptible
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            automatic_restart: automatic_restart,
            on_host_maintenance: on_host_maintenance,
            preemptible: preemptible
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstancTemplatSchedul
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstancTemplatSchedul
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
            { self: automatic_restart, other: other.automatic_restart },
            { self: on_host_maintenance, other: other.on_host_maintenance },
            { self: preemptible, other: other.preemptible }
          ]
        end
      end

      # Manages a InstancTemplatSchedul nested object
      # Data is coming from the GCP API
      class InstancTemplatSchedulApi < InstancTemplatSchedul
        def initialize(args)
          @automatic_restart = Google::Compute::Property::Boolean.api_munge(
            args['automaticRestart']
          )
          @on_host_maintenance = Google::Compute::Property::String.api_munge(
            args['onHostMaintenance']
          )
          @preemptible =
            Google::Compute::Property::Boolean.api_munge(args['preemptible'])
        end
      end

      # Manages a InstancTemplatSchedul nested object
      # Data is coming from the Puppet manifest
      class InstancTemplatSchedulCatalog < InstancTemplatSchedul
        def initialize(args)
          @automatic_restart = Google::Compute::Property::Boolean.unsafe_munge(
            args['automatic_restart']
          )
          @on_host_maintenance = Google::Compute::Property::String.unsafe_munge(
            args['on_host_maintenance']
          )
          @preemptible =
            Google::Compute::Property::Boolean.unsafe_munge(args['preemptible'])
        end
      end
    end

    module Property
      # A class to manage input to scheduling for instance_template.
      class InstancTemplatSchedul < Puppet::Property
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::InstancTemplatSchedulCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::InstancTemplatSchedulApi.new(value)
        end
      end
    end
  end
end

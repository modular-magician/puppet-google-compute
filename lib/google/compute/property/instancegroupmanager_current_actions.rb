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
      # A class to manage data for current_actions for instance_group_manager.
      class InstGrouManaCurrActi
        include Comparable

        attr_reader :abandoning
        attr_reader :creating
        attr_reader :creating_without_retries
        attr_reader :deleting
        attr_reader :none
        attr_reader :recreating
        attr_reader :refreshing
        attr_reader :restarting

        def to_json(_arg = nil)
          {
            'abandoning' => abandoning,
            'creating' => creating,
            'creatingWithoutRetries' => creating_without_retries,
            'deleting' => deleting,
            'none' => none,
            'recreating' => recreating,
            'refreshing' => refreshing,
            'restarting' => restarting
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            abandoning: abandoning,
            creating: creating,
            creating_without_retries: creating_without_retries,
            deleting: deleting,
            none: none,
            recreating: recreating,
            refreshing: refreshing,
            restarting: restarting
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstGrouManaCurrActi
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstGrouManaCurrActi
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
            { self: abandoning, other: other.abandoning },
            { self: creating, other: other.creating },
            {
              self: creating_without_retries,
              other: other.creating_without_retries
            },
            { self: deleting, other: other.deleting },
            { self: none, other: other.none },
            { self: recreating, other: other.recreating },
            { self: refreshing, other: other.refreshing },
            { self: restarting, other: other.restarting }
          ]
        end
      end

      # Manages a InstGrouManaCurrActi nested object
      # Data is coming from the GCP API
      class InstGrouManaCurrActiApi < InstGrouManaCurrActi
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @abandoning =
            Google::Compute::Property::Integer.api_munge(args['abandoning'])
          @creating =
            Google::Compute::Property::Integer.api_munge(args['creating'])
          @creating_without_retries =
            Google::Compute::Property::Integer.api_munge(
              args['creatingWithoutRetries']
            )
          @deleting =
            Google::Compute::Property::Integer.api_munge(args['deleting'])
          @none = Google::Compute::Property::Integer.api_munge(args['none'])
          @recreating =
            Google::Compute::Property::Integer.api_munge(args['recreating'])
          @refreshing =
            Google::Compute::Property::Integer.api_munge(args['refreshing'])
          @restarting =
            Google::Compute::Property::Integer.api_munge(args['restarting'])
        end
        # rubocop:enable Metrics/MethodLength
      end

      # Manages a InstGrouManaCurrActi nested object
      # Data is coming from the Puppet manifest
      class InstGrouManaCurrActiCatalog < InstGrouManaCurrActi
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @abandoning =
            Google::Compute::Property::Integer.unsafe_munge(args['abandoning'])
          @creating =
            Google::Compute::Property::Integer.unsafe_munge(args['creating'])
          @creating_without_retries =
            Google::Compute::Property::Integer.unsafe_munge(
              args['creating_without_retries']
            )
          @deleting =
            Google::Compute::Property::Integer.unsafe_munge(args['deleting'])
          @none = Google::Compute::Property::Integer.unsafe_munge(args['none'])
          @recreating =
            Google::Compute::Property::Integer.unsafe_munge(args['recreating'])
          @refreshing =
            Google::Compute::Property::Integer.unsafe_munge(args['refreshing'])
          @restarting =
            Google::Compute::Property::Integer.unsafe_munge(args['restarting'])
        end
        # rubocop:enable Metrics/MethodLength
      end
    end

    module Property
      # A class to manage input to current_actions for instance_group_manager.
      class InstGrouManaCurrActi < Google::Compute::Property::Base
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::InstGrouManaCurrActiCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::InstGrouManaCurrActiApi.new(value)
        end
      end
    end
  end
end

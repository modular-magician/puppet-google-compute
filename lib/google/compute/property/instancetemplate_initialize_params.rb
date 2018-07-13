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
      # A class to manage data for InitializeParams for instance_template.
      class InstaTemplInitiParam
        include Comparable

        attr_reader :disk_name
        attr_reader :disk_size_gb
        attr_reader :disk_type
        attr_reader :source_image
        attr_reader :source_image_encryption_key

        def to_json(_arg = nil)
          {
            'diskName' => disk_name,
            'diskSizeGb' => disk_size_gb,
            'diskType' => disk_type,
            'sourceImage' => source_image,
            'sourceImageEncryptionKey' => source_image_encryption_key
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            disk_name: disk_name,
            disk_size_gb: disk_size_gb,
            disk_type: disk_type,
            source_image: source_image,
            source_image_encryption_key: source_image_encryption_key
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstaTemplInitiParam
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstaTemplInitiParam
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
            { self: disk_name, other: other.disk_name },
            { self: disk_size_gb, other: other.disk_size_gb },
            { self: disk_type, other: other.disk_type },
            { self: source_image, other: other.source_image },
            { self: source_image_encryption_key, other: other.source_image_encryption_key }
          ]
        end
      end

      # Manages a InstaTemplInitiParam nested object
      # Data is coming from the GCP API
      class InstaTemplInitiParamApi < InstaTemplInitiParam
        def initialize(args)
          @disk_name = Google::Compute::Property::String.api_munge(args['diskName'])
          @disk_size_gb = Google::Compute::Property::Integer.api_munge(args['diskSizeGb'])
          @disk_type = Google::Compute::Property::DiskTypeSelfLinkRef.api_munge(args['diskType'])
          @source_image = Google::Compute::Property::String.api_munge(args['sourceImage'])
          @source_image_encryption_key = Google::Compute::Property::InsTemSouImaEncKey.api_munge(
            args['sourceImageEncryptionKey']
          )
        end
      end

      # Manages a InstaTemplInitiParam nested object
      # Data is coming from the Puppet manifest
      class InstaTemplInitiParamCatalog < InstaTemplInitiParam
        def initialize(args)
          @disk_name = Google::Compute::Property::String.unsafe_munge(args['disk_name'])
          @disk_size_gb = Google::Compute::Property::Integer.unsafe_munge(args['disk_size_gb'])
          @disk_type =
            Google::Compute::Property::DiskTypeSelfLinkRef.unsafe_munge(args['disk_type'])
          @source_image = Google::Compute::Property::String.unsafe_munge(args['source_image'])
          @source_image_encryption_key = Google::Compute::Property::InsTemSouImaEncKey.unsafe_munge(
            args['source_image_encryption_key']
          )
        end
      end
    end

    module Property
      # A class to manage input to InitializeParams for instance_template.
      class InstaTemplInitiParam < Google::Compute::Property::Base
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::InstaTemplInitiParamCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::InstaTemplInitiParamApi.new(value)
        end
      end
    end
  end
end

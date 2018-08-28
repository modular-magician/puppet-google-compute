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
      # A class to manage data for Iap for backend_service.
      class BackendServiceIap
        include Comparable

        attr_reader :enabled
        attr_reader :oauth2_client_id
        attr_reader :oauth2_client_secret
        attr_reader :oauth2_client_secret_sha256

        def to_json(_arg = nil)
          {
            'enabled' => enabled,
            'oauth2ClientId' => oauth2_client_id,
            'oauth2ClientSecret' => oauth2_client_secret,
            'oauth2ClientSecretSha256' => oauth2_client_secret_sha256
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            enabled: enabled,
            oauth2_client_id: oauth2_client_id,
            oauth2_client_secret: oauth2_client_secret,
            oauth2_client_secret_sha256: oauth2_client_secret_sha256
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? BackendServiceIap
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? BackendServiceIap
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
            { self: enabled, other: other.enabled },
            { self: oauth2_client_id, other: other.oauth2_client_id },
            { self: oauth2_client_secret, other: other.oauth2_client_secret },
            { self: oauth2_client_secret_sha256, other: other.oauth2_client_secret_sha256 }
          ]
        end
      end

      # Manages a BackendServiceIap nested object
      # Data is coming from the GCP API
      class BackendServiceIapApi < BackendServiceIap
        def initialize(args)
          @enabled = Google::Compute::Property::Boolean.api_munge(args['enabled'])
          @oauth2_client_id = Google::Compute::Property::String.api_munge(args['oauth2ClientId'])
          @oauth2_client_secret =
            Google::Compute::Property::String.api_munge(args['oauth2ClientSecret'])
          @oauth2_client_secret_sha256 =
            Google::Compute::Property::String.api_munge(args['oauth2ClientSecretSha256'])
        end
      end

      # Manages a BackendServiceIap nested object
      # Data is coming from the Puppet manifest
      class BackendServiceIapCatalog < BackendServiceIap
        def initialize(args)
          @enabled = Google::Compute::Property::Boolean.unsafe_munge(args['enabled'])
          @oauth2_client_id =
            Google::Compute::Property::String.unsafe_munge(args['oauth2_client_id'])
          @oauth2_client_secret =
            Google::Compute::Property::String.unsafe_munge(args['oauth2_client_secret'])
          @oauth2_client_secret_sha256 =
            Google::Compute::Property::String.unsafe_munge(args['oauth2_client_secret_sha256'])
        end
      end
    end

    module Property
      # A class to manage input to Iap for backend_service.
      class BackendServiceIap < Google::Compute::Property::Base
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::BackendServiceIapCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::BackendServiceIapApi.new(value)
        end
      end
    end
  end
end
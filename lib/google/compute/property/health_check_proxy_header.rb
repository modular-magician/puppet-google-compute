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
require 'google/compute/property/enum'

module Google
  module Compute
    module Property
      # A Puppet property that holds an enum which contains a default value.
      # Since default values for enums are not returned from the GCP API,
      # we need to return true from `insync?` if the property is absent
      # in the response but set to the default in the config.
      class ProxyHeaderEnum < Google::Compute::Property::Enum
        def insync?(is)
          debug("insync enum? #{name}: '#{is}' == '#{should}'")
          if is == :absent && should == 'NONE'
            true
          else
            super
          end
        end
      end
    end
  end
end

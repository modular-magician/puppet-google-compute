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

require 'puppet'

# Builds a reference to the IP address associated with the Address managed
# by a `gcompute_address` resource.
#
# Arguments:
#   - name: string
#     the name of the address resource
#   - region: string
#     the region where the address resource is allocated
#   - project: string
#     the project name where resource is allocated
#
# Examples:
#   - gcompute_address_ref('my-server', 'us-central1', 'myproject')
#
# This function is useful for when a reference to a resource that have
# multiple facts, such as `gcompute_forwarding_rule { ip_address }`
Puppet::Functions.create_function(:gcompute_address_ref) do
  dispatch :gcompute_address_ref do
    param 'String', :name
    param 'String', :region
    param 'String', :project
  end

  def gcompute_address_ref(name, region, project)
    "projects/#{project}/regions/#{region}/addresses/#{name}"
  end
end

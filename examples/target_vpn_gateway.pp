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

# Getting Started
# ---------------
# The following example requires two environment variables to be set:
#     * cred_path - a path to a JSON service account file
#     * project - the name of your GCP project
#
# If running from the command line you can pass these via Facter:
#
#   FACTER_cred_path=/path/to/my/cred.json \
#   FACTER_project='my-test-project'
#       puppet apply examples/target_vpn_gateway.pp
#
# For convenience you optionally can add it to your ~/.bash_profile (or the
# respective .profile settings) environment:
#
#   export FACTER_cred_path=/path/to/my/cred.json
#   export FACTER_project='my-test-project'
#
# Authenticating to GCP
# ---------------------
# `gauth_credential` defines a credential to be used when communicating with
# Google Cloud Platform.
#
# For more information on the gauth_credential parameters and providers please
# refer to its detailed documentation at:
#
#   https://forge.puppet.com/google/gauth
#
gauth_credential { 'mycred':
  path     => $cred_path, # e.g. '/home/nelsonjr/my_account.json'
  provider => serviceaccount,
  scopes   => [
    'https://www.googleapis.com/auth/compute',
  ],
}


gcompute_region { 'some-region':
  name       => 'us-west1',
  project    => $project, # e.g. 'my-test-project'
  credential => 'mycred',
}

gcompute_network { "mynetwork-${network_id}":
  auto_create_subnetworks => false,
  project                 => $project, # e.g. 'my-test-project'
  credential              => 'mycred',
}

gcompute_target_vpn_gateway { "my-gateway-${gateway_id}":
  project     => $project,
  credential  => 'mycred',
  network     => "mynetwork-${network_id}"}
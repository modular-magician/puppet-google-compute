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
#       puppet apply .tools/end2end/data/instance.pp
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

gcompute_zone { 'us-central1-a':
  project    => $project, # e.g. 'my-test-project'
  credential => 'mycred',
}

gcompute_disk { 'puppet-e2e-instance-test-os-1':
  ensure       => present,
  size_gb      => 50,
  source_image =>
    'projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts',
  zone         => 'us-central1-a',
  project      => $project, # e.g. 'my-test-project'
  credential   => 'mycred',
}

# Tips
#   1) You can use network 'default' if do not use VLAN or other traffic
#      seggregation on your project.
#   2) Don't forget to define the firewall rules if you specify a custom
#      network to ensure the traffic can reach your machine
gcompute_network { 'puppet-e2e-default':
  ensure     => present,
  project    => $project, # e.g. 'my-test-project'
  credential => 'mycred',
}

gcompute_region { 'us-central1':
  project    => $project, # e.g. 'my-test-project'
  credential => 'mycred',
}

# Ensures the 'instance-test-ip' external IP address exists. If it does not
# exist it will allocate an ephemeral one.
gcompute_address { 'puppet-e2e-instance-test-ip':
  region     => 'us-central1',
  project    => $project, # e.g. 'my-test-project'
  credential => 'mycred',
}

gcompute_instance { 'puppet-e2e-instance-test':
  ensure             => present,
  machine_type       => 'n1-standard-1',
  disks              => [
    {
      auto_delete => true,
      boot        => true,
      source      => 'puppet-e2e-instance-test-os-1'
    }
  ],
  metadata           => {
    startup-script-url   => 'gs://graphite-playground/bootstrap.sh',
    cost-center          => '12345',
  },
  network_interfaces => [
    {
      network        => 'puppet-e2e-default',
      access_configs => [
        {
          name   => 'External NAT',
          nat_ip => 'puppet-e2e-instance-test-ip',
          type   => 'ONE_TO_ONE_NAT',
        },
      ],
    }
  ],
  zone               => 'us-central1-a',
  project            => $project, # e.g. 'my-test-project'
  credential         => 'mycred',
}

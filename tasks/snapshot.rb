#!/opt/puppetlabs/puppet/bin/ruby
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

# Snapshots a Google Compute Engine Disk
#
# Command line arguments: JSON object from STDIN with the following fields:
#
# - name: the name of the disk to snapshot
# - target: the name of the snapshot to create (default: <name>-<timestamp>)
# - zone: the zone where the disk is located
# - project: the Google Cloud Project where the disk is hosted
# - credential: the path for the Service Account JSON credential file

COMPUTE_ADM_SCOPES = ['https://www.googleapis.com/auth/compute'].freeze

# Load our own library folder to access 'google/bolt'
libdir = File.expand_path("#{File.dirname(__FILE__)}/../lib")
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

# We want to re-use code already written for the GCP modules
require 'google/compute/bolt'
Google::Compute::Bolt.init

require 'google/auth/gauth_credential'
require 'google/compute/api/gcompute_disk'

params = JSON.parse(STDIN.read)
name = params['name']
target = if params['target'].nil?
           "#{name}-#{Time.now.to_i}"
         else
           params['target']
         end
zone = params['zone']
project = params['project']
credential = params['credential']

cred = Google::Auth::GAuthCredential \
       .serviceaccount_for_function(credential, COMPUTE_ADM_SCOPES)
disk = Google::Compute::Api::Disk.new(name, zone, project, cred)

begin
  disk.snapshot(target)
  puts({ status: 'success' }.to_json)
  exit 0
rescue Puppet::Error => e
  puts({ status: 'failure', error: e }.to_json)
  exit 1
end

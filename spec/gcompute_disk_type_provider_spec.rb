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
#     This file is automatically generated by puppet-codegen and manual
#     changes will be clobbered when the file is regenerated.
#
# ----------------------------------------------------------------------------

require 'spec_helper'

describe Puppet::Type.type(:gcompute_disk_type).provider(:google) do
  before(:all) do
    cred = Google::FakeCredential.new
    Puppet::Type.type(:gauth_credential)
                .define_singleton_method(:fetch) { |_resource| cred }
  end

  DT_PROJECT_DATA = %w(
    test\ project#0\ data
    test\ project#1\ data
    test\ project#2\ data
    test\ project#3\ data
    test\ project#4\ data
  ).freeze

  DT_ZONE_DATA = %w(
    test\ zone#0\ data
    test\ zone#1\ data
    test\ zone#2\ data
    test\ zone#3\ data
    test\ zone#4\ data
  ).freeze

  DT_NAME_DATA = %w(
    test\ name#0\ data
    test\ name#1\ data
    test\ name#2\ data
    test\ name#3\ data
    test\ name#4\ data
  ).freeze

  it '#instances' do
    expect { described_class.instances }.to raise_error(StandardError,
                                                        /not supported/)
  end
  context 'resource exists' do
    context 'no changes == no action' do
      # TODO(nelsonjr): Implement new test format.
    end

    context 'changes == failure' do
      # TODO(nelsonjr): Implement new test format.
      subject { -> { raise '[placeholder] This should fail.' } }

      it { is_expected.to raise_error(RuntimeError, /placeholder/) }
    end
  end

  context 'resource does not exist == failure' do
    # TODO(nelsonjr): Implement new test format.
    subject { -> { raise '[placeholder] This should fail.' } }

    it { is_expected.to raise_error(RuntimeError, /placeholder/) }
  end

  context 'create provider' do
    subject { create_type(1).provider }

    it { is_expected.to have_attributes(creation_timestamp: :absent) }
    it { is_expected.to have_attributes(default_disk_size_gb: :absent) }
    it { is_expected.to have_attributes(deprecated_deleted: :absent) }
    it { is_expected.to have_attributes(deprecated_deprecated: :absent) }
    it { is_expected.to have_attributes(deprecated_obsolete: :absent) }
    it { is_expected.to have_attributes(deprecated_replacement: :absent) }
    it { is_expected.to have_attributes(deprecated_state: :absent) }
    it { is_expected.to have_attributes(description: :absent) }
    it { is_expected.to have_attributes(id: :absent) }
    it { is_expected.to have_attributes(valid_disk_size: :absent) }
  end

  context '#prefetch' do
    before do
      expect_network_get_success 1
      expect_network_get_success 2
      expect_network_get_failed 3
    end

    let(:resource1) { create_type 1 }
    let(:resource2) { create_type 2 }
    let(:resource3) { create_type 3 }

    subject { [resource1, resource2, resource3] }

    context 'network' do
      before do
        # Process the resources
        described_class.prefetch(title1: resource1,
                                 title2: resource2,
                                 title3: resource3)
      end

      let(:providers) do
        [resource1.provider, resource2.provider, resource3.provider]
      end

      #
      # Ensure we have the final vales as retrieved from the service
      #

      context 'provider 1' do
        subject { providers[0] }

        it do
          is_expected
            .to have_attributes(creation_timestamp: '2045-05-23T12:08:10+00:00')
        end
        it do
          is_expected
            .to have_attributes(default_disk_size_gb: 2_109_438_101)
        end
        it do
          is_expected
            .to have_attributes(deprecated_deleted: '2023-11-07T16:45:28+00:00')
        end
        it do
          is_expected
            .to have_attributes(deprecated_deprecated:
              '2054-11-19T12:29:05+00:00')
        end
        it do
          is_expected
            .to have_attributes(deprecated_obsolete:
              '2008-04-08T00:34:16+00:00')
        end
        it do
          is_expected
            .to have_attributes(deprecated_replacement:
              'test deprecated_replacement#0 data')
        end
        it { is_expected.to have_attributes(deprecated_state: 'DEPRECATED') }
        it do
          is_expected
            .to have_attributes(description: 'test description#0 data')
        end
        it { is_expected.to have_attributes(id: 2_149_500_871) }
        it { is_expected.to have_attributes(name: 'test name#0 data') }
        it do
          is_expected
            .to have_attributes(valid_disk_size: 'test valid_disk_size#0 data')
        end
      end
      #
      # Ensure we have the final vales as retrieved from the service
      #

      context 'provider 2' do
        subject { providers[1] }

        it do
          is_expected
            .to have_attributes(creation_timestamp: '2120-10-14T00:16:21+00:00')
        end
        it do
          is_expected
            .to have_attributes(default_disk_size_gb: 4_218_876_203)
        end
        it do
          is_expected
            .to have_attributes(deprecated_deleted: '2077-09-13T09:30:57+00:00')
        end
        it do
          is_expected
            .to have_attributes(deprecated_deprecated:
              '2139-10-09T00:58:11+00:00')
        end
        it do
          is_expected
            .to have_attributes(deprecated_obsolete:
              '2046-07-15T01:08:32+00:00')
        end
        it do
          is_expected
            .to have_attributes(deprecated_replacement:
              'test deprecated_replacement#1 data')
        end
        it { is_expected.to have_attributes(deprecated_state: 'OBSOLETE') }
        it do
          is_expected
            .to have_attributes(description: 'test description#1 data')
        end
        it { is_expected.to have_attributes(id: 4_299_001_743) }
        it { is_expected.to have_attributes(name: 'test name#1 data') }
        it do
          is_expected
            .to have_attributes(valid_disk_size: 'test valid_disk_size#1 data')
        end
      end

      #
      # Ensure we have the final vales as retrieved from the service
      #

      context 'provider 3' do
        subject { providers[2] }

        it { is_expected.to have_attributes(creation_timestamp: :absent) }
        it { is_expected.to have_attributes(default_disk_size_gb: :absent) }
        it { is_expected.to have_attributes(deprecated_deleted: :absent) }
        it { is_expected.to have_attributes(deprecated_deprecated: :absent) }
        it { is_expected.to have_attributes(deprecated_obsolete: :absent) }
        it { is_expected.to have_attributes(deprecated_replacement: :absent) }
        it { is_expected.to have_attributes(deprecated_state: :absent) }
        it { is_expected.to have_attributes(description: :absent) }
        it { is_expected.to have_attributes(id: :absent) }
        it { is_expected.to have_attributes(valid_disk_size: :absent) }
      end
    end
  end

  context '#flush' do
    subject do
      Puppet::Type.type(:gcompute_disk_type).new(
        name: 'my-name'
      ).provider
    end

    context 'no-op' do
      it { subject.flush }
    end

    context 'modified object' do
      before do
        subject.dirty :some_property, 'current', 'newvalue'
      end

      context 'no-op if created' do
        before { subject.instance_variable_set(:@created, true) }
        it { expect { subject.flush }.not_to raise_error }
      end

      context 'no-op if deleted' do
        before { subject.instance_variable_set(:@deleted, true) }
        it { expect { subject.flush }.not_to raise_error }
      end
    end
  end

  private

  def expect_network_get_success(id)
    body = load_network_result("success#{id}.yaml").to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    expect(Google::Request::Get).to receive(:new)
      .with(self_link(uri_data(id)), instance_of(Google::FakeCredential))
      .and_return(request)
  end

  def http_success(body)
    response = Net::HTTPOK.new(1.0, 200, 'OK')
    response.body = body
    response.instance_variable_set(:@read, true)
    response
  end

  def expect_network_get_failed(id, data = {})
    request = double('request')
    allow(request).to receive(:send).and_return(http_failed_object_missing)

    expect(Google::Request::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeCredential))
      .and_return(request)
  end

  def http_failed_object_missing
    Net::HTTPNotFound.new(1.0, 404, 'Not Found')
  end

  def load_network_result(file)
    results = File.join(File.dirname(__FILE__), 'data', 'network',
                        'gcompute_disk_type', file)
    raise "Network result data file #{results}" unless File.exist?(results)
    data = YAML.safe_load(File.read(results))
    raise "Invalid network results #{results}" unless data.class <= Hash
    data
  end

  def create_type(id)
    Puppet::Type.type(:gcompute_disk_type).new(
      title: "title#{id - 1}",
      credential: "cred#{id - 1}",
      project: DT_PROJECT_DATA[(id - 1) % DT_PROJECT_DATA.size],
      zone: DT_ZONE_DATA[(id - 1) % DT_ZONE_DATA.size],
      name: DT_NAME_DATA[(id - 1) % DT_NAME_DATA.size]
    )
  end

  def expand_variables(template, data, extra_data = {})
    Puppet::Type.type(:gcompute_disk_type).provider(:google)
                .expand_variables(template, data, extra_data)
  end

  def collection(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/zones/{{zone}}/diskTypes',
        data
      )
    )
  end

  def self_link(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/zones/{{zone}}/diskTypes/{{name}}',
        data
      )
    )
  end

  # Creates variable test data to comply with self_link URI parameters
  def uri_data(id)
    {
      project: DT_PROJECT_DATA[(id - 1) % DT_PROJECT_DATA.size],
      zone: DT_ZONE_DATA[(id - 1) % DT_ZONE_DATA.size],
      name: DT_NAME_DATA[(id - 1) % DT_NAME_DATA.size]
    }
  end
end

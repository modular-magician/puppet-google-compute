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

require 'spec_helper'

class TestCred
  def authorize(request)
    request
  end
end

describe Google::Compute::Network::Delete do
  let(:credential) { TestCred.new }
  let(:uri) { Google::Compute::NetworkBlocker::ALLOWED_TEST_URI }

  context 'verify proper request' do
    before(:each) { Google::Compute::NetworkBlocker.instance.allow_delete(uri) }

    subject { described_class.new(uri, credential).send }

    it { is_expected.to be_a_kind_of(Net::HTTPNoContent) }
    it { is_expected.to have_attributes(code: 204) }
  end

  context 'failed request' do
    before(:each) { Google::Compute::NetworkBlocker.instance.deny(uri) }

    subject { described_class.new(uri, credential).send }

    it { is_expected.to be_a_kind_of(Net::HTTPNotFound) }
    it { is_expected.to have_attributes(code: 404) }
  end
end
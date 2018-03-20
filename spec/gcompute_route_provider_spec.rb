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

require 'spec_helper'

describe Puppet::Type.type(:gcompute_route).provider(:google) do
  before(:all) do
    cred = Google::FakeAuthorization.new
    Puppet::Type.type(:gauth_credential)
                .define_singleton_method(:fetch) { |_resource| cred }
  end

  it '#instances' do
    expect { described_class.instances }.to raise_error(StandardError,
                                                        /not supported/)
  end

  context 'ensure == present' do
    context 'resource exists' do
      # Ensure present: resource exists, no change
      context 'no changes == no action' do
        # Ensure present: resource exists, no change, no name
        context 'title == name' do
          # Ensure present: resource exists, no change, no name, pass
          context 'title == name (pass)' do
            before do
              allow(Time).to receive(:now).and_return(
                Time.new(2017, 1, 2, 3, 4, 5)
              )
              expect_network_get_success 1, name: 'title0'
              expect_network_get_success 2, name: 'title1'
              expect_network_get_success 3, name: 'title2'
              expect_network_get_success_network 1
              expect_network_get_success_network 2
              expect_network_get_success_network 3
            end

            let(:catalog) do
              apply_with_error_check(
                <<-MANIFEST
                gcompute_network { 'resource(network,0)':
                  ensure     => present,
                  name       => 'test name#0 data',
                  project    => 'test project#0 data',
                  credential => 'cred0',
                }

                gcompute_network { 'resource(network,1)':
                  ensure     => present,
                  name       => 'test name#1 data',
                  project    => 'test project#1 data',
                  credential => 'cred1',
                }

                gcompute_network { 'resource(network,2)':
                  ensure     => present,
                  name       => 'test name#2 data',
                  project    => 'test project#2 data',
                  credential => 'cred2',
                }

                gcompute_route { 'title0':
                  ensure              => present,
                  dest_range          => 'test dest_range#0 data',
                  network             => 'resource(network,0)',
                  next_hop_gateway    => 'test next_hop_gateway#0 data',
                  next_hop_instance   => 'test next_hop_instance#0 data',
                  next_hop_ip         => 'test next_hop_ip#0 data',
                  next_hop_vpn_tunnel => 'test next_hop_vpn_tunnel#0 data',
                  priority            => 1108918677,
                  tags                => ['mm', 'nn', 'oo', 'pp'],
                  project             => 'test project#0 data',
                  credential          => 'cred0',
                }

                gcompute_route { 'title1':
                  ensure              => present,
                  dest_range          => 'test dest_range#1 data',
                  network             => 'resource(network,1)',
                  next_hop_gateway    => 'test next_hop_gateway#1 data',
                  next_hop_instance   => 'test next_hop_instance#1 data',
                  next_hop_ip         => 'test next_hop_ip#1 data',
                  next_hop_vpn_tunnel => 'test next_hop_vpn_tunnel#1 data',
                  priority            => 2217837354,
                  tags                => ['bb', 'cc', 'dd'],
                  project             => 'test project#1 data',
                  credential          => 'cred1',
                }

                gcompute_route { 'title2':
                  ensure              => present,
                  dest_range          => 'test dest_range#2 data',
                  network             => 'resource(network,2)',
                  next_hop_gateway    => 'test next_hop_gateway#2 data',
                  next_hop_instance   => 'test next_hop_instance#2 data',
                  next_hop_ip         => 'test next_hop_ip#2 data',
                  next_hop_vpn_tunnel => 'test next_hop_vpn_tunnel#2 data',
                  priority            => 3326756031,
                  tags                => ['qq', 'rr'],
                  project             => 'test project#2 data',
                  credential          => 'cred2',
                }
                MANIFEST
              ).catalog
            end

            context 'Gcompute_route[title0]' do
              subject do
                catalog.resource('Gcompute_route[title0]').provider
              end

              it do
                is_expected
                  .to have_attributes(dest_range: 'test dest_range#0 data')
              end
              it { is_expected.to have_attributes(name: 'title0') }
              # TODO(alexstephen): Implement resourceref test.
              # it 'network' do
              #   # Add test code here
              # end
              it { is_expected.to have_attributes(priority: 1_108_918_677) }
              it { is_expected.to have_attributes(tags: %w[mm nn oo pp]) }
              it do
                is_expected
                  .to have_attributes(
                    next_hop_gateway: 'test next_hop_gateway#0 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_instance: 'test next_hop_instance#0 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(next_hop_ip: 'test next_hop_ip#0 data')
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_vpn_tunnel: 'test next_hop_vpn_tunnel#0 data'
                  )
              end
            end

            context 'Gcompute_route[title1]' do
              subject do
                catalog.resource('Gcompute_route[title1]').provider
              end

              it do
                is_expected
                  .to have_attributes(dest_range: 'test dest_range#1 data')
              end
              it { is_expected.to have_attributes(name: 'title1') }
              # TODO(alexstephen): Implement resourceref test.
              # it 'network' do
              #   # Add test code here
              # end
              it { is_expected.to have_attributes(priority: 2_217_837_354) }
              it { is_expected.to have_attributes(tags: %w[bb cc dd]) }
              it do
                is_expected
                  .to have_attributes(
                    next_hop_gateway: 'test next_hop_gateway#1 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_instance: 'test next_hop_instance#1 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(next_hop_ip: 'test next_hop_ip#1 data')
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_vpn_tunnel: 'test next_hop_vpn_tunnel#1 data'
                  )
              end
            end

            context 'Gcompute_route[title2]' do
              subject do
                catalog.resource('Gcompute_route[title2]').provider
              end

              it do
                is_expected
                  .to have_attributes(dest_range: 'test dest_range#2 data')
              end
              it { is_expected.to have_attributes(name: 'title2') }
              # TODO(alexstephen): Implement resourceref test.
              # it 'network' do
              #   # Add test code here
              # end
              it { is_expected.to have_attributes(priority: 3_326_756_031) }
              it { is_expected.to have_attributes(tags: %w[qq rr]) }
              it do
                is_expected
                  .to have_attributes(
                    next_hop_gateway: 'test next_hop_gateway#2 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_instance: 'test next_hop_instance#2 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(next_hop_ip: 'test next_hop_ip#2 data')
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_vpn_tunnel: 'test next_hop_vpn_tunnel#2 data'
                  )
              end
            end
          end

          # Ensure present: resource exists, no change, no name, fail
          context 'title == name (fail)' do
            # TODO(nelsonjr): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end

        # Ensure present: resource exists, no change, has name
        context 'title != name' do
          # Ensure present: resource exists, no change, has name, pass
          context 'title != name (pass)' do
            before do
              allow(Time).to receive(:now).and_return(
                Time.new(2017, 1, 2, 3, 4, 5)
              )
              expect_network_get_success 1
              expect_network_get_success 2
              expect_network_get_success 3
              expect_network_get_success_network 1
              expect_network_get_success_network 2
              expect_network_get_success_network 3
            end

            let(:catalog) do
              apply_with_error_check(
                <<-MANIFEST
                gcompute_network { 'resource(network,0)':
                  ensure     => present,
                  name       => 'test name#0 data',
                  project    => 'test project#0 data',
                  credential => 'cred0',
                }

                gcompute_network { 'resource(network,1)':
                  ensure     => present,
                  name       => 'test name#1 data',
                  project    => 'test project#1 data',
                  credential => 'cred1',
                }

                gcompute_network { 'resource(network,2)':
                  ensure     => present,
                  name       => 'test name#2 data',
                  project    => 'test project#2 data',
                  credential => 'cred2',
                }

                gcompute_route { 'title0':
                  ensure              => present,
                  dest_range          => 'test dest_range#0 data',
                  name                => 'test name#0 data',
                  network             => 'resource(network,0)',
                  next_hop_gateway    => 'test next_hop_gateway#0 data',
                  next_hop_instance   => 'test next_hop_instance#0 data',
                  next_hop_ip         => 'test next_hop_ip#0 data',
                  next_hop_vpn_tunnel => 'test next_hop_vpn_tunnel#0 data',
                  priority            => 1108918677,
                  tags                => ['mm', 'nn', 'oo', 'pp'],
                  project             => 'test project#0 data',
                  credential          => 'cred0',
                }

                gcompute_route { 'title1':
                  ensure              => present,
                  dest_range          => 'test dest_range#1 data',
                  name                => 'test name#1 data',
                  network             => 'resource(network,1)',
                  next_hop_gateway    => 'test next_hop_gateway#1 data',
                  next_hop_instance   => 'test next_hop_instance#1 data',
                  next_hop_ip         => 'test next_hop_ip#1 data',
                  next_hop_vpn_tunnel => 'test next_hop_vpn_tunnel#1 data',
                  priority            => 2217837354,
                  tags                => ['bb', 'cc', 'dd'],
                  project             => 'test project#1 data',
                  credential          => 'cred1',
                }

                gcompute_route { 'title2':
                  ensure              => present,
                  dest_range          => 'test dest_range#2 data',
                  name                => 'test name#2 data',
                  network             => 'resource(network,2)',
                  next_hop_gateway    => 'test next_hop_gateway#2 data',
                  next_hop_instance   => 'test next_hop_instance#2 data',
                  next_hop_ip         => 'test next_hop_ip#2 data',
                  next_hop_vpn_tunnel => 'test next_hop_vpn_tunnel#2 data',
                  priority            => 3326756031,
                  tags                => ['qq', 'rr'],
                  project             => 'test project#2 data',
                  credential          => 'cred2',
                }
                MANIFEST
              ).catalog
            end

            context 'Gcompute_route[title0]' do
              subject do
                catalog.resource('Gcompute_route[title0]').provider
              end

              it do
                is_expected
                  .to have_attributes(dest_range: 'test dest_range#0 data')
              end
              it { is_expected.to have_attributes(name: 'test name#0 data') }
              # TODO(alexstephen): Implement resourceref test.
              # it 'network' do
              #   # Add test code here
              # end
              it { is_expected.to have_attributes(priority: 1_108_918_677) }
              it { is_expected.to have_attributes(tags: %w[mm nn oo pp]) }
              it do
                is_expected
                  .to have_attributes(
                    next_hop_gateway: 'test next_hop_gateway#0 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_instance: 'test next_hop_instance#0 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(next_hop_ip: 'test next_hop_ip#0 data')
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_vpn_tunnel: 'test next_hop_vpn_tunnel#0 data'
                  )
              end
            end

            context 'Gcompute_route[title1]' do
              subject do
                catalog.resource('Gcompute_route[title1]').provider
              end

              it do
                is_expected
                  .to have_attributes(dest_range: 'test dest_range#1 data')
              end
              it { is_expected.to have_attributes(name: 'test name#1 data') }
              # TODO(alexstephen): Implement resourceref test.
              # it 'network' do
              #   # Add test code here
              # end
              it { is_expected.to have_attributes(priority: 2_217_837_354) }
              it { is_expected.to have_attributes(tags: %w[bb cc dd]) }
              it do
                is_expected
                  .to have_attributes(
                    next_hop_gateway: 'test next_hop_gateway#1 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_instance: 'test next_hop_instance#1 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(next_hop_ip: 'test next_hop_ip#1 data')
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_vpn_tunnel: 'test next_hop_vpn_tunnel#1 data'
                  )
              end
            end

            context 'Gcompute_route[title2]' do
              subject do
                catalog.resource('Gcompute_route[title2]').provider
              end

              it do
                is_expected
                  .to have_attributes(dest_range: 'test dest_range#2 data')
              end
              it { is_expected.to have_attributes(name: 'test name#2 data') }
              # TODO(alexstephen): Implement resourceref test.
              # it 'network' do
              #   # Add test code here
              # end
              it { is_expected.to have_attributes(priority: 3_326_756_031) }
              it { is_expected.to have_attributes(tags: %w[qq rr]) }
              it do
                is_expected
                  .to have_attributes(
                    next_hop_gateway: 'test next_hop_gateway#2 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_instance: 'test next_hop_instance#2 data'
                  )
              end
              it do
                is_expected
                  .to have_attributes(next_hop_ip: 'test next_hop_ip#2 data')
              end
              it do
                is_expected
                  .to have_attributes(
                    next_hop_vpn_tunnel: 'test next_hop_vpn_tunnel#2 data'
                  )
              end
            end
          end

          # Ensure present: resource exists, no change, has name, fail
          context 'title != name (fail)' do
            # TODO(nelsonjr): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end
      end

      # Ensure present: resource exists, changes
      context 'changes == action' do
        # Ensure present: resource exists, changes, no name
        context 'title == name' do
          # Ensure present: resource exists, changes, no name, pass
          context 'title == name (pass)' do
            # TODO(nelsonjr): Implement new test format.
          end

          # Ensure present: resource exists, changes, no name, fail
          context 'title == name (fail)' do
            # TODO(nelsonjr): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end

        # Ensure present: resource exists, changes, has name
        context 'title != name' do
          # Ensure present: resource exists, changes, has name, pass
          context 'title != name (pass)' do
            # TODO(nelsonjr): Implement new test format.
          end

          # Ensure present: resource exists, changes, has name, fail
          context 'title != name (fail)' do
            # TODO(nelsonjr): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end
      end
    end

    context 'resource missing' do
      # Ensure present: resource missing, ignore, no name
      context 'title == name' do
        # Ensure present: resource missing, ignore, no name, pass
        context 'title == name (pass)' do
          before(:each) do
            expect_network_get_failed 1, name: 'title0'
            expect_network_create \
              1,
              {
                'kind' => 'compute#route',
                'destRange' => 'test dest_range#0 data',
                'name' => 'title0',
                'network' => 'selflink(resource(network,0))',
                'priority' => 1_108_918_677,
                'tags' => %w[mm nn oo pp],
                'nextHopGateway' => 'test next_hop_gateway#0 data',
                'nextHopInstance' => 'test next_hop_instance#0 data',
                'nextHopIp' => 'test next_hop_ip#0 data',
                'nextHopVpnTunnel' => 'test next_hop_vpn_tunnel#0 data'
              },
              name: 'title0'
            expect_network_get_async 1, name: 'title0'
            expect_network_get_success_network 1
          end

          subject do
            apply_with_error_check(
              <<-MANIFEST
              gcompute_network { 'resource(network,0)':
                ensure     => present,
                name       => 'test name#0 data',
                project    => 'test project#0 data',
                credential => 'cred0',
              }

              gcompute_route { 'title0':
                ensure              => present,
                dest_range          => 'test dest_range#0 data',
                network             => 'resource(network,0)',
                next_hop_gateway    => 'test next_hop_gateway#0 data',
                next_hop_instance   => 'test next_hop_instance#0 data',
                next_hop_ip         => 'test next_hop_ip#0 data',
                next_hop_vpn_tunnel => 'test next_hop_vpn_tunnel#0 data',
                priority            => 1108918677,
                tags                => ['mm', 'nn', 'oo', 'pp'],
                project             => 'test project#0 data',
                credential          => 'cred0',
              }
              MANIFEST
            ).catalog.resource('Gcompute_route[title0]').provider.ensure
          end

          it { is_expected.to eq :present }
        end

        # Ensure present: resource missing, ignore, no name, fail
        context 'title == name (fail)' do
          # TODO(nelsonjr): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end

      # Ensure present: resource missing, ignore, has name
      context 'title != name' do
        # Ensure present: resource missing, ignore, has name, pass
        context 'title != name (pass)' do
          before(:each) do
            expect_network_get_failed 1
            expect_network_create \
              1,
              'kind' => 'compute#route',
              'destRange' => 'test dest_range#0 data',
              'name' => 'test name#0 data',
              'network' => 'selflink(resource(network,0))',
              'priority' => 1_108_918_677,
              'tags' => %w[mm nn oo pp],
              'nextHopGateway' => 'test next_hop_gateway#0 data',
              'nextHopInstance' => 'test next_hop_instance#0 data',
              'nextHopIp' => 'test next_hop_ip#0 data',
              'nextHopVpnTunnel' => 'test next_hop_vpn_tunnel#0 data'
            expect_network_get_async 1
            expect_network_get_success_network 1
          end

          subject do
            apply_with_error_check(
              <<-MANIFEST
              gcompute_network { 'resource(network,0)':
                ensure     => present,
                name       => 'test name#0 data',
                project    => 'test project#0 data',
                credential => 'cred0',
              }

              gcompute_route { 'title0':
                ensure              => present,
                dest_range          => 'test dest_range#0 data',
                name                => 'test name#0 data',
                network             => 'resource(network,0)',
                next_hop_gateway    => 'test next_hop_gateway#0 data',
                next_hop_instance   => 'test next_hop_instance#0 data',
                next_hop_ip         => 'test next_hop_ip#0 data',
                next_hop_vpn_tunnel => 'test next_hop_vpn_tunnel#0 data',
                priority            => 1108918677,
                tags                => ['mm', 'nn', 'oo', 'pp'],
                project             => 'test project#0 data',
                credential          => 'cred0',
              }
              MANIFEST
            ).catalog.resource('Gcompute_route[title0]').provider.ensure
          end

          it { is_expected.to eq :present }
        end

        # Ensure present: resource missing, ignore, has name, fail
        context 'title != name (fail)' do
          # TODO(nelsonjr): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
    end
  end

  context 'ensure == absent' do
    context 'resource missing' do
      # Ensure absent: resource missing, ignore, no name
      context 'title == name' do
        # Ensure absent: resource missing, ignore, no name, pass
        context 'title == name (pass)' do
          before(:each) do
            expect_network_get_failed 1, name: 'title0'
          end

          subject do
            apply_with_error_check(
              <<-MANIFEST
              gcompute_route { 'title0':
                ensure     => absent,
                project    => 'test project#0 data',
                credential => 'cred0',
              }
              MANIFEST
            ).catalog.resource('Gcompute_route[title0]')
              .provider.ensure
          end

          it { is_expected.to eq :absent }
        end

        # Ensure absent: resource missing, ignore, no name, fail
        context 'title == name (fail)' do
          # TODO(nelsonjr): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end

      # Ensure absent: resource missing, ignore, has name
      context 'title != name' do
        # Ensure absent: resource missing, ignore, has name, pass
        context 'title != name (pass)' do
          before(:each) do
            expect_network_get_failed 1
          end

          subject do
            apply_with_error_check(
              <<-MANIFEST
              gcompute_route { 'title0':
                ensure     => absent,
                name       => 'test name#0 data',
                project    => 'test project#0 data',
                credential => 'cred0',
              }
              MANIFEST
            ).catalog.resource('Gcompute_route[title0]')
              .provider.ensure
          end

          it { is_expected.to eq :absent }
        end

        # Ensure absent: resource missing, ignore, has name, fail
        context 'title != name (fail)' do
          # TODO(nelsonjr): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
    end

    context 'resource exists' do
      # Ensure absent: resource exists, ignore, no name
      context 'title == name' do
        # Ensure absent: resource exists, ignore, no name, pass
        context 'title == name (pass)' do
          before(:each) do
            expect_network_get_success 1, name: 'title0'
            expect_network_delete 1, 'title0'
            expect_network_get_async 1, name: 'title0'
          end

          subject do
            apply_with_error_check(
              <<-MANIFEST
              gcompute_route { 'title0':
                ensure     => absent,
                project    => 'test project#0 data',
                credential => 'cred0',
              }
              MANIFEST
            ).catalog.resource('Gcompute_route[title0]')
              .provider.ensure
          end

          it { is_expected.to eq :absent }
        end

        # Ensure absent: resource exists, ignore, no name, fail
        context 'title == name (fail)' do
          # TODO(nelsonjr): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end

      # Ensure absent: resource exists, ignore, has name
      context 'title != name' do
        # Ensure absent: resource exists, ignore, has name, pass
        context 'title != name (pass)' do
          before(:each) do
            expect_network_get_success 1
            expect_network_delete 1
            expect_network_get_async 1
          end

          subject do
            apply_with_error_check(
              <<-MANIFEST
              gcompute_route { 'title0':
                ensure     => absent,
                name       => 'test name#0 data',
                project    => 'test project#0 data',
                credential => 'cred0',
              }
              MANIFEST
            ).catalog.resource('Gcompute_route[title0]')
              .provider.ensure
          end

          it { is_expected.to eq :absent }
        end

        # Ensure absent: resource exists, ignore, has name, fail
        context 'title != name (fail)' do
          # TODO(nelsonjr): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
    end
  end

  context '#flush' do
    subject do
      Puppet::Type.type(:gcompute_route).new(
        ensure: :present,
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

  def expect_network_get_success(id, data = {})
    id_data = data.fetch(:name, '').include?('title') ? 'title' : 'name'
    body = load_network_result("success#{id}~#{id_data}.yaml").to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! GET #{self_link(uri_data(id).merge(data))}"
    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> GET #{args}"
      request
    end
  end

  def http_success(body)
    response = Net::HTTPOK.new(1.0, 200, 'OK')
    response.body = body
    response.instance_variable_set(:@read, true)
    response
  end

  def expect_network_get_async(id, data = {})
    body = { kind: 'compute#route' }.to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! #{self_link(uri_data(id).merge(data))}"
    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> GET <async> #{args}"
      request
    end
  end

  def expect_network_get_failed(id, data = {})
    request = double('request')
    allow(request).to receive(:send).and_return(http_failed_object_missing)

    debug_network "!! #{self_link(uri_data(id).merge(data))}"
    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> GET [failed] #{args}"
      request
    end
  end

  def http_failed_object_missing
    Net::HTTPNotFound.new(1.0, 404, 'Not Found')
  end

  def expect_network_create(id, expected_body, data = {})
    merged_uri = uri_data(id).merge(data)
    body = { kind: 'compute#operation',
             status: 'DONE', targetLink: self_link(merged_uri) }.to_json

    # Remove refs that are also part of the body
    expected_body = Hash[expected_body.map do |k, v|
      [k.is_a?(Symbol) ? k.id2name : k, v]
    end]

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! POST #{collection(merged_uri)}"
    expect(Google::Compute::Network::Post).to receive(:new)
      .with(collection(merged_uri), instance_of(Google::FakeAuthorization),
            'application/json', expected_body.to_json) do |args|
      debug_network ">> POST #{args} = body(#{body})"
      request
    end
  end

  def expect_network_delete(id, name = nil, data = {})
    delete_data = uri_data(id).merge(data)
    delete_data[:name] = name unless name.nil?
    body = { kind: 'compute#operation',
             status: 'DONE',
             targetLink: self_link(delete_data) }.to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! DELETE #{self_link(delete_data)}"
    expect(Google::Compute::Network::Delete).to receive(:new)
      .with(self_link(delete_data),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> DELETE #{args}"
      request
    end
  end

  def load_network_result(file)
    results = File.join(File.dirname(__FILE__), 'data', 'network',
                        'gcompute_route', file)
    debug("Loading result file: #{results}")
    raise "Network result data file #{results}" unless File.exist?(results)
    data = YAML.safe_load(File.read(results))
    raise "Invalid network results #{results}" unless data.class <= Hash
    data
  end

  def expect_network_get_success_network(id, data = {})
    id_data = data.fetch(:name, '').include?('title') ? 'title' : 'name'
    body = load_network_result_network("success#{id}~" \
                                                           "#{id_data}.yaml")
           .to_json
    uri = uri_data_network(id).merge(data)

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! GET #{uri}"
    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link_network(uri),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> GET #{args}"
      request
    end
  end

  def load_network_result_network(file)
    results = File.join(File.dirname(__FILE__), 'data', 'network',
                        'gcompute_network', file)
    raise "Network result data file #{results}" unless File.exist?(results)
    data = YAML.safe_load(File.read(results))
    raise "Invalid network results #{results}" unless data.class <= Hash
    data
  end

  # Creates variable test data to comply with self_link URI parameters
  # Only used for gcompute_network objects
  def uri_data_network(id)
    {
      project: GoogleTests::Constants::N_PROJECT_DATA[(id - 1) \
        % GoogleTests::Constants::N_PROJECT_DATA.size],
      name: GoogleTests::Constants::N_NAME_DATA[(id - 1) \
        % GoogleTests::Constants::N_NAME_DATA.size]
    }
  end

  def self_link_network(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables_network(
        'projects/{{project}}/global/networks/{{name}}',
        data
      )
    )
  end

  def debug(message)
    puts(message) if ENV['RSPEC_DEBUG']
  end

  def debug_network(message)
    puts("Network #{message}") \
      if ENV['RSPEC_DEBUG'] || ENV['RSPEC_HTTP_VERBOSE']
  end

  def expand_variables_network(template, data, ext_dat = {})
    Puppet::Type.type(:gcompute_network).provider(:google)
                .expand_variables(template, data, ext_dat)
  end

  def create_type(id)
    Puppet::Type.type(:gcompute_route).new(
      ensure: :present,
      title: "title#{id - 1}",
      credential: "cred#{id - 1}",
      project: GoogleTests::Constants::R_PROJECT_DATA[(id - 1) \
        % GoogleTests::Constants::R_PROJECT_DATA.size],
      name: GoogleTests::Constants::R_NAME_DATA[(id - 1) \
        % GoogleTests::Constants::R_NAME_DATA.size]
    )
  end

  def expand_variables(template, data, extra_data = {})
    Puppet::Type.type(:gcompute_route).provider(:google)
                .expand_variables(template, data, extra_data)
  end

  def collection(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/global/routes',
        data
      )
    )
  end

  def self_link(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/global/routes/{{name}}',
        data
      )
    )
  end

  # Creates variable test data to comply with self_link URI parameters
  def uri_data(id)
    {
      project: GoogleTests::Constants::R_PROJECT_DATA[(id - 1) \
        % GoogleTests::Constants::R_PROJECT_DATA.size],
      name: GoogleTests::Constants::R_NAME_DATA[(id - 1) \
        % GoogleTests::Constants::R_NAME_DATA.size]
    }
  end
end

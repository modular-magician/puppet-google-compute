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

require 'google/compute/property/backendservice_selflink'
require 'google/compute/property/enum'
require 'google/compute/property/integer'
require 'google/compute/property/network_selflink'
require 'google/compute/property/region_name'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/subnetwork_selflink'
require 'google/compute/property/time'
require 'puppet'

Puppet::Type.newtype(:gcompute_global_forwarding_rule) do
  @doc = <<-DOC
    Represents a GlobalForwardingRule resource. Global forwarding rules are
    used to forward traffic to the correct load balancer for HTTP load
    balancing. Global forwarding rules can only be used for HTTP load
    balancing. For more information, see
    https://cloud.google.com/compute/docs/load-balancing/http/
  DOC

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  ensurable

  newparam :credential do
    desc <<-DESC
      A gauth_credential name to be used to authenticate with Google Cloud
      Platform.
    DESC
  end

  newparam(:project) do
    desc 'A Google Cloud Platform project to manage.'
  end

  newparam(:name, namevar: true) do
    # TODO(nelsona): Make this description to match the key of the object.
    desc 'The name of the GlobalForwardingRule.'
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc <<-DOC
      An optional description of this resource. Provide this property when you
      create the resource.
    DOC
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc 'The unique identifier for the resource. (output only)'
  end

  newproperty(:ip_address, parent: Google::Compute::Property::String) do
    desc <<-DOC
      The IP address that this forwarding rule is serving on behalf of.
      Addresses are restricted based on the forwarding rule's load balancing
      scheme (EXTERNAL or INTERNAL) and scope (global or regional). When the
      load balancing scheme is EXTERNAL, for global forwarding rules, the
      address must be a global IP, and for regional forwarding rules, the
      address must live in the same region as the forwarding rule. If this
      field is empty, an ephemeral IPv4 address from the same scope (global or
      regional) will be assigned. A regional forwarding rule supports IPv4
      only. A global forwarding rule supports either IPv4 or IPv6. When the
      load balancing scheme is INTERNAL, this can only be an RFC 1918 IP
      address belonging to the network/subnet configured for the forwarding
      rule. By default, if this field is empty, an ephemeral internal IP
      address will be automatically allocated from the IP range of the subnet
      or network configured for this forwarding rule. An address can be
      specified either by a literal IP address or a URL reference to an
      existing Address resource. The following examples are all valid: *
      100.1.2.3 *
      https://www.googleapis.com/compute/v1/projects/project/regions/
      region/addresses/address *
      projects/project/regions/region/addresses/address *
      regions/region/addresses/address * global/addresses/address * address
    DOC
  end

  newproperty(:ip_protocol, parent: Google::Compute::Property::Enum) do
    desc <<-DOC
      The IP protocol to which this rule applies. Valid options are TCP, UDP,
      ESP, AH, SCTP or ICMP. When the load balancing scheme is INTERNAL, only
      TCP and UDP are valid.
    DOC
    newvalue(:TCP)
    newvalue(:UDP)
    newvalue(:ESP)
    newvalue(:AH)
    newvalue(:SCTP)
    newvalue(:ICMP)
  end

  newproperty(:backend_service,
              parent: Google::Compute::Property::BackServSelfLinkRef) do
    desc 'A reference to BackendService resource'
  end

  newproperty(:ip_version, parent: Google::Compute::Property::Enum) do
    desc <<-DOC
      The IP Version that will be used by this forwarding rule. Valid options
      are IPV4 or IPV6. This can only be specified for a global forwarding
      rule.
    DOC
    newvalue(:IPV4)
    newvalue(:IPV6)
  end

  newproperty(:load_balancing_scheme,
              parent: Google::Compute::Property::Enum) do
    desc <<-DOC
      This signifies what the ForwardingRule will be used for and can only take
      the following values: INTERNAL, EXTERNAL The value of INTERNAL means that
      this will be used for Internal Network Load Balancing (TCP, UDP). The
      value of EXTERNAL means that this will be used for External Load
      Balancing (HTTP(S) LB, External TCP/UDP LB, SSL Proxy)
    DOC
    newvalue(:INTERNAL)
    newvalue(:EXTERNAL)
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc <<-DOC
      Name of the resource; provided by the client when the resource is
      created. The name must be 1-63 characters long, and comply with RFC1035.
      Specifically, the name must be 1-63 characters long and match the regular
      expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character
      must be a lowercase letter, and all following characters must be a dash,
      lowercase letter, or digit, except the last character, which cannot be a
      dash.
    DOC
  end

  newproperty(:network, parent: Google::Compute::Property::NetwoSelfLinkRef) do
    desc 'A reference to Network resource'
  end

  newproperty(:port_range, parent: Google::Compute::Property::String) do
    desc <<-DOC
      This field is used along with the target field for TargetHttpProxy,
      TargetHttpsProxy, TargetSslProxy, TargetTcpProxy, TargetVpnGateway,
      TargetPool, TargetInstance. Applicable only when IPProtocol is TCP, UDP,
      or SCTP, only packets addressed to ports in the specified range will be
      forwarded to target. Forwarding rules with the same [IPAddress,
      IPProtocol] pair must have disjoint port ranges. Some types of forwarding
      target have constraints on the acceptable ports: * TargetHttpProxy: 80,
      8080 * TargetHttpsProxy: 443 * TargetTcpProxy: 25, 43, 110, 143, 195,
      443, 465, 587, 700, 993, 995,          1883, 5222 * TargetSslProxy: 25,
      43, 110, 143, 195, 443, 465, 587, 700, 993, 995,          1883, 5222 *
      TargetVpnGateway: 500, 4500
    DOC
  end

  newproperty(:ports, parent: Google::Compute::Property::StringArray) do
    desc <<-DOC
      This field is used along with the backend_service field for internal load
      balancing. When the load balancing scheme is INTERNAL, a single port or a
      comma separated list of ports can be configured. Only packets addressed
      to these ports will be forwarded to the backends configured with this
      forwarding rule. You may specify a maximum of up to 5 ports.
    DOC
  end

  newproperty(:subnetwork,
              parent: Google::Compute::Property::SubneSelfLinkRef) do
    desc 'A reference to Subnetwork resource'
  end

  newproperty(:region, parent: Google::Compute::Property::RegionNameRef) do
    desc 'A reference to Region resource (output only)'
  end

  newproperty(:target, parent: Google::Compute::Property::String) do
    desc <<-DOC
      This target must be a global load balancing resource. The forwarded
      traffic must be of a type appropriate to the target object. Valid types:
      HTTP_PROXY, HTTPS_PROXY, SSL_PROXY, TCP_PROXY
    DOC
  end
end

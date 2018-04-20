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

# Defines a credential to be used when communicating with Google Cloud
# Platform. The title of this credential is then used as the 'credential'
# parameter in the gdns_managed_zone type.
#
# For more information on the gauth_credential parameters and providers please
# refer to its detailed documentation at:
#
#   https://forge.puppet.com/google/gauth
#
# For the sake of this example we set the parameter 'path' to point to the file
# that contains your credential in JSON format. And for convenience this example
# allows a variable named $cred_path to be provided to it. If running from the
# command line you can pass it via Facter:
#
#   FACTER_cred_path=/path/to/my/cred.json \
#       puppet apply examples/target_ssl_proxy.pp
#
# For convenience you optionally can add it to your ~/.bash_profile (or the
# respective .profile settings) environment:
#
#   export FACTER_cred_path=/path/to/my/cred.json
#
gauth_credential { 'mycred':
  path     => $cred_path, # e.g. '/home/nelsonjr/my_account.json'
  provider => serviceaccount,
  scopes   => [
    'https://www.googleapis.com/auth/compute',
  ],
}

gcompute_zone { 'us-central1-a':
  project    => 'google.com:graphite-playground',
  credential => 'mycred',
}

gcompute_instance_group { 'my-puppet-masters':
  ensure     => present,
  zone       => 'us-central1-a',
  project    => 'google.com:graphite-playground',
  credential => 'mycred',
}

gcompute_backend_service { 'my-ssl-backend':
  ensure        => present,
  backends      => [
    { group => 'my-puppet-masters' },
  ],
  health_checks => [
    gcompute_health_check_ref('another-hc', 'google.com:graphite-playground'),
  ],
  protocol      => 'SSL',
  project       => 'google.com:graphite-playground',
  credential    => 'mycred',
}

# *******
# WARNING: This manifest is for example purposes only. It is *not* advisable to
# have the key embedded like this because if you check this file into source
# control you are publishing the private key to whomever can access the source
# code. Instead you should protect the key, and for example, use the file()
# function to read it from disk without writing it verbatim to the manifest:
#
# gcompute_ssl_certificate { ...
#   ...
#   private_key => file('/path/to/my/private/key.pem'),
#   ...
# }
# *******

gcompute_ssl_certificate { 'sample-certificate':
  ensure      => present,
  description => 'A certificate for test purposes only.',
  project     => 'google.com:graphite-playground',
  credential  => 'mycred',
  certificate => '-----BEGIN CERTIFICATE-----
MIICqjCCAk+gAwIBAgIJAIuJ+0352Kq4MAoGCCqGSM49BAMCMIGwMQswCQYDVQQG
EwJVUzETMBEGA1UECAwKV2FzaGluZ3RvbjERMA8GA1UEBwwIS2lya2xhbmQxFTAT
BgNVBAoMDEdvb2dsZSwgSW5jLjEeMBwGA1UECwwVR29vZ2xlIENsb3VkIFBsYXRm
b3JtMR8wHQYDVQQDDBZ3d3cubXktc2VjdXJlLXNpdGUuY29tMSEwHwYJKoZIhvcN
AQkBFhJuZWxzb25hQGdvb2dsZS5jb20wHhcNMTcwNjI4MDQ1NjI2WhcNMjcwNjI2
MDQ1NjI2WjCBsDELMAkGA1UEBhMCVVMxEzARBgNVBAgMCldhc2hpbmd0b24xETAP
BgNVBAcMCEtpcmtsYW5kMRUwEwYDVQQKDAxHb29nbGUsIEluYy4xHjAcBgNVBAsM
FUdvb2dsZSBDbG91ZCBQbGF0Zm9ybTEfMB0GA1UEAwwWd3d3Lm15LXNlY3VyZS1z
aXRlLmNvbTEhMB8GCSqGSIb3DQEJARYSbmVsc29uYUBnb29nbGUuY29tMFkwEwYH
KoZIzj0CAQYIKoZIzj0DAQcDQgAEHGzpcRJ4XzfBJCCPMQeXQpTXwlblimODQCuQ
4mzkzTv0dXyB750fOGN02HtkpBOZzzvUARTR10JQoSe2/5PIwaNQME4wHQYDVR0O
BBYEFKIQC3A2SDpxcdfn0YLKineDNq/BMB8GA1UdIwQYMBaAFKIQC3A2SDpxcdfn
0YLKineDNq/BMAwGA1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSQAwRgIhALs4vy+O
M3jcqgA4fSW/oKw6UJxp+M6a+nGMX+UJR3YgAiEAvvl39QRVAiv84hdoCuyON0lJ
zqGNhIPGq2ULqXKK8BY=
-----END CERTIFICATE-----',
  private_key => '-----BEGIN EC PRIVATE KEY-----
MHcCAQEEIObtRo8tkUqoMjeHhsOh2ouPpXCgBcP+EDxZCB/tws15oAoGCCqGSM49
AwEHoUQDQgAEHGzpcRJ4XzfBJCCPMQeXQpTXwlblimODQCuQ4mzkzTv0dXyB750f
OGN02HtkpBOZzzvUARTR10JQoSe2/5PIwQ==
-----END EC PRIVATE KEY-----',
}

gcompute_target_ssl_proxy { 'my-ssl-proxy':
  ensure           => present,
  proxy_header     => 'PROXY_V1',
  service          => 'my-ssl-backend',
  ssl_certificates => [
    'sample-certificate',
  ],
  project          => 'google.com:graphite-playground',
  credential       => 'mycred',
}

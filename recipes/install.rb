#
# Cookbook:: netbeans
# Recipe:: install
#
# Copyright:: 2018, Nghiem Ba Hieu
#
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

if node['netbeans']['jee']['checksum'].nil?
  raise "'netbeans jee checksum' was not set."
end

unless %w[8.1 8.2].include?(node['netbeans']['jee']['version'])
  raise 'This cookbook supports version NetBeans 8.1 or 8.2 only'
end

include_recipe 'java'

netbeans_source = node['netbeans']['jee']['source']
netbeans_checksum = node['netbeans']['jee']['checksum']
chef_cache_path = Chef::Config[:file_cache_path]
state_path = ::File.join(chef_cache_path, 'state.xml')

template state_path do
  source 'state.xml.erb'
  variables({
            })
end

netbeans_package_name = "NetBeans IDE #{node['netbeans']['jee']['version']}"
netbeans_install_options = "--silent --state #{state_path}"

windows_package netbeans_package_name do
  source netbeans_source
  checksum netbeans_checksum
  action :install
  installer_type :custom
  options netbeans_install_options
end

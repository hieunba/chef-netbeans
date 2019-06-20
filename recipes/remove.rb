#
# Cookbook:: netbeans
# Recipe:: remove
#
# Copyright:: 2019, Nghiem Ba Hieu
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

jdk_package_name = 'Java SE Development Kit 8 Update 181 (64-bit)'
jre_package_name = 'Java 8 Update 181 (64-bit)'

netbeans_version = node['netbeans']['jee']['version']
netbeans_package_name = "NetBeans IDE #{netbeans_version}"

windows_package netbeans_package_name do
  installer_type :custom
  options '--silent'
  action :remove
end

glassfish_package_name = 'GlassFish Server Open Source Edition 4.1.1'

windows_package 'uninstall glassfish' do
  package_name glassfish_package_name
  installer_type :custom
  options '--silent'
  action :remove
  notifies :remove, "windows_package[#{jre_package_name}]", :delayed
end

windows_package jdk_package_name do
  action :remove
end

windows_package jre_package_name do
  action :nothing
end

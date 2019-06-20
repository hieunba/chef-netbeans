#
# Cookbook:: netbeans
# Recipe:: force_remove
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

version = node['netbeans']['jee']['version']
netbeans_dir = Chef::Util::PathHelper.join(ENV['PROGRAMFILES'], "NetBeans #{version}")
netbeans_user_dir = Chef::Util::PathHelper.join(ENV['APPDATA'], "NetBeans #{version}")
dot_nbi_dir = Chef::Util::PathHelper.join(ENV['USERPROFILE'], '.nbi')

directory netbeans_dir do
  recursive true
  action :delete
  notifies :delete, "directory[#{netbeans_user_dir}]", :immediately
end

directory dot_nbi_dir do
  recursive true
  action :nothing
end

directory netbeans_user_dir do
  recursive true
  action :delete
end

glassfish_dir = Chef::Util::PathHelper.join(ENV['PROGRAMFILES'], 'glassfish-4.1.1')

directory glassfish_dir do
  recursive true
  action :delete
end

file "#{ENV['PROGRAMDATA']}/Microsoft/Windows/Start Menu/Programs/NetBeans/NetBeans IDE #{version}.lnk" do
  action :delete
end

file "#{ENV['SYSTEMDRIVE']}/Users/Public/Desktop/NetBeans IDE #{version}.lnk" do
  action :delete
end

registry_key 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\nbi-nb-base-8.1.0.0.201510222201' do
  recursive true
  action :delete_key
end

registry_key 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\nbi-glassfish-mod-4.1.1.0.1' do
  recursive true
  action :delete_key
end

jdk_package_name = 'Java SE Development Kit 8 Update 181 (64-bit)'
jre_package_name = 'Java 8 Update 181 (64-bit)'

windows_package 'uninstall JDK' do
  package_name jdk_package_name
  action :remove
end

windows_package 'uninstall JRE' do
  package_name jre_package_name
  action :remove
end

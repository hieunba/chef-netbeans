#
# Cookbook:: netbeans
# Recipe:: uninstall
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

dot_nbi_dir = Chef::Util::PathHelper.join(ENV['USERPROFILE'], '.nbi')
dot_nbi_lock_path = Chef::Util::PathHelper.join(dot_nbi_dir, '.nbilock')

if File.exist?(dot_nbi_lock_path)
  warn_msg = "Skip because of NetBeans is still running or lock #{dot_nbi_lock_path} left uncleaned"
  log 'Netbeans uninstall log' do
    message warn_msg
    level :warn
  end
  return 
end

include_recipe 'netbeans::force_remove'

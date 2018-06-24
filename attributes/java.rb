default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'windows'
default['java']['windows']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-windows-x64.exe'
default['java']['windows']['package_name'] = 'jdk1.8.0_172'
default['java']['oracle']['accept_oracle_download_terms'] = true
force_default['java']['java_home'] = ::File.join(ENV['ProgramFiles'] || 'C:\Program Files', 'Java', 'jdk1.8.0_172')

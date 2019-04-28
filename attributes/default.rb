default['netbeans']['jee']['version'] = '8.1'
version = node['netbeans']['jee']['version']
default['netbeans']['jee']['source'] = "http://download.oracle.com/netbeans/#{version}/final/bundles/netbeans-#{version}-javaee-windows.exe"
if node['netbeans']['jee']['version'] == '8.1'
  default['netbeans']['jee']['checksum'] = '0d1e702a8a54d57f95e22d765948b789d4c21865c162051429f5c6931ab85ad4'
end

default['netbeans']['timeout'] = 1500

include_attribute 'netbeans::java'

# Inspec test for recipe netbeans::uninstall

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

return unless os.windows?

program_files_path = powershell('$env:PROGRAMFILES').strip
programdata_path = powershell('$env:PROGRAMDATA').strip
system_drive = powershell('$env:SYSTEMDRIVE').strip

netbeans_bin_dir = File.join(program_files_path, 'NetBeans 8.1', 'bin')
glassfish_bin_dir = File.join(program_files_path, 'glassfish-4.1.1', 'bin')

describe file(netbeans_bin_dir) do
  it { should_not exist }
end

describe file(glassfish_bin_dir) do
  it { should_not exist }
end

describe file("#{programdata_path}/Microsoft/Windows/Start Menu/Programs/NetBeans/NetBeans IDE 8.1.lnk") do
  it { should_not exist }
end

describe file("#{system_drive}/Users/Public/Desktop/NetBeans IDE 8.1.lnk") do
  it { should_not exist }
end

uninstall_reg_key = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'

describe registry_key(uninstall_reg_key).children(/nbi-nb-base-8.1.0/).each { |key|
  describe registry_key(key) do
    it { should_not exist }
  end
}

describe registry_key(uninstall_reg_key).children(/nbi-glassfish-mod-4.1.1/).each { |key|
  describe registry_key(key) do
    it { should_not exist }
  end
}

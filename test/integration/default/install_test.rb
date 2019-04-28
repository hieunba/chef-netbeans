# Inspec test for recipe netbeans::install

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

return unless os.windows?

describe file("C:\\Program Files\\NetBeans 8.1\\bin\\netbeans64.exe") do
  it { should exist }
end

describe file("C:\\Program Files\\NetBeans 8.1\\uninstall.exe") do
  it { should exist }
end

describe file("C:\\Program Files\\glassfish-4.1.1\\glassfish\\lib\\appserv-rt.jar") do
  it { should exist }
end

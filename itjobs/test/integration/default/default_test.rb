# InSpec test for recipe itjobs::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe package('python3.7') do
  it { should be_installed }
  its('version'){ should cmp > '3.7*' }
end

describe package('python-pip') do
  it { should be_installed }
end

describe pip('bs4') do
  it { should be_installed }
end

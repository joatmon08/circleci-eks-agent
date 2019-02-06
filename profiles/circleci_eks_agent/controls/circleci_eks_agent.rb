control 'check aws' do
  impact 1.0
  title 'confirm aws installed'
  desc 'confirm aws installed'
  describe command('aws --version') do
    its('stdout') { should include '1.16.98' }
  end
end

control 'check terraform' do
  impact 1.0
  title 'confirm terraform installed'
  desc 'confirm terraform installed'
  describe command('terraform version') do
    its('stdout') { should include '0.11.11' }
  end
end

control 'check eksctl' do
  impact 1.0
  title 'confirm eksctl installed'
  desc 'confirm eksctl installed'
  describe command('eksctl version') do
    its('stdout') { should include '0.1.19' }
  end
end

control 'check kubectl' do
  impact 1.0
  title 'confirm kubectl installed'
  desc 'confirm kubectl installed'
  describe command('kubectl version') do
    its('stdout') { should include '1.13.3' }
  end
end

control 'check git' do
  impact 1.0
  title 'confirm git installed'
  desc 'confirm git installed'
  describe command('git version') do
    its('stdout') { should include '2.20.1' }
  end
end

control 'check openssl' do
  impact 1.0
  title 'confirm openssl installed'
  desc 'confirm openssl installed'
  describe command('openssl version') do
    its('stdout') { should include '1.1.1a' }
  end
end

control 'check python' do
  impact 1.0
  title 'confirm python installed'
  desc 'confirm python installed'
  describe command('python --version') do
    its('stdout') { should include '3.6.8' }
  end
  describe command('pip --version') do
    its('stdout') { should include '19.0.1' }
  end
  describe command('invoke --version') do
    its('stdout') { should include '1.2.0' }
  end
end

control 'check helm' do
  impact 1.0
  title 'confirm helm installed'
  desc 'confirm helm installed'
  describe command('helm version') do
    its('stdout') { should include '2.12.3' }
  end
end
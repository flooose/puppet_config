task :build_directories do
  puts "Building directories in /etc/ and /var/run/."
  sudo mkdir /etc/puppet
  sudo mkdir /etc/puppet/manifests
  sudo mkdir /var/run/puppet
  sudo mkdir -p /etc/logcheck/ignore.d.server/
end

task :install => [:build_directories] do
  puts "Installing files in their respective /etc/ and directories."
  cp logcheck/ignore.d.server/puppet /etc/logcheck/ignore.d.server/
  cp logrotate.d/puppet /etc/logrotate
  cp puppet/puppet.conf /etc/puppet/puppet.conf
  cp puppet/manifests/site.pp /etc/puppet/manifests/site.pp
  cp init.d/puppet /etc/init.d (perm: 755)
  cp default/puppet /etc/default (perm: 644
end

## Creates the puppet config directory
#directory "etc/puppet/manifests"
#
## Creates the directory for the puppet pid file
#directory "var/run/puppet"
#
#
#rule '.*' => ["var/run/puppet/", "etc/puppet/manifests/"] do
#  echo "something"
#end
# 
##file "tmp/hello.tmp" => "tmp" do
##      sh "echo 'Hello' > 'tmp/hello.tmp'"
##end
#

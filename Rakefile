task :build_directories do |t, arg|
  `sudo mkdir /etc/puppet`
  #sudo mkdir /etc/puppet/manifests
  #sudo mkdir /var/run/puppet
  #sudo mkdir -p /etc/logcheck/ignore.d.server/
end

task :install => [:build_directories, :copy_files, :set_permissions] do
end

task :copy_files do
  puts "Installing files in their respective /etc/ and directories."
  #cp logcheck/ignore.d.server/puppet /etc/logcheck/ignore.d.server/
  #cp logrotate.d/puppet /etc/logrotate
  #cp puppet/puppet.conf /etc/puppet/puppet.conf
  #cp puppet/manifests/site.pp /etc/puppet/manifests/site.pp
  #cp init.d/puppet /etc/init.d (perm: 755)
  #cp default/puppet /etc/default (perm: 644
end

task :set_permissions do
  
end

task :uninstall do
  #rmdir /etc/logcheck/ignore.d.server/puppet
  #rmdir /etc/logrotate/puppet
  #rmdir /etc/puppet/puppet.conf
  #rmdir /etc/puppet/manifests/site.pp
  #rmdir /etc/init.d/puppet
  #rmdir /etc/default/puppet
  `sudo rmdir /etc/puppet`
  #sudo rmdir /etc/puppet/manifests
  #sudo rmdir /var/run/puppet
  #sudo rmdir -p /etc/logcheck/ignore.d.server/
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

task :build_directories do |t|
  puts "mkdir /etc/puppet: success" unless `sudo mkdir /etc/puppet`
  puts "mkdir /etc/puppet/manifests: success" unless `sudo mkdir /etc/puppet/manifests`
  puts "mkdir /etc/puppet: success" unless `sudo mkdir /var/run/puppet`
  puts "mkdir /etc/puppet: success" unless `sudo mkdir -p /etc/logcheck/ignore.d.server/`
end

task :install => [:build_directories, :copy_files, :set_permissions, :add_passwd_entry] do
end

task :copy_files do
  puts "Installing files in their respective /etc/ and directories."
  `sudo cp logcheck/ignore.d.server/puppet /etc/logcheck/ignore.d.server/`
  `sudo cp logrotate.d/puppet /etc/logrotate.d/`
  `sudo cp puppet/puppet.conf /etc/puppet/puppet.conf`
  `sudo cp puppet/manifests/site.pp /etc/puppet/manifests/site.pp`
  `sudo cp init.d/puppet /etc/init.d`
  `sudo cp default/puppet /etc/default`
end

task :set_permissions do
  `sudo chown puppet:puppet /var/run/puppet`
end

task :add_passwd_entry do

end

task :uninstall do
  `sudo rm /etc/logcheck/ignore.d.server/puppet`
  `sudo rm /etc/logrotate.d/puppet`
  `sudo rm /etc/puppet/puppet.conf`
  `sudo rm /etc/puppet/manifests/site.pp`
  `sudo rm /etc/init.d/puppet`
  `sudo rm /etc/default/puppet`
  `sudo rmdir /etc/puppet/manifests`
  `sudo rmdir /etc/puppet`
  `sudo rmdir /var/run/puppet`
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

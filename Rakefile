# TODO:
#- Make variables referencing directories end
#  with a trailing "/" i.e. "etc/" instead of
#  "etc". This is safer because if the system
#  will complain if mistakenly think "file/"
#  is a directory instead of regular file.
      
# Directories that might or do need to be created
pid_dir = "/var/run/puppet"
logcheck_dir = "/etc/logcheck/ignore.d.server/"

# For working with files and directories outside of the repository
etc = "/etc"
initd = "/init.d"
defaultd = "/default"
log_rotate_dir = "/logrotate.d"

puppet_conf = etc + "/puppet"

task :install => [:build_directories, :copy_files, :set_permissions, :add_passwd_entry] do
end

task :build_directories do |t|
  puts "mkdir /etc/puppet: success" unless `sudo mkdir #{pid_dir}`
  puts "mkdir /etc/puppet: success" unless `sudo mkdir -p #{logcheck_dir}`
end

task :copy_files do
  puts "Installing files in their respective /etc/ and directories."
  `sudo cp logcheck/ignore.d.server/puppet #{logcheck_dir}`
  `sudo cp logrotate.d/puppet #{etc + log_rotate_dir}`
  `sudo cp init.d/puppet #{etc + initd}`
  `sudo cp default/puppet #{etc + defaultd}`
end

task :set_permissions do
  `sudo chown puppet:puppet /var/run/puppet`
end

task :add_passwd_entry do

end

task :uninstall do
  `sudo rm #{logcheck_dir + "puppet"}`
  `sudo rm #{etc + log_rotate_dir + "/puppet"}`
  `sudo rm #{etc + initd + "/puppet"}`
  `sudo rm #{etc + defaultd + "/puppet"}`
end

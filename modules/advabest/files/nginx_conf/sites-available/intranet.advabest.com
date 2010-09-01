# For basic auth of SAAS sites. In this case, it configures the intranet.
server {
	server_name 		intranet.advabest.com;
	access_log  		/home/application/projects/adva_business/production/shared/log/nginx_access.log;
	root		        /home/application/projects/adva_business/production/shared/dummy_app/public;
	index        		index.html index.htm;
	auth_basic            	"Production";
	auth_basic_user_file  	staging.sk.htpasswd;

	# passenger stuff
	passenger_enabled   on;
	rails_env           production;
	rails_spawn_method smart-lv2;
	rails_framework_spawner_idle_time 1800;
	rails_app_spawner_idle_time 600;

	# For the app maintenance
	if (-f $document_root/system/maintenance.html) {
	  rewrite ^(.*)$ /system/maintenance.html break;
	  return 503;
	}
}

set :stage, :production

server "80.240.133.9", user: "typework", roles: %w{web app db}
set :branch, "jd-cap-setup"
set :nginx_server_name, "80.240.133.9"

set :nginx_use_spdy, false
set :nginx_ssl_certificate, ""
set :nginx_ssl_certificate_key, ""

set :nginx_enable_pagespeed, true
set :nginx_pagespeed_enabled_filters, "lazyload_images"

set :unicorn_workers, 2

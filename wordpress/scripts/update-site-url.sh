#!/bin/bash

#Update site urls in the database
public_ip=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
mysql -Bse "UPDATE wordpress.wp_options SET option_value='http://$public_ip' where option_name='siteurl'"
mysql -Bse "UPDATE wordpress.wp_options SET option_value='http://$public_ip' where option_name='home'"

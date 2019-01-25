# IPBX - Asterisk Extract Stats
Application to extract stats from Asterisk
This is application running together with FreePBX 14 + Asterisk 14

Need running multiple PHP versions on this server. [Read more](http://wiki.fksapiens.com.br/index.php?title=PHP/Introducao#Apache_com_PHP_M.C3.BAltiplas_vers.C3.B5es)

# Install 
```
cd /opt
git clone https://github.com/franklinfarias/ipbx.git
chown -R asterisk. /opt/ipbx
cat > /etc/httpd/conf.d/vhost.conf << EOF
<VirtualHost *:80>
    ServerAdmin franklin@fksapiens.com.br
    DocumentRoot "/var/www/html"
    ServerName localhost
    ErrorLog "logs/httpd/localhost-error_log"
    CustomLog "logs/httpd/localhost-access_log" common
</VirtualHost>
<VirtualHost *:80>
     ServerName ipbx.intra
     ServerAdmin franklin@fksapiens.com.br
     DocumentRoot "/opt/ipbx/public"
     ErrorLog "logs/ipbx-error_log"
     CustomLog "logs/ipbx-access_log" common
     <Directory "/opt/ipbx/public/">
          Options Indexes FollowSymLinks MultiViews
          AllowOverride All
          Require all granted
     </Directory>
</VirtualHost>
EOF
echo "AddHandler php72-fcgi .php" > /opt/ipbx/public/.htaccess
```

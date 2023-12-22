#! /bin/bash

echo "Bootstraping google_compute_instance_script"

apt update
apt -y install apache2
cat <<EOF > /var/www/html/index.html
<html><body><h1>Hello Google Compute Engine!</h1>
<p>This page was created from a startup script.</p>
</body></html>
EOF

echo "Bootstrapping complete"
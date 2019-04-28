systemctl stop firewalld
setenforce 0
yum install yum-utils -y
cat <<-EOF
1稳定版
2.最新版
3.旧版本
EOF
read -p "请选择要安装的版本" num
#i= `int($num)`
case "$num" in
1)
	echo '[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkeey=https://nginx.org/keys/nginx_signing.key
' > /etc/yum.repos.d/nginx.repo
	yum makecache
	;;
2)
	echo '[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
' > /etc/yum.repos.d/nginx.repo
	yum makecache
	;;
3)
	;;
*)
	exit
	;;
esac
    yum -y install nginx

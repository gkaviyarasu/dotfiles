#/bin/sh
CURRENT_DIR=${PWD##*/};
TOMCAT_DIR=~/apache-tomcat-7.0.62
TOMCAT_WEB_DIR=$TOMCAT_DIR/webapps
TOMCAT_LOG_DIR=$TOMCAT_DIR/logs

#Remove already deployed contents
RM_WEB_CMD=$TOMCAT_WEB_DIR'/'$CURRENT_DIR'*'
for f in $RM_WEB_CMD; do
	`rm -r $RM_WEB_CMD`
	break
done
#Copy war file to tomcat web dir
WARLOC=$CURRENT_DIR'-host/target/'$CURRENT_DIR'.war'
if [ -r $WARLOC ] 
then
	`cp $WARLOC $TOMCAT_WEB_DIR`
fi

if [ "$1" = "start" ]
then
	#Set the environment properly so that the kareo envs will not affect the tomcat
	#source ~/scripts/setlearningenv.sh
	#Remove logs
	RM_LOG_CMD=$TOMCAT_LOG_DIR'/*'
	`rm -r $RM_LOG_CMD`
	#Start JPDA apache
	`$TOMCAT_DIR/bin/catalina.sh jpda run`
else
	#do invoke the url so that it will deploy
	while true
	do
		sleep 5
		url='http://localhost:8080/'$CURRENT_DIR
   		`wget -q --delete-after $url`
   		if [ "$?" = "0" ] 
   		then
   			break
   		fi
	done
fi

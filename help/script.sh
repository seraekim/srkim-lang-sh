#chmod +x script.sh
#sh -n script.sh
echo $SHELL

# chmod sh files
find . -name "*.sh" -exec chmod 0755 {} \;

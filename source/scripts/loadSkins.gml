///loadSkins()
i=0
skinDir=global.datadir+"skins\"
for (file=file_find_first(skinDir+"*",fa_directory);file!="";file=file_find_next()) {
    if (directory_exists(skinDir+file) and file!="." and file!="..") {
        folders[i]=skinDir+file+"\"
        i+=1
    }
}
file_find_close()
savedatap("skinCount",i)
if (savedatap("textureSkin") > savedatap("skinCount",i)) savedatap("textureSkin",0)

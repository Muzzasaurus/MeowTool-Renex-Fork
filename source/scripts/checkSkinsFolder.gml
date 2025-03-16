///checkSkinsFolder(file)
file=argument0
check=objSkinManager.folders[savedatap("textureSkin")] + file + ".png"
if (file_exists(check)) {
    return check
} else {
    return ""
}

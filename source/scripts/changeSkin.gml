///changeSkin(increment)
inc=argument0

//remove previous skins
if (bg != noone) {
    background_delete(bg)
    bg=noone
}
//update skin num
savedatap("textureSkin",modwrap(savedata("textureSkin")+inc,0,savedata("skinCount")))

//replace background
bgDir = checkSkinsFolder("bg")
if (bgDir != "") {
    bg=background_add(bgDir,false,false)
    background_index[0]=bg
}

//replace sprites
updateSprite(sprBlock,"block",0,0)
updateSprite(sprMiniBlock,"miniBlock",0,0)
updateSprite(sprCherry,"cherry",10,12,"apple")
updateSprite(sprSaveHard,"save",0,0)
updateSprite(sprDynamicPlatform,"platform",0,0)
updateSprite(sprUpPlatform,"sidewaysPlatform",0,0)
updateSprite(sprOneTimePlatform,"oneTimePlatform",0,0)
updateSprite(sprGravFlip,"gravFlip",0,0)
updateSprite(sprGravNormal,"gravNormal",0,0)
updateSprite(sprKillBlock,"killBlock",0,0,"killerBlock")
updateSprite(sprSpike,"spikeDown",0,0)
updateSprite(sprSpikeLeft,"spikeLeft",0,0)
updateSprite(sprSpikeRight,"spikeRight",0,0)
updateSprite(sprSpikeUp,"spikeUp",0,0)
updateSprite(sprMiniSpikeDown,"miniSpikeDown",0,0,"minidown")
updateSprite(sprMiniSpikeLeft,"miniSpikeLeft",0,0,"minileft")
updateSprite(sprMiniSpikeRight,"miniSpikeRight",0,0,"miniright")
updateSprite(sprMiniSpikeUp,"miniSpikeUp",0,0,"miniup")
updateSprite(sprJumpRefresher,"jumpRefresher",6,6)
updateSprite(sprPlayerStart,"playerStart",0,0)
updateSprite(sprWarpTransparent,"warp",0,0)
updateSprite(sprWater1,"water1",0,0)
updateSprite(sprWater2,"water2",0,0)
updateSprite(sprWater3,"water3",0,0)
updateSprite(sprCatharsisWater,"catharsisWater",0,0,"catharsis")
updateSprite(sprNekoronAir,"nekoronAir",0,0,"nekoron")
updateSprite(sprUpdraftWater,"updraftWater",0,0,"updraft")
updateSprite(sprVegetable,"glitchyWater",0,0,"mountainDew")
updateSprite(sprWallJumpL,"vineL",0,0,"walljumpL")
updateSprite(sprWallJumpR,"vineR",0,0,"walljumpR")
updateSprite(sprHighSpeedField,"highSpeedField",0,0)
updateSprite(sprJetRight,"slowSpeedField",0,0)
updateSprite(sprHighGravField,"highGravField",0,0)
updateSprite(sprLowGravField,"lowGravField",0,0)
updateSprite(sprZeroG,"zeroGravField",0,0)
updateSprite(StarSingleJump,"blackStar",0,0,"singleJump")
updateSprite(StarDoubleJump,"greyStar",0,0,"doubleJump")
updateSprite(StarTripleJump,"yellowStar",0,0,"tripleJump")
updateSprite(sprShootkidEnabler,"shootkidEnable",0,0)
updateSprite(sprShootkidDisabler,"shootkidDisable",0,0)
updateSprite(sprDotter,"dotkidEnable",0,0)
updateSprite(sprUndotter,"dotkidDisable",0,0)
updateSprite(sprVCoinA,"vCoin",0,0)
updateSprite(sprVCoinB,"kidCoin",0,0)
updateSprite(sprGravPlatformBoth,"gravPlatformBoth",0,0)
updateSprite(sprGravPlatformDown,"gravPlatformDown",0,0)
updateSprite(sprGravPlatformUp,"gravPlatformUp",0,0)
updateSprite(sprHashigo_tate,"ladder",0,0)
updateSprite(sprHashigo_yoko,"ladderSide",0,0)
updateSprite(sprKidBlockDown,"kidBlockDown",0,0)
updateSprite(sprKidBlockUp,"kidBlockUp",0,0)
updateSprite(sprSlopeBL,"slopeBL",0,0)
updateSprite(sprSlopeBR,"slopeBR",0,0)
updateSprite(sprSlopeTL,"slopeTL",0,0)
updateSprite(sprSlopeTR,"slopeTR",0,0)
updateSprite(sprLucsterBubble,"lucsterBubble",15,15,"bubble")
updateSprite(sprSidebar,"sidebar",0,0)
updateSprite(sprMenu,"menu",0,0)

//show_message("Skin " + objSkinManager.folders[savedatap("textureSkin")] + " loaded!")

with (objSelectable) {
    switch (tag) {
        case 1: objIndex=PlayerStart break
        case 2: objIndex=SavePointHard break
        case 3: objIndex=SavePointFlip break
        case 4: objIndex=BulletBlock break
        case 5: objIndex=FakeWarp break

        case 7: objIndex=Block break
        case 8: objIndex=MiniBlock break
        case 9: objIndex=SlipBlock break
        case 10: objIndex=Water1 break
        case 11: objIndex=Water2 break
        case 12: objIndex=Water3 break
        case 13: objIndex=SpikeU break
        case 14: objIndex=SpikeD break
        case 15: objIndex=SpikeL break
        case 16: objIndex=SpikeR break
        case 17: objIndex=Cherry break
        case 18: objIndex=KillBlock break
        case 19: objIndex=MiniSpikeUp break
        case 20: objIndex=MiniSpikeDown break
        case 21: objIndex=MiniSpikeLeft break
        case 22: objIndex=MiniSpikeRight break
        case 23: objIndex=Platform break
        case 24: objIndex=SidewaysPlatform break
        case 25: objIndex=GravFlip break
        case 26: objIndex=GravNormal break
        case 27: objIndex=JumpRefresher break
        case 28: objIndex=WallJumpL break
        case 29: objIndex=WallJumpR break
        case 30: objIndex=OneTimePlatform break
        case 31: objIndex=CatharsisWater break
        case 32: objIndex=NekoronAir break
        case 33: objIndex=UpdraftWater break
        case 34: objIndex=WaterNoJump break
        case 35: objIndex=ShootRefresherL break
        case 36: objIndex=ShootRefresherR break
        case 37: objIndex=LowGravField break
        case 38: objIndex=HighGravField break
        case 39: objIndex=LowSpeedField break
        case 40: objIndex=HighSpeedField break
        case 41: objIndex=ZeroGravField break

        case 43: objIndex=StarSingleJump break
        case 44: objIndex=StarDoubleJump break
        case 45: objIndex=StarTripleJump break

        case 49: objIndex=ShootkidEnable break
        case 50: objIndex=ShootkidDisable break
        case 51: objIndex=DotkidEnable break
        case 52: objIndex=DotkidDisable break
        case 53: objIndex=VCoinGive break
        case 54: objIndex=VCoinTake break
        case 55: objIndex=GravPlatformBoth break
        case 56: objIndex=GravPlatformDown break
        case 57: objIndex=GravPlatformUp break

        case 61: objIndex=Ladder break
        case 62: objIndex=LadderSide break

        case 67: objIndex=KidBlockUp break
        case 68: objIndex=KidBlockDown break

        case 73: objIndex=SlopeBR break
        case 74: objIndex=SlopeBL break
        case 75: objIndex=SlopeTR break
        case 76: objIndex=SlopeTL break

        case 79: objIndex=LucsterBubble break

        default: instance_destroy() break
    }
}

state("Project64") {
	uint tmrJP    : "Project64.exe", 0xD6A1C, 0x32C694;
	uint animJP   : "Project64.exe", 0xD6A1C, 0x339E0C;
	byte stageJP  : "Project64.exe", 0xD6A1C, 0x32CE9A;
	ushort camJP  : "Project64.exe", 0xD6A1C, 0x3314FA;
	byte warpJP   : "Project64.exe", 0xD6A1C, 0x339EDA;
	ushort starJP : "Project64.exe", 0xD6A1C, 0x339EA8;
}

init { 
	vars.splitBitdwEntered = false;
	vars.splitKey1Grabbed  = false;
	vars.splitStar4        = false;
	vars.splitStar7        = false;
	vars.splitStar11       = false;
	vars.splitStar15       = false;
	vars.splitWhirlpool    = false;
	vars.gotDddStar        = false;
	vars.splitDddFade      = false;
	vars.splitKey2Grabbed  = false;
	vars.splitBitsEntered  = false;
}

onStart {
	vars.splitBitdwEntered = false;
	vars.splitKey1Grabbed  = false;
	vars.splitStar4        = false;
	vars.splitStar7        = false;
	vars.splitStar11       = false;
	vars.splitStar15       = false;
	vars.splitWhirlpool    = false;
	vars.gotDddStar        = false;
	vars.splitDddFade      = false;
	vars.splitKey2Grabbed  = false;
	vars.splitBitsEntered  = false;
}

update {
	vars.currTmr   = current.tmrJP;
	vars.oldTmr    = old.tmrJP;
	vars.currAnm   = current.animJP;
	vars.oldAnm    = old.animJP;
	vars.currStage = current.stageJP;
	vars.oldStage  = old.stageJP;
	vars.currCam   = current.camJP;
	vars.oldCam    = old.camJP;
	vars.currWarp  = current.warpJP;
	vars.currStar  = current.starJP;
	vars.oldStar   = old.starJP;

	if (vars.currStage == 23 && vars.currStar > vars.oldStar) {
		vars.gotDddStar = true;
	}
}

start {
	return vars.currTmr == 4;
}

split {
	bool isCourseFade = (vars.oldStage != 6 && vars.currStage == 6 && vars.oldStage != 30 && vars.oldStage != 33 && vars.oldStage != 23);

	if (!vars.splitBitdwEntered && vars.oldStage != 17 && vars.currStage == 17) {
		vars.splitBitdwEntered = true; return true;
	}
	else if (!vars.splitKey1Grabbed && vars.currStar >= 1 && vars.oldStage == 30 && vars.currStage == 6) {
		vars.splitKey1Grabbed = true; return true;
	}
	else if (!vars.splitStar4 && vars.currStar >= 4 && isCourseFade) {
		vars.splitStar4 = true; return true;
	}
	else if (!vars.splitStar7 && vars.currStar >= 7 && isCourseFade) {
		vars.splitStar7 = true; return true;
	}
	else if (!vars.splitStar11 && vars.currStar >= 11 && isCourseFade) {
		vars.splitStar11 = true; return true;
	}
	else if (!vars.splitStar15 && vars.currStar >= 15 && isCourseFade) {
		vars.splitStar15 = true; return true;
	}
	else if (!vars.splitWhirlpool && vars.currStage == 6 && vars.oldCam != vars.currCam && (vars.currCam == 0x4 || vars.currCam == 0xC) && (vars.currWarp == 23 || vars.currWarp == 19)) {
		vars.splitWhirlpool = true; return true;
	}
	else if (!vars.splitDddFade && vars.gotDddStar && vars.oldStage == 23 && vars.currStage == 6) {
		vars.splitDddFade = true; return true;
	}
	else if (!vars.splitKey2Grabbed && vars.oldStage == 33 && vars.currStage == 6) {
		vars.splitKey2Grabbed = true; return true;
	}
	else if (!vars.splitBitsEntered && vars.oldStage != 21 && vars.currStage == 21) {
		vars.splitBitsEntered = true; return true;
	}
	else if (vars.currAnm == 0x1909 && vars.oldAnm != 0x1909) {
		return true;
	}
}

reset {
	return vars.currTmr < vars.oldTmr && vars.currTmr == 0;
}

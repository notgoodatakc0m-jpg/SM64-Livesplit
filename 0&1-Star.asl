state("Project64") {
	uint tmrJP    : "Project64.exe", 0xD6A1C, 0x32C694;
	uint animJP   : "Project64.exe", 0xD6A1C, 0x339E0C;
	byte stageJP  : "Project64.exe", 0xD6A1C, 0x32CE9A;
	ushort camJP  : "Project64.exe", 0xD6A1C, 0x3314FA;
	byte warpJP   : "Project64.exe", 0xD6A1C, 0x339EDA;
	ushort starJP : "Project64.exe", 0xD6A1C, 0x339EA8;
}

init {
	vars.ResetVars = (Action)(() => {
		vars.LBLJ      = false;
		vars.exitBitDW = false;
		vars.DDD       = false;
		vars.subDDD    = false;
		vars.exitDDD   = false;
		vars.BitFS     = false;
		vars.exitBitFS = false;
		vars.BitS      = false;
	});
	vars.ResetVars();
}

onStart {
	vars.ResetVars();
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
		vars.subDDD = true;
	}
}

start {
	return vars.currTmr == 4;
}

split {

	if (!vars.LBLJ && vars.oldStage != 17 && vars.currStage == 17) {
		vars.LBLJ = true; return true;
	}

	if (!vars.exitBitDW && vars.oldStage == 30 && vars.currStage == 6) {
		vars.exitBitDW = true; return true;
	}

	if (!vars.DDD && vars.currStage == 6 && vars.oldCam != vars.currCam && (vars.currCam == 0x4 || vars.currCam == 0xC) && (vars.currWarp == 23 || vars.currWarp == 19)) {
		vars.DDD = true; return true;
    }

    if (!vars.exitDDD && vars.subDDD && vars.oldStage == 23 && vars.currStage == 6) {
		vars.exitDDD = true; return true;
	}

    if (!vars.BitFS && vars.currStar == 0 && vars.oldStage != 19 && vars.currStage == 19) {
		vars.BitFS = true; return true;
	}

	if (!vars.exitBitFS && vars.oldStage == 33 && vars.currStage == 6) {
		vars.exitBitFS = true; return true;
	}

	if (!vars.BitS && vars.oldStage != 21 && vars.currStage == 21) {
		vars.BitS = true; return true;
	}

	if (vars.currAnm == 0x1909 && vars.oldAnm != 0x1909) {
		return true;
	}
}

reset {
	return vars.currTmr < vars.oldTmr && vars.currTmr == 0;
}

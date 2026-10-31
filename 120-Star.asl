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
		vars.isAdvanced   = false;

		vars.star8     = false;
		vars.star9     = false;
		vars.star16    = false;
		vars.star17    = false;
		vars.star19    = false;
		vars.star26    = false;
		vars.star34    = false;
		vars.star36    = false;
		vars.star42    = false;
		vars.star50    = false;
		vars.star52    = false;
		vars.star59    = false;
		vars.star66    = false;
		vars.star68    = false;
		vars.star71    = false;
		vars.star74    = false;
		vars.star81    = false;
		vars.star88    = false;
		vars.star96    = false;
		vars.star103   = false;
		vars.star104   = false;
		vars.star111   = false;
		vars.star119   = false;

		vars.exitBitDW = false;
		vars.exitBitFS = false;
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
}

start {
	return vars.currTmr == 4;
}

split {
	bool isCourseFade = (vars.oldStage != 6 && vars.currStage == 6 && vars.oldStage != 30 && vars.oldStage != 33 && vars.oldStage != 23);

	if (isCourseFade && !vars.star8 && !vars.star9) {
		if (vars.currStar == 8) {
			vars.isAdvanced = true;
		}
	}

	if (vars.isAdvanced && !vars.star8 && vars.currStar >= 8 && isCourseFade) {
		vars.star8 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star9 && vars.currStar >= 9 && isCourseFade) {
		vars.star9 = true; return true;
	}

	if (vars.isAdvanced && !vars.star16 && vars.currStar >= 16 && isCourseFade) {
		vars.star16 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star17 && vars.currStar >= 17 && isCourseFade) {
		vars.star17 = true; return true;
	}

	if (vars.isAdvanced && !vars.star19 && vars.currStar >= 19 && isCourseFade) {
		vars.star19 = true; return true;
	}

	if (!vars.exitBitDW && vars.oldStage == 30 && vars.currStage == 6) {
		vars.exitBitDW = true; return true;
	}

	if (!vars.star26 && vars.currStar >= 26 && isCourseFade) {
		vars.star26 = true; return true;
	}

	if (!vars.star34 && vars.currStar >= 34 && isCourseFade) {
		vars.star34 = true; return true;
	}

	if (!vars.star36 && vars.currStar >= 36 && isCourseFade) {
		vars.star36 = true; return true;
	}

	if (!vars.star42 && vars.currStar >= 42 && isCourseFade) {
		vars.star42 = true; return true;
	}

	if (!vars.star50 && vars.currStar >= 50 && isCourseFade) {
		vars.star50 = true; return true;
	}

	if (!vars.star52 && vars.currStar >= 52 && isCourseFade) {
		vars.star52 = true; return true;
	}

	if (!vars.star59 && vars.currStar >= 59 && isCourseFade) {
		vars.star59 = true; return true;
	}

	if (!vars.star66 && vars.currStar >= 66 && isCourseFade) {
		vars.star66 = true; return true;
	}

	if (!vars.star68 && vars.currStar >= 68 && isCourseFade) {
		vars.star68 = true; return true;
	}

	if (!vars.star71 && vars.currStar >= 71 && isCourseFade) {
		vars.star71 = true; return true;
	}

	if (!vars.exitBitFS && vars.oldStage == 33 && vars.currStage == 6) {
		vars.exitBitFS = true; return true;
	}

	if (!vars.star74 && vars.currStar >= 74 && vars.currStage == 6 && vars.oldCam != vars.currCam && (vars.currCam == 0x4 || vars.currCam == 0xC) && (vars.currWarp == 23 || vars.currWarp == 19)) {
		vars.star74 = true; return true;
	}

	if (!vars.star81 && vars.currStar >= 81 && isCourseFade) {
		vars.star81 = true; return true;
	}

	if (!vars.star88 && vars.currStar >= 88 && isCourseFade) {
		vars.star88 = true; return true;
	}

	if (!vars.star96 && vars.currStar >= 96 && isCourseFade) {
		vars.star96 = true; return true;
	}

	if (!vars.star103 && vars.currStar >= 103 && isCourseFade) {
		vars.star103 = true; return true;
	}

	if (!vars.star104 && vars.currStar >= 104 && isCourseFade) {
		vars.star104 = true; return true;
	}

	if (!vars.star111 && vars.currStar >= 111 && isCourseFade) {
		vars.star111 = true; return true;
	}

	if (!vars.star119 && vars.currStar >= 119 && isCourseFade) {
		vars.star119 = true; return true;
	}

	if (vars.currAnm == 0x1909 && vars.oldAnm != 0x1909) {
		return true;
	}
}

reset {
	return vars.currTmr < vars.oldTmr && vars.currTmr == 0;
}

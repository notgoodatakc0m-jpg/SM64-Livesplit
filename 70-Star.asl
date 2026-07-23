state("Project64") {
	uint tmrUS    : "Project64.exe", 0xD6A1C, 0x32D5D4;
	uint animUS   : "Project64.exe", 0xD6A1C, 0x33B17C;
	byte stageUS  : "Project64.exe", 0xD6A1C, 0x32DDFA;
	ushort starUS : "Project64.exe", 0xD6A1C, 0x33B218;
}

init { 
	vars.isAdvanced       = false;

	vars.splitStar3       = false;
	vars.splitStar9       = false;
	vars.splitStar10      = false;
	vars.splitStar12_WC   = false;
	vars.splitKey1Grabbed = false;
	vars.splitStar17      = false;
	vars.splitStar18      = false;
	vars.splitStar19      = false;
	vars.splitStar20      = false;
	vars.splitStar24      = false;
	vars.splitStar30      = false;
	vars.splitStar33      = false;
	vars.splitStar35      = false;
	vars.splitStar38      = false;
	vars.splitKey2Grabbed = false;
	vars.splitStar39      = false;
	vars.splitStar42      = false;
	vars.splitStar44      = false;
	vars.splitStar47      = false;
	vars.splitStar48      = false;
	vars.splitStar52      = false;
	vars.splitStar53      = false;
	vars.splitStar58      = false;
	vars.splitStar62      = false;
	vars.splitStar69      = false;
	vars.splitStar70      = false;
}

onStart {
	vars.isAdvanced       = false;

	vars.splitStar3       = false;
	vars.splitStar9       = false;
	vars.splitStar10      = false;
	vars.splitStar12_WC   = false;
	vars.splitKey1Grabbed = false;
	vars.splitStar17      = false;
	vars.splitStar18      = false;
	vars.splitStar19      = false;
	vars.splitStar20      = false;
	vars.splitStar24      = false;
	vars.splitStar30      = false;
	vars.splitStar33      = false;
	vars.splitStar35      = false;
	vars.splitStar38      = false;
	vars.splitKey2Grabbed = false;
	vars.splitStar39      = false;
	vars.splitStar42      = false;
	vars.splitStar44      = false;
	vars.splitStar47      = false;
	vars.splitStar48      = false;
	vars.splitStar52      = false;
	vars.splitStar53      = false;
	vars.splitStar58      = false;
	vars.splitStar62      = false;
	vars.splitStar69      = false;
	vars.splitStar70      = false;
}

update {
	vars.currTmr   = current.tmrUS;
	vars.oldTmr    = old.tmrUS;
	vars.currAnm   = current.animUS;
	vars.oldAnm    = old.animUS;
	vars.currStage = current.stageUS;
	vars.oldStage  = old.stageUS;
	vars.currStar  = current.starUS;
	vars.oldStar   = old.starUS;
}

start { 
	return vars.currTmr == 4; 
}

split {
	bool isCourseFade = (vars.oldStage != 6 && vars.currStage == 6 && vars.oldStage != 26 && vars.oldStage != 30 && vars.oldStage != 33);
	bool CastleCourtyardFade = (vars.oldStage == 4 && vars.currStage == 26);

	if (isCourseFade && !vars.splitStar3 && !vars.splitStar9) {
		if (vars.currStar < 9) {
			vars.isAdvanced = true;
		}
	}

	if (vars.isAdvanced) {
		if (!vars.splitStar3 && vars.currStar >= 3 && isCourseFade) {
			vars.splitStar3 = true; return true;
		}
		else if (!vars.splitStar10 && vars.currStar >= 10 && isCourseFade) {
			vars.splitStar10 = true; return true;
		}
		else if (!vars.splitStar12_WC && vars.currStar >= 12 && isCourseFade) {
			vars.splitStar12_WC = true; return true;
		}
		else if (!vars.splitKey1Grabbed && vars.oldStage == 30 && vars.currStage == 6) {
			vars.splitKey1Grabbed = true; return true;
		}
		else if (!vars.splitStar17 && vars.currStar >= 17 && isCourseFade) {
			vars.splitStar17 = true; return true;
		}
		else if (!vars.splitStar19 && vars.currStar >= 19 && CastleCourtyardFade) {
			vars.splitStar19 = true; return true;
		}
		else if (!vars.splitStar24 && vars.currStar >= 24 && isCourseFade) {
			vars.splitStar24 = true; return true;
		}
		else if (!vars.splitStar30 && vars.currStar >= 30 && isCourseFade) {
			vars.splitStar30 = true; return true;
		}
		else if (!vars.splitStar33 && vars.currStar >= 33 && isCourseFade) {
			vars.splitStar33 = true; return true;
		}
		else if (!vars.splitKey2Grabbed && vars.oldStage == 33 && vars.currStage == 6) {
			vars.splitKey2Grabbed = true; return true;
		}
		else if (!vars.splitStar39 && vars.currStar >= 39 && isCourseFade) {
			vars.splitStar39 = true; return true;
		}
		else if (!vars.splitStar42 && vars.currStar >= 42 && isCourseFade) {
			vars.splitStar42 = true; return true;
		}
		else if (!vars.splitStar48 && vars.currStar >= 48 && isCourseFade) {
			vars.splitStar48 = true; return true;
		}
		else if (!vars.splitStar52 && vars.currStar >= 52 && isCourseFade) {
			vars.splitStar52 = true; return true;
		}
		else if (!vars.splitStar58 && vars.currStar >= 58 && isCourseFade) {
			vars.splitStar58 = true; return true;
		}
		else if (!vars.splitStar62 && vars.currStar >= 62 && isCourseFade) {
			vars.splitStar62 = true; return true;
		}
		else if (!vars.splitStar69 && vars.currStar >= 69 && isCourseFade) {
			vars.splitStar69 = true; return true;
		}
		else if (vars.currAnm == 0x1909 && vars.oldAnm != 0x1909) {
			return true;
		}
	}
	else {
		if (!vars.splitStar9 && vars.currStar >= 9 && isCourseFade) {
			vars.splitStar9 = true; return true;
		}
		else if (!vars.splitKey1Grabbed && vars.oldStage == 30 && vars.currStage == 6) {
			vars.splitKey1Grabbed = true; return true;
		}
		else if (!vars.splitStar18 && vars.currStar >= 18 && isCourseFade) {
			vars.splitStar18 = true; return true;
		}
		else if (!vars.splitStar20 && vars.currStar >= 20 && CastleCourtyardFade) {
			vars.splitStar20 = true; return true;
		}
		else if (!vars.splitStar24 && vars.currStar >= 24 && isCourseFade) {
			vars.splitStar24 = true; return true;
		}
		else if (!vars.splitStar30 && vars.currStar >= 30 && isCourseFade) {
			vars.splitStar30 = true; return true;
		}
		else if (!vars.splitStar35 && vars.currStar >= 35 && isCourseFade) {
			vars.splitStar35 = true; return true;
		}
		else if (!vars.splitStar38 && vars.currStar >= 38 && isCourseFade) {
			vars.splitStar38 = true; return true;
		}
		else if (!vars.splitKey2Grabbed && vars.oldStage == 33 && vars.currStage == 6) {
			vars.splitKey2Grabbed = true; return true;
		}
		else if (!vars.splitStar44 && vars.currStar >= 44 && isCourseFade) {
			vars.splitStar44 = true; return true;
		}
		else if (!vars.splitStar47 && vars.currStar >= 47 && isCourseFade) {
			vars.splitStar47 = true; return true;
		}
		else if (!vars.splitStar53 && vars.currStar >= 53 && isCourseFade) {
			vars.splitStar53 = true; return true;
		}
		else if (!vars.splitStar58 && vars.currStar >= 58 && isCourseFade) {
			vars.splitStar58 = true; return true;
		}
		else if (!vars.splitStar62 && vars.currStar >= 62 && isCourseFade) {
			vars.splitStar62 = true; return true;
		}
		else if (!vars.splitStar70 && vars.currStar >= 70 && isCourseFade) {
			vars.splitStar70 = true; return true;
		}
		else if (vars.currAnm == 0x1909 && vars.oldAnm != 0x1909) {
			return true;
		}
	}
}

reset { 
	return vars.currTmr < vars.oldTmr && vars.currTmr == 0; 
}

state("Project64") {
	uint tmrUS    : "Project64.exe", 0xD6A1C, 0x32D5D4;
	uint animUS   : "Project64.exe", 0xD6A1C, 0x33B17C;
	byte stageUS  : "Project64.exe", 0xD6A1C, 0x32DDFA;
	ushort starUS : "Project64.exe", 0xD6A1C, 0x33B218;
}

init {
	vars.ResetVars = (Action)(() => {
		vars.isAdvanced   = false;

		vars.star3     = false;
		vars.star9     = false;
		vars.star10    = false;
		vars.star12    = false;
		vars.star17    = false;
		vars.star18    = false;
		vars.star19    = false;
		vars.star20    = false;
		vars.star24    = false;
		vars.star30    = false;
		vars.star33    = false;
		vars.star35    = false;
		vars.star38    = false;
		vars.star39    = false;
		vars.star42    = false;
		vars.star44    = false;
		vars.star47    = false;
		vars.star48    = false;
		vars.star52    = false;
		vars.star53    = false;
		vars.star58    = false;
		vars.star62    = false;
		vars.star69    = false;
		vars.star70    = false;

		vars.exitBitDW = false;
		vars.exitBitFS = false;
	});
	vars.ResetVars();
}

onStart {
	vars.ResetVars();
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

	if (isCourseFade && !vars.star3 && !vars.star9) {
		if (vars.currStar < 9) {
			vars.isAdvanced = true;
		}
	}

	if (vars.isAdvanced && !vars.star3 && vars.currStar >= 3 && isCourseFade) {
		vars.star3 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star9 && vars.currStar >= 9 && isCourseFade) {
		vars.star9 = true; return true;
	}

	if (vars.isAdvanced && !vars.star10 && vars.currStar >= 10 && isCourseFade) {
		vars.star10 = true; return true;
	}

	if (vars.isAdvanced && !vars.star12 && vars.currStar >= 12 && isCourseFade) {
		vars.star12 = true; return true;
	}

	if (!vars.exitBitDW && vars.oldStage == 30 && vars.currStage == 6) {
		vars.exitBitDW = true; return true;
	}

	if (vars.isAdvanced && !vars.star17 && vars.currStar >= 17 && isCourseFade) {
		vars.star17 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star18 && vars.currStar >= 18 && isCourseFade) {
		vars.star18 = true; return true;
	}

	if (vars.isAdvanced && !vars.star19 && vars.currStar >= 19 && CastleCourtyardFade) {
		vars.star19 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star20 && vars.currStar >= 20 && CastleCourtyardFade) {
		vars.star20 = true; return true;
	}

	if (!vars.star24 && vars.currStar >= 24 && isCourseFade) {
		vars.star24 = true; return true;
	}

	if (!vars.star30 && vars.currStar >= 30 && isCourseFade) {
		vars.star30 = true; return true;
	}

	if (vars.isAdvanced && !vars.star33 && vars.currStar >= 33 && isCourseFade) {
		vars.star33 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star35 && vars.currStar >= 35 && isCourseFade) {
		vars.star35 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star38 && vars.currStar >= 38 && isCourseFade) {
		vars.star38 = true; return true;
	}

	if (vars.isAdvanced && !vars.star39 && vars.currStar >= 39 && isCourseFade) {
		vars.star39 = true; return true;
	}

	if (vars.isAdvanced && !vars.star42 && vars.currStar >= 42 && isCourseFade) {
		vars.star42 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star44 && vars.currStar >= 44 && isCourseFade) {
		vars.star44 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star47 && vars.currStar >= 47 && isCourseFade) {
		vars.star47 = true; return true;
	}

	if (vars.isAdvanced && !vars.star48 && vars.currStar >= 48 && isCourseFade) {
		vars.star48 = true; return true;
	}

	if (!vars.exitBitFS && vars.oldStage == 33 && vars.currStage == 6) {
		vars.exitBitFS = true; return true;
	}

	if (vars.isAdvanced && !vars.star52 && vars.currStar >= 52 && isCourseFade) {
		vars.star52 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star53 && vars.currStar >= 53 && isCourseFade) {
		vars.star53 = true; return true;
	}

	if (!vars.star58 && vars.currStar >= 58 && isCourseFade) {
		vars.star58 = true; return true;
	}

	if (!vars.star62 && vars.currStar >= 62 && isCourseFade) {
		vars.star62 = true; return true;
	}

	if (vars.isAdvanced && !vars.star69 && vars.currStar >= 69 && isCourseFade) {
		vars.star69 = true; return true;
	}

	if (!vars.isAdvanced && !vars.star70 && vars.currStar >= 70 && isCourseFade) {
		vars.star70 = true; return true;
	}

	if (vars.currAnm == 0x1909 && vars.oldAnm != 0x1909) {
		return true;
	}
}

reset {
	return vars.currTmr < vars.oldTmr && vars.currTmr == 0;
}

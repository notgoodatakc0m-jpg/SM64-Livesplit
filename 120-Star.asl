state("Project64") {
    uint tmrJP    : "Project64.exe", 0xD6A1C, 0x32C694;
    uint animJP   : "Project64.exe", 0xD6A1C, 0x339E0C;
    byte stageJP  : "Project64.exe", 0xD6A1C, 0x32CE9A;
    ushort camJP  : "Project64.exe", 0xD6A1C, 0x3314FA;
    byte warpJP   : "Project64.exe", 0xD6A1C, 0x339EDA;
    ushort starJP : "Project64.exe", 0xD6A1C, 0x339EA8;
}

init { 
    vars.isAdvanced       = false;

    vars.splitStar8       = false;
    vars.splitStar16      = false;
    vars.splitStar19      = false;

    vars.splitStar9       = false;
    vars.splitStar17      = false;

    vars.splitKey1Grabbed = false;
    vars.splitStar26      = false;
    vars.splitStar34      = false;
    vars.splitStar36      = false;
    vars.splitStar42      = false;
    vars.splitStar50      = false;
    vars.splitStar52      = false;
    vars.splitStar59      = false;
    vars.splitStar66      = false;
    vars.splitStar68      = false;
    vars.splitStar71      = false;
    vars.splitKey2Grabbed = false;
    vars.splitStar74      = false;
    vars.splitStar81      = false;
    vars.splitStar88      = false;
    vars.splitStar96      = false;
    vars.splitStar103     = false;
    vars.splitStar104     = false;
    vars.splitStar111     = false;
    vars.splitStar119     = false;
}

onStart {
    vars.isAdvanced       = false;

    vars.splitStar8       = false;
    vars.splitStar16      = false;
    vars.splitStar19      = false;

    vars.splitStar9       = false;
    vars.splitStar17      = false;

    vars.splitKey1Grabbed = false;
    vars.splitStar26      = false;
    vars.splitStar34      = false;
    vars.splitStar36      = false;
    vars.splitStar42      = false;
    vars.splitStar50      = false;
    vars.splitStar52      = false;
    vars.splitStar59      = false;
    vars.splitStar66      = false;
    vars.splitStar68      = false;
    vars.splitStar71      = false;
    vars.splitKey2Grabbed = false;
    vars.splitStar74      = false;
    vars.splitStar81      = false;
    vars.splitStar88      = false;
    vars.splitStar96      = false;
    vars.splitStar103     = false;
    vars.splitStar104     = false;
    vars.splitStar111     = false;
    vars.splitStar119     = false;
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

    if (isCourseFade && !vars.splitStar8 && !vars.splitStar9) {
        if (vars.currStar == 8) {
            vars.isAdvanced = true;
        }
    }

    if (vars.isAdvanced) {
        if (!vars.splitStar8 && vars.currStar >= 8 && isCourseFade) {
            vars.splitStar8 = true; return true;
        }
        else if (!vars.splitStar16 && vars.currStar >= 16 && isCourseFade) {
            vars.splitStar16 = true; return true;
        }
        else if (!vars.splitStar19 && vars.currStar >= 19 && isCourseFade) {
            vars.splitStar19 = true; return true;
        }
        else if (!vars.splitKey1Grabbed && vars.oldStage == 30 && vars.currStage == 6) {
            vars.splitKey1Grabbed = true; return true;
        }
        else if (!vars.splitStar26 && vars.currStar >= 26 && isCourseFade) {
            vars.splitStar26 = true; return true;
        }
        else if (!vars.splitStar34 && vars.currStar >= 34 && isCourseFade) {
            vars.splitStar34 = true; return true;
        }
        else if (!vars.splitStar36 && vars.currStar >= 36 && isCourseFade) {
            vars.splitStar36 = true; return true;
        }
        else if (!vars.splitStar42 && vars.currStar >= 42 && isCourseFade) {
            vars.splitStar42 = true; return true;
        }
        else if (!vars.splitStar50 && vars.currStar >= 50 && isCourseFade) {
            vars.splitStar50 = true; return true;
        }
        else if (!vars.splitStar52 && vars.currStar >= 52 && isCourseFade) {
            vars.splitStar52 = true; return true;
        }
        else if (!vars.splitStar59 && vars.currStar >= 59 && isCourseFade) {
            vars.splitStar59 = true; return true;
        }
        else if (!vars.splitStar66 && vars.currStar >= 66 && isCourseFade) {
            vars.splitStar66 = true; return true;
        }
        else if (!vars.splitStar68 && vars.currStar >= 68 && isCourseFade) {
            vars.splitStar68 = true; return true;
        }
        else if (!vars.splitStar71 && vars.currStar >= 71 && isCourseFade) {
            vars.splitStar71 = true; return true;
        }
        else if (!vars.splitKey2Grabbed && vars.oldStage == 33 && vars.currStage == 6) {
            vars.splitKey2Grabbed = true; return true;
        }
        else if (!vars.splitStar74 && vars.currStar >= 74 && vars.currStage == 6 && vars.oldCam != vars.currCam && (vars.currCam == 0x4 || vars.currCam == 0xC) && (vars.currWarp == 23 || vars.currWarp == 19)) {
            vars.splitStar74 = true; return true;
        }
        else if (!vars.splitStar81 && vars.currStar >= 81 && isCourseFade) {
            vars.splitStar81 = true; return true;
        }
        else if (!vars.splitStar88 && vars.currStar >= 88 && isCourseFade) {
            vars.splitStar88 = true; return true;
        }
        else if (!vars.splitStar96 && vars.currStar >= 96 && isCourseFade) {
            vars.splitStar96 = true; return true;
        }
        else if (!vars.splitStar103 && vars.currStar >= 103 && isCourseFade) {
            vars.splitStar103 = true; return true;
        }
        else if (!vars.splitStar104 && vars.currStar >= 104 && isCourseFade) {
            vars.splitStar104 = true; return true;
        }
        else if (!vars.splitStar111 && vars.currStar >= 111 && isCourseFade) {
            vars.splitStar111 = true; return true;
        }
        else if (!vars.splitStar119 && vars.currStar >= 119 && isCourseFade) {
            vars.splitStar119 = true; return true;
        }
        else if (vars.currAnm == 0x1909 && vars.oldAnm != 0x1909) {
            return true;
        }
    }
    else {
        if (!vars.splitStar9 && vars.currStar >= 9 && isCourseFade) {
            vars.splitStar9 = true; return true;
        }
        else if (!vars.splitStar17 && vars.currStar >= 17 && isCourseFade) {
            vars.splitStar17 = true; return true;
        }
        else if (!vars.splitKey1Grabbed && vars.oldStage == 30 && vars.currStage == 6) {
            vars.splitKey1Grabbed = true; return true;
        }
        else if (!vars.splitStar26 && vars.currStar >= 26 && isCourseFade) {
            vars.splitStar26 = true; return true;
        }
        else if (!vars.splitStar34 && vars.currStar >= 34 && isCourseFade) {
            vars.splitStar34 = true; return true;
        }
        else if (!vars.splitStar36 && vars.currStar >= 36 && isCourseFade) {
            vars.splitStar36 = true; return true;
        }
        else if (!vars.splitStar42 && vars.currStar >= 42 && isCourseFade) {
            vars.splitStar42 = true; return true;
        }
        else if (!vars.splitStar50 && vars.currStar >= 50 && isCourseFade) {
            vars.splitStar50 = true; return true;
        }
        else if (!vars.splitStar52 && vars.currStar >= 52 && isCourseFade) {
            vars.splitStar52 = true; return true;
        }
        else if (!vars.splitStar59 && vars.currStar >= 59 && isCourseFade) {
            vars.splitStar59 = true; return true;
        }
        else if (!vars.splitStar66 && vars.currStar >= 66 && isCourseFade) {
            vars.splitStar66 = true; return true;
        }
        else if (!vars.splitStar68 && vars.currStar >= 68 && isCourseFade) {
            vars.splitStar68 = true; return true;
        }
        else if (!vars.splitStar71 && vars.currStar >= 71 && isCourseFade) {
            vars.splitStar71 = true; return true;
        }
        else if (!vars.splitKey2Grabbed && vars.oldStage == 33 && vars.currStage == 6) {
            vars.splitKey2Grabbed = true; return true;
        }
        else if (!vars.splitStar74 && vars.currStar >= 74 && vars.currStage == 6 && vars.oldCam != vars.currCam && (vars.currCam == 0x4 || vars.currCam == 0xC) && (vars.currWarp == 23 || vars.currWarp == 19)) {
            vars.splitStar74 = true; return true;
        }
        else if (!vars.splitStar81 && vars.currStar >= 81 && isCourseFade) {
            vars.splitStar81 = true; return true;
        }
        else if (!vars.splitStar88 && vars.currStar >= 88 && isCourseFade) {
            vars.splitStar88 = true; return true;
        }
        else if (!vars.splitStar96 && vars.currStar >= 96 && isCourseFade) {
            vars.splitStar96 = true; return true;
        }
        else if (!vars.splitStar103 && vars.currStar >= 103 && isCourseFade) {
            vars.splitStar103 = true; return true;
        }
        else if (!vars.splitStar104 && vars.currStar >= 104 && isCourseFade) {
            vars.splitStar104 = true; return true;
        }
        else if (!vars.splitStar111 && vars.currStar >= 111 && isCourseFade) {
            vars.splitStar111 = true; return true;
        }
        else if (!vars.splitStar119 && vars.currStar >= 119 && isCourseFade) {
            vars.splitStar119 = true; return true;
        }
        else if (vars.currAnm == 0x1909 && vars.oldAnm != 0x1909) {
            return true;
        }
    }
}

reset { 
    return vars.currTmr < vars.oldTmr && vars.currTmr == 0;
}

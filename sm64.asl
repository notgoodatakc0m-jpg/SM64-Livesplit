state("Project64") {
    uint dbgJP : "Project64.exe", 0xD6A1C, 0x2CA6E0;
    uint dbgUS : "Project64.exe", 0xD6A1C, 0x2CB1C0;
    uint animJP: "Project64.exe", 0xD6A1C, 0x339E0C;
    uint animUS: "Project64.exe", 0xD6A1C, 0x33B17C;
    uint tmrJP : "Project64.exe", 0xD6A1C, 0x32C694;
    uint tmrUS : "Project64.exe", 0xD6A1C, 0x32D5D4;
}
init { vars.isJP = false; }
update {
    if (current.dbgJP == 0x27bdffd8) vars.isJP = true;
    else if (current.dbgUS == 0x27bdffd8) vars.isJP = false;

    vars.currTmr = vars.isJP ? current.tmrJP : current.tmrUS;
    vars.oldTmr  = vars.isJP ? old.tmrJP    : old.tmrUS;
    vars.currAnm = vars.isJP ? current.animJP: current.animUS;
    vars.oldAnm  = vars.isJP ? old.animJP   : old.animUS;
}
start { return vars.currTmr == 4; }
split { return vars.currAnm == 0x1909 && vars.oldAnm != 0x1909; }
reset { return vars.currTmr < vars.oldTmr && vars.currTmr == 0; }

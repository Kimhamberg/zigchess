pub const Color = enum {
    White,
    Black,
};

const WnotOccupiedR = 6;
const WnotAttackedR = 14;
const WRookR = 1;
const WnotOccupiedL = 112;
const WnotAttackedL = 56;
const WRookL = 128;
const BnotOccupiedR = 432345564227567616;
const BnotAttackedR = 1008806316530991104;
const BRookR = 72057594037927936;
const BnotOccupiedL = 8070450532247928832;
const BnotAttackedL = 4035225266123964416;
const BRookL = 9223372036854775808;

pub const State = packed struct(u8) {
    colorToMove: Color,
    passantIsPossible: bool,
    whiteHasCastlingRightsLeft: bool,
    whiteHasCastlingRightsRight: bool,
    blackHasCastlingRightsLeft: bool,
    blackHasCastlingRightsRight: bool,
};

pub fn canWhiteCastleLeft(attacked: u64, occupied: u64, rook: u64, whiteCanCastleLeft: bool) bool {
    if (whiteCanCastleLeft) {
        if (occupied & WnotOccupiedL) return false;
        if (attacked & WnotAttackedL) return false;
        if (rook & WRookL) return true;
        return false;
    }
    return false;
}

pub fn canBlackCastleLeft(attacked: u64, occupied: u64, rook: u64, blackCanCastleLeft: bool) bool {
    if (blackCanCastleLeft) {
        if (occupied & BnotOccupiedL) return false;
        if (attacked & BnotAttackedL) return false;
        if (rook & BRookL) return true;
        return false;
    }
    return false;
}

pub fn silentMove(pState: *State) void {
    pState.*.passantIsPossible = false;
}

pub fn pawnPushed(pState: *State) void {
    pState.*.passantIsPossible = true;
}
pub fn blackKingMoved(pState: *State) void {
    pState.*.blackHasCastlingRightsLeft = false;
    pState.*.blackHasCastlingRightsRight = false;
}

pub fn whiteKingMoved(pState: *State) void {
    pState.*.whiteHasCastlingRightsLeft = false;
    pState.*.whiteHasCastlingRightsRight = false;
}

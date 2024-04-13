const Color = enum {
    Black = 0,
    White = 1,
};

const intToBool = @import("utils.zig").intToBool;
const flipBit = @import("utils.zig").flipBit;

const f1g1 = 6;
const e1f1g1 = 14;
const h1 = 1;
const b1c1d1 = 112;
const c1d1e1 = 56;
const a1 = 128;
const f8g8 = 432345564227567616;
const e8f8g8 = 1008806316530991104;
const h8 = 72057594037927936;
const b8c8d8 = 8070450532247928832;
const c8d8e8 = 4035225266123964416;
const a8 = 9223372036854775808;

pub const State = struct {
    color: 
    passantIsPossible: u64,
    passantTarget: u64,
    whiteHasLeftCastlingRights: u64,
    whiteHasRightCastlingRights: u64,
    blackHasLeftCastlingRights: u64,
    blackHasRightCastlingRights: u64,
};

pub fn canWhiteCastleLeft(attacked: u64, occupied: u64, whiteRooks: u64, castlingRights: u64) u64 {
    return castlingRights * flipBit(intToBool(b1c1d1 & occupied)) * flipBit(intToBool(c1d1e1 & attacked)) * intToBool(whiteRooks & a1);
}

pub fn canWhiteCastleRight(attacked: u64, occupied: u64, whiteRooks: u64, castlingRights: u64) u64 {
    return castlingRights * flipBit(intToBool(f1g1 & occupied)) * flipBit(intToBool(e1f1g1 & attacked)) * intToBool(whiteRooks & h1);
}

pub fn canBlackCastleLeft(attacked: u64, occupied: u64, blackRooks: u64, castlingRights: u64) u64 {
    return castlingRights * flipBit(intToBool(b8c8d8 & occupied)) * flipBit(intToBool(c8d8e8 & attacked)) * intToBool(blackRooks & a8);
}

pub fn canBlackCastleRight(attacked: u64, occupied: u64, blackRooks: u64, castlingRights: u64) u64 {
    return castlingRights * flipBit(intToBool(f8g8 & occupied)) * flipBit(intToBool(e8f8g8 & attacked)) * intToBool(blackRooks & h8);
}

pub fn silentMove(pState: *State) void {
    pState.*.passantIsPossible = 1;
}

pub fn pawnPushed(pState: *State) void {
    pState.*.passantIsPossible = 0;
}
pub fn blackKingMoved(pState: *State) void {
    pState.*.blackHasLeftCastlingRights = 0;
    pState.*.blackHasRightCastlingRights = 0;
    pState.*.passantIsPossible = 0;
}

pub fn whiteKingMoved(pState: *State) void {
    pState.*.whiteHasLeftCastlingRights = 0;
    pState.*.whiteHasRightCastlingRights = 0;
    pState.*.passantIsPossible = 0;
}

pub fn rightWhiteRookMoved(pState: *State) void {
    pState.*.whiteHasRightCastlingRights = 0;
    pState.*.passantIsPossible = 0;
}

pub fn leftWhiteRookMoved(pState: *State) void {
    pState.*.whiteHasLeftCastlingRights = 0;
    pState.*.passantIsPossible = 0;
}

pub fn rightBlackRookMoved(pState: *State) void {
    pState.*.blackHasRightCastlingRights = 0;
    pState.*.passantIsPossible = 0;
}

pub fn leftBlackRookMoved(pState: *State) void {
    pState.*.blackHasLeftCastlingRights = 0;
    pState.*.passantIsPossible = 0;
}

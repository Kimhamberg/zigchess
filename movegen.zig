const createStartBoards = @import("boards.zig").createStartBoards;
const createBoardsFromFEN = @import("boards.zig").createBoardsFromFEN;
const getKnightMoves = @import("knightmoves.zig").getKnightMoves;
const getBishopMoves = @import("bishopmoves.zig").getBishopMoves;
const getWhitePawnMoves = @import("pawnmoves.zig").getWhitePawnMoves;
const getWhiteSinglePushes = @import("pawnmoves.zig").getWhiteSinglePushes;
const getWhiteDoublePushes = @import("pawnmoves.zig").getWhiteDoublePushes;
const getWhiteCaptures = @import("pawnmoves.zig").getWhiteCaptures;
const getRookMoves = @import("rookmoves.zig").getRookMoves;
const getQueenMoves = @import("queenmoves.zig").getQueenMoves;
const getKingMoves = @import("kingmoves.zig").getKingMoves;
const print = @import("std").debug.print;

pub fn getWhiteMoveCount(FEN: []const u8) u7 {
    var boards = createBoardsFromFEN(FEN);
    var moveCount: u7 = 0;
    var i = @popCount(boards.whiteRook);
    while (i != 0) : (i -= 1) {
        const iRook = @ctz(boards.whiteRook);
        const rookMoves = getRookMoves(iRook, boards.occupied, boards.white);
        moveCount += @popCount(rookMoves);
        boards.whiteRook = boards.whiteRook & (boards.whiteRook - 1);
    }
    i = @popCount(boards.whiteKnight);
    while (i != 0) : (i -= 1) {
        const iKnight = @ctz(boards.whiteKnight);
        const knightMoves = getKnightMoves(iKnight, ~boards.white);
        moveCount += @popCount(knightMoves);
        boards.whiteKnight = boards.whiteKnight & (boards.whiteKnight - 1);
    }
    i = @popCount(boards.whiteBishop);
    while (i != 0) : (i -= 1) {
        const iBishop = @ctz(boards.whiteBishop);
        const bishopMoves = getBishopMoves(iBishop, boards.occupied, boards.white);
        moveCount += @popCount(bishopMoves);
        boards.whiteBishop = boards.whiteBishop & (boards.whiteBishop - 1);
    }
    i = @popCount(boards.whiteQueen);
    while (i != 0) : (i -= 1) {
        const iQueen = @ctz(boards.whiteQueen);
        const queenMoves = getQueenMoves(iQueen, boards.occupied, boards.white);
        moveCount += @popCount(queenMoves);
        boards.whiteQueen = boards.whiteQueen & (boards.whiteQueen - 1);
    }
    const iKing = @ctz(boards.whiteKing);
    const kingMoves = getKingMoves(iKing, ~boards.white);
    moveCount += @popCount(kingMoves);
    const singlePush = getWhiteSinglePushes(boards.whitePawn, boards.free);
    moveCount += @popCount(singlePush);
    const doublePush = getWhiteDoublePushes(boards.whitePawn, boards.free);
    moveCount += @popCount(doublePush);
    i = @popCount(boards.whitePawn);
    while (i != 0) : (i -= 1) {
        const iPawn = @ctz(boards.whitePawn);
        const captures = getWhiteCaptures(iPawn, boards.black);
        moveCount += @popCount(captures);
        boards.whitePawn = boards.whitePawn & (boards.whitePawn - 1);
    }
    return moveCount;
}

pub fn f(n: u64) u64 {
    return @intFromBool(n > 0);
}

pub fn main() void {
    // const moveCount = getWhiteMoveCount("rnbqkbnr/ppppp1p1/5p2/8/8/5NPp/PPPPPP1P/RNBQKB1R w KQkq - 0 5");
    // print("{}", .{moveCount});
    print("{}", .{f(32)});
}

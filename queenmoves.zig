const getBishopMoves = @import("bishopmoves.zig").getBishopMoves;
const getRookMoves = @import("rookmoves.zig").getRookMoves;

pub fn getQueenMoves(square: u7, occupiedSquares: u64, friendlySquares: u64) u64 {
    return getBishopMoves(square, occupiedSquares, friendlySquares) | getRookMoves(square, occupiedSquares, friendlySquares);
}

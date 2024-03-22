const Boards = @import("boards.zig").Boards;
const createStartBoards = @import("boards.zig").createStartBoards;
const Color = @import("color.zig").Color;
const getKnightMoves = @import("knightmoves.zig").getKnightMoves;
const getBishopMoves = @import("bishopmoves.zig").getBishopMoves;
const getPawnMoves = @import("pawnmoves.zig").getPawnMoves;
const print = @import("std").debug.print;

pub fn main() void {
    const boards = createStartBoards();
    const knightMoves: u64 = getKnightMoves(boards.whiteKnight, ~boards.white);
    print("Knight moves: {}", .{knightMoves});
}

// fn enumerate(comptime BoardStatus: type, comptime Callback_Move: type, comptime depth: usize, boards: Boards, kingatk: u64, kingban: u64, checkmask: u64) !u64 {
//     comptime justcount = (Callback_Move == void);
//     const color = status.color;
//     const noCheck = (checkmask == 0xffffffffffffffff);
//     const movecnt: u64 = 0;
//     const pinHV: u64  = RookPin;
//     const pinD12: u64 = BishopPin;
//     const movableSquare: u64 = EnemyOrEmpty(color, boards) & checkmask;
//     const epTarget: u64 = EnPassantTarget;
//     if (justcount) {
//         movecnt += Bitcount(kingatk);
//     }
//     else {
//         Bitloop (kingatk)
//         {
//             const Square sq = SquareOf(kingatk);
//             Movestack::Atk_EKing[depth - 1] = Lookup::King(sq);
//             Callback_Move::template Kingmove<status, depth>(boards, King<white>(boards), 1ull << sq);
//         }
//     }
// }

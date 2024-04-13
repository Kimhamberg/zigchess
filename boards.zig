const pow = @import("std").math.pow;
const State = @import("state.zig").State;
const split = @import("std").mem.split;

pub const Boards = struct {
    whiteRook: u64,
    blackRook: u64,
    whiteKnight: u64,
    blackKnight: u64,
    whiteBishop: u64,
    blackBishop: u64,
    whiteQueen: u64,
    blackQueen: u64,
    whiteKing: u64,
    blackKing: u64,
    whitePawn: u64,
    blackPawn: u64,
    white: u64,
    black: u64,
    occupied: u64,
    free: u64,
};

pub fn createStartBoards() Boards {
    const whiteRook: u64 = 129;
    const blackRook: u64 = 9295429630892703744;
    const whiteKnight: u64 = 66;
    const blackKnight: u64 = 4755801206503243776;
    const whiteBishop: u64 = 36;
    const blackBishop: u64 = 2594073385365405696;
    const whiteQueen: u64 = 16;
    const blackQueen: u64 = 1152921504606846976;
    const whiteKing: u64 = 8;
    const blackKing: u64 = 576460752303423488;
    const whitePawn: u64 = 65280;
    const blackPawn: u64 = 71776119061217280;
    const white: u64 = whiteRook | whiteKnight | whiteBishop | whiteQueen | whiteKing | whitePawn;
    const black: u64 = blackRook | blackKnight | blackBishop | blackQueen | blackKing | blackPawn;
    const occupied: u64 = white | black;
    const free: u64 = ~occupied;
    return Boards{ .whiteRook = whiteRook, .whiteKnight = whiteKnight, .whiteBishop = whiteBishop, .whiteQueen = whiteQueen, .whiteKing = whiteKing, .whitePawn = whitePawn, .blackRook = blackRook, .blackKnight = blackKnight, .blackBishop = blackBishop, .blackQueen = blackQueen, .blackKing = blackKing, .blackPawn = blackPawn, .white = white, .black = black, .occupied = occupied, .free = free };
}

pub fn createBoardsFromFEN(boards: *Boards, state: *State, fen: []const u8) Boards {
    var splits = split(u8, fen, " ");
    const boardfen = splits.next();
    var index: u6 = 63;
    for (boardfen) |c| {
        switch (c) {
            'p' => {
                boards.*.blackPawn += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'P' => {
                boards.*.whitePawn += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'n' => {
                boards.*.blackKnight += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'N' => {
                boards.*.whiteKnight += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'r' => {
                boards.*.blackRook += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'R' => {
                boards.*.whiteRook += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'b' => {
                boards.*.blackBishop += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'B' => {
                boards.*.whiteBishop += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'q' => {
                boards.*.blackQueen += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'Q' => {
                boards.*.whiteQueen += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'k' => {
                boards.*.blackKing += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            'K' => {
                boards.*.whiteKing += pow(u64, 2, index);
                if (index > 0) {
                    index -= 1;
                }
            },
            '1'...'8' => {
                if (index >= @as(u6, @intCast(c - '0'))) {
                    index -= @intCast(c - '0');
                }
            },
            '/' => {},
            else => break,
        }
    }
    boards.white = boards.whiteRook | boards.whiteKnight | boards.whiteBishop |
        boards.whiteQueen | boards.whiteKing | boards.whitePawn;
    boards.black = boards.blackRook | boards.blackKnight | boards.blackBishop |
        boards.blackQueen | boards.blackKing | boards.blackPawn;
    boards.occupied = boards.white | boards.black;
    boards.free = ~boards.occupied;
}

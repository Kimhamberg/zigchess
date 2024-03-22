const expect = @import("std").testing.expect;

pub const Board = packed struct(u64) {
    h1: u1,
    g1: u1,
    f1: u1,
    e1: u1,
    d1: u1,
    c1: u1,
    b1: u1,
    a1: u1,
    h2: u1,
    g2: u1,
    f2: u1,
    e2: u1,
    d2: u1,
    c2: u1,
    b2: u1,
    a2: u1,
    h3: u1,
    g3: u1,
    f3: u1,
    e3: u1,
    d3: u1,
    c3: u1,
    b3: u1,
    a3: u1,
    h4: u1,
    g4: u1,
    f4: u1,
    e4: u1,
    d4: u1,
    c4: u1,
    b4: u1,
    a4: u1,
    h5: u1,
    g5: u1,
    f5: u1,
    e5: u1,
    d5: u1,
    c5: u1,
    b5: u1,
    a5: u1,
    h6: u1,
    g6: u1,
    f6: u1,
    e6: u1,
    d6: u1,
    c6: u1,
    b6: u1,
    a6: u1,
    h7: u1,
    g7: u1,
    f7: u1,
    e7: u1,
    d7: u1,
    c7: u1,
    b7: u1,
    a7: u1,
    h8: u1,
    g8: u1,
    f8: u1,
    e8: u1,
    d8: u1,
    c8: u1,
    b8: u1,
    a8: u1,
};

pub fn intersect(board1: Board, board2: Board) Board {
    return @as(Board, @bitCast(@as(u64, @bitCast(board1)) & @as(u64, @bitCast(board2))));
}

pub fn move(board: Board, from: Board, to: Board) Board {
    return @as(Board, @bitCast(@as(u64, @bitCast(board)) | @as(u64, @bitCast(from)) & ~@as(u64, @bitCast(to))));
}

test "intersection" {
    const board1 = Board{
        .h1 = 1,
        .g1 = 0,
        .f1 = 1,
        .e1 = 1,
        .d1 = 0,
        .c1 = 1,
        .b1 = 1,
        .a1 = 0,
        .h2 = 1,
        .g2 = 1,
        .f2 = 0,
        .e2 = 0,
        .d2 = 1,
        .c2 = 0,
        .b2 = 0,
        .a2 = 1,
        .h3 = 1,
        .g3 = 0,
        .f3 = 0,
        .e3 = 1,
        .d3 = 1,
        .c3 = 1,
        .b3 = 0,
        .a3 = 0,
        .h4 = 1,
        .g4 = 0,
        .f4 = 0,
        .e4 = 0,
        .d4 = 1,
        .c4 = 1,
        .b4 = 0,
        .a4 = 0,
        .h5 = 1,
        .g5 = 1,
        .f5 = 0,
        .e5 = 0,
        .d5 = 0,
        .c5 = 0,
        .b5 = 1,
        .a5 = 1,
        .h6 = 0,
        .g6 = 0,
        .f6 = 0,
        .e6 = 1,
        .d6 = 1,
        .c6 = 1,
        .b6 = 1,
        .a6 = 0,
        .h7 = 1,
        .g7 = 1,
        .f7 = 0,
        .e7 = 0,
        .d7 = 0,
        .c7 = 1,
        .b7 = 1,
        .a7 = 0,
        .h8 = 0,
        .g8 = 1,
        .f8 = 0,
        .e8 = 1,
        .d8 = 1,
        .c8 = 1,
        .b8 = 0,
        .a8 = 1,
    };
    const board2 = Board{
        .h1 = 1,
        .g1 = 1,
        .f1 = 1,
        .e1 = 0,
        .d1 = 0,
        .c1 = 1,
        .b1 = 0,
        .a1 = 1,
        .h2 = 0,
        .g2 = 1,
        .f2 = 1,
        .e2 = 0,
        .d2 = 0,
        .c2 = 1,
        .b2 = 0,
        .a2 = 0,
        .h3 = 1,
        .g3 = 0,
        .f3 = 1,
        .e3 = 0,
        .d3 = 0,
        .c3 = 0,
        .b3 = 0,
        .a3 = 0,
        .h4 = 0,
        .g4 = 0,
        .f4 = 0,
        .e4 = 1,
        .d4 = 1,
        .c4 = 1,
        .b4 = 1,
        .a4 = 1,
        .h5 = 0,
        .g5 = 0,
        .f5 = 0,
        .e5 = 1,
        .d5 = 0,
        .c5 = 1,
        .b5 = 1,
        .a5 = 1,
        .h6 = 0,
        .g6 = 1,
        .f6 = 1,
        .e6 = 1,
        .d6 = 1,
        .c6 = 0,
        .b6 = 0,
        .a6 = 1,
        .h7 = 0,
        .g7 = 1,
        .f7 = 1,
        .e7 = 0,
        .d7 = 0,
        .c7 = 0,
        .b7 = 1,
        .a7 = 0,
        .h8 = 1,
        .g8 = 0,
        .f8 = 1,
        .e8 = 0,
        .d8 = 1,
        .c8 = 0,
        .b8 = 1,
        .a8 = 0,
    };
    const board3 = intersect(board1, board2);
    try expect(board1.h1 & board2.h1 == board3.h1);
    try expect(board1.g1 & board2.g1 == board3.g1);
    try expect(board1.f1 & board2.f1 == board3.f1);
    try expect(board1.e1 & board2.e1 == board3.e1);
    try expect(board1.d1 & board2.d1 == board3.d1);
    try expect(board1.c1 & board2.c1 == board3.c1);
    try expect(board1.b1 & board2.b1 == board3.b1);
    try expect(board1.a1 & board2.a1 == board3.a1);
    try expect(board1.h2 & board2.h2 == board3.h2);
    try expect(board1.g2 & board2.g2 == board3.g2);
    try expect(board1.f2 & board2.f2 == board3.f2);
    try expect(board1.e2 & board2.e2 == board3.e2);
    try expect(board1.d2 & board2.d2 == board3.d2);
    try expect(board1.c2 & board2.c2 == board3.c2);
    try expect(board1.b2 & board2.b2 == board3.b2);
    try expect(board1.a2 & board2.a2 == board3.a2);
    try expect(board1.h3 & board2.h3 == board3.h3);
    try expect(board1.g3 & board2.g3 == board3.g3);
    try expect(board1.f3 & board2.f3 == board3.f3);
    try expect(board1.e3 & board2.e3 == board3.e3);
    try expect(board1.d3 & board2.d3 == board3.d3);
    try expect(board1.c3 & board2.c3 == board3.c3);
    try expect(board1.b3 & board2.b3 == board3.b3);
    try expect(board1.a3 & board2.a3 == board3.a3);
    try expect(board1.h4 & board2.h4 == board3.h4);
    try expect(board1.g4 & board2.g4 == board3.g4);
    try expect(board1.f4 & board2.f4 == board3.f4);
    try expect(board1.e4 & board2.e4 == board3.e4);
    try expect(board1.d4 & board2.d4 == board3.d4);
    try expect(board1.c4 & board2.c4 == board3.c4);
    try expect(board1.b4 & board2.b4 == board3.b4);
    try expect(board1.a4 & board2.a4 == board3.a4);
    try expect(board1.h5 & board2.h5 == board3.h5);
    try expect(board1.g5 & board2.g5 == board3.g5);
    try expect(board1.f5 & board2.f5 == board3.f5);
    try expect(board1.e5 & board2.e5 == board3.e5);
    try expect(board1.d5 & board2.d5 == board3.d5);
    try expect(board1.c5 & board2.c5 == board3.c5);
    try expect(board1.b5 & board2.b5 == board3.b5);
    try expect(board1.a5 & board2.a5 == board3.a5);
    try expect(board1.h6 & board2.h6 == board3.h6);
    try expect(board1.g6 & board2.g6 == board3.g6);
    try expect(board1.f6 & board2.f6 == board3.f6);
    try expect(board1.e6 & board2.e6 == board3.e6);
    try expect(board1.d6 & board2.d6 == board3.d6);
    try expect(board1.c6 & board2.c6 == board3.c6);
    try expect(board1.b6 & board2.b6 == board3.b6);
    try expect(board1.a6 & board2.a6 == board3.a6);
    try expect(board1.h7 & board2.h7 == board3.h7);
    try expect(board1.g7 & board2.g7 == board3.g7);
    try expect(board1.f7 & board2.f7 == board3.f7);
    try expect(board1.e7 & board2.e7 == board3.e7);
    try expect(board1.d7 & board2.d7 == board3.d7);
    try expect(board1.c7 & board2.c7 == board3.c7);
    try expect(board1.b7 & board2.b7 == board3.b7);
    try expect(board1.a7 & board2.a7 == board3.a7);
    try expect(board1.h8 & board2.h8 == board3.h8);
    try expect(board1.g8 & board2.g8 == board3.g8);
    try expect(board1.f8 & board2.f8 == board3.f8);
    try expect(board1.e8 & board2.e8 == board3.e8);
    try expect(board1.d8 & board2.d8 == board3.d8);
    try expect(board1.c8 & board2.c8 == board3.c8);
    try expect(board1.b8 & board2.b8 == board3.b8);
    try expect(board1.a8 & board2.a8 == board3.a8);
}

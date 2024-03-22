const expect = @import("std").testing.expect;
const Board = @import("board.zig").Board;

pub fn getKnightMoves(knightBoard: Board, accessibleSquares: u64) u64 {
    const h1: u64 = knightBoard.h1;
    const g1: u64 = knightBoard.g1;
    const f1: u64 = knightBoard.f1;
    const e1: u64 = knightBoard.e1;
    const d1: u64 = knightBoard.d1;
    const c1: u64 = knightBoard.c1;
    const b1: u64 = knightBoard.b1;
    const a1: u64 = knightBoard.a1;
    const h2: u64 = knightBoard.h2;
    const g2: u64 = knightBoard.g2;
    const f2: u64 = knightBoard.f2;
    const e2: u64 = knightBoard.e2;
    const d2: u64 = knightBoard.d2;
    const c2: u64 = knightBoard.c2;
    const b2: u64 = knightBoard.b2;
    const a2: u64 = knightBoard.a2;
    const h3: u64 = knightBoard.h3;
    const g3: u64 = knightBoard.g3;
    const f3: u64 = knightBoard.f3;
    const e3: u64 = knightBoard.e3;
    const d3: u64 = knightBoard.d3;
    const c3: u64 = knightBoard.c3;
    const b3: u64 = knightBoard.b3;
    const a3: u64 = knightBoard.a3;
    const h4: u64 = knightBoard.h4;
    const g4: u64 = knightBoard.g4;
    const f4: u64 = knightBoard.f4;
    const e4: u64 = knightBoard.e4;
    const d4: u64 = knightBoard.d4;
    const c4: u64 = knightBoard.c4;
    const b4: u64 = knightBoard.b4;
    const a4: u64 = knightBoard.a4;
    const h5: u64 = knightBoard.h5;
    const g5: u64 = knightBoard.g5;
    const f5: u64 = knightBoard.f5;
    const e5: u64 = knightBoard.e5;
    const d5: u64 = knightBoard.d5;
    const c5: u64 = knightBoard.c5;
    const b5: u64 = knightBoard.b5;
    const a5: u64 = knightBoard.a5;
    const h6: u64 = knightBoard.h6;
    const g6: u64 = knightBoard.g6;
    const f6: u64 = knightBoard.f6;
    const e6: u64 = knightBoard.e6;
    const d6: u64 = knightBoard.d6;
    const c6: u64 = knightBoard.c6;
    const b6: u64 = knightBoard.b6;
    const a6: u64 = knightBoard.a6;
    const h7: u64 = knightBoard.h7;
    const g7: u64 = knightBoard.g7;
    const f7: u64 = knightBoard.f7;
    const e7: u64 = knightBoard.e7;
    const d7: u64 = knightBoard.d7;
    const c7: u64 = knightBoard.c7;
    const b7: u64 = knightBoard.b7;
    const a7: u64 = knightBoard.a7;
    const h8: u64 = knightBoard.h8;
    const g8: u64 = knightBoard.g8;
    const f8: u64 = knightBoard.f8;
    const e8: u64 = knightBoard.e8;
    const d8: u64 = knightBoard.d8;
    const c8: u64 = knightBoard.c8;
    const b8: u64 = knightBoard.b8;
    const a8: u64 = knightBoard.a8;
    return (h1 * 132096 |
        g1 * 329728 |
        f1 * 659712 |
        e1 * 1319424 |
        d1 * 2638848 |
        c1 * 5277696 |
        b1 * 10489856 |
        a1 * 4202496 |
        h2 * 33816580 |
        g2 * 84410376 |
        f2 * 168886289 |
        e2 * 337772578 |
        d2 * 675545156 |
        c2 * 1351090312 |
        b2 * 2685403152 |
        a2 * 1075839008 |
        h3 * 8657044482 |
        g3 * 21609056261 |
        f3 * 43234889994 |
        e3 * 86469779988 |
        d3 * 172939559976 |
        c3 * 345879119952 |
        b3 * 687463207072 |
        a3 * 275414786112 |
        h4 * 2216203387392 |
        g4 * 5531918402816 |
        f4 * 11068131838464 |
        e4 * 22136263676928 |
        d4 * 44272527353856 |
        c4 * 88545054707712 |
        b4 * 175990581010432 |
        a4 * 70506185244672 |
        h5 * 567348067172352 |
        g5 * 1416171111120896 |
        f5 * 2833441750646784 |
        e5 * 5666883501293568 |
        d5 * 11333767002587136 |
        c5 * 22667534005174272 |
        b5 * 45053588738670592 |
        a5 * 18049583422636032 |
        h6 * 145241105196122112 |
        g6 * 362539804446949376 |
        f6 * 725361088165576704 |
        e6 * 1450722176331153408 |
        d6 * 2901444352662306816 |
        c6 * 5802888705324613632 |
        b6 * 11533718717099671552 |
        a6 * 4620693356194824192 |
        h7 * 288234782788157440 |
        g7 * 576469569871282176 |
        f7 * 1224997833292120064 |
        e7 * 2449995666584240128 |
        d7 * 4899991333168480256 |
        c7 * 9799982666336960512 |
        b7 * 1152939783987658752 |
        a7 * 2305878468463689728 |
        h8 * 1128098930098176 |
        g8 * 2257297371824128 |
        f8 * 4796069720358912 |
        e8 * 9592139440717824 |
        d8 * 19184278881435648 |
        c8 * 38368557762871296 |
        b8 * 4679521487814656 |
        a8 * 9077567998918656) & accessibleSquares;
}

test "top-left knight, no pins, all squares accessible, all squares legal" {
    const expected = 0b0000000000000000000000000000000000000000000000100000010000000000;
    const actual = getKnightMoves(0, 0xFFFFFFFFFFFFFFFF);
    try expect(actual == expected);
}

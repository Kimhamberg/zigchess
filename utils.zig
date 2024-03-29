const print = @import("std").debug.print;

pub fn findBitAndRemove(pBoard: *u64) u64 {
    const board = pBoard.*;
    const bit = @ctz(board);
    pBoard.* = board & (board - 1);
    return bit;
}

pub fn main() void {
    var board: u64 = 10242;
    const bit = findBitAndRemove(&board);
    print("{}\n", .{bit});
    print("{}", .{board});
}

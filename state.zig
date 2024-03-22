const Color = @import("color").Color;

pub const State = packed struct(u8) {
    color: Color,
    enPassant: bool,
    whiteCastleLeft: bool,
    whiteCastleRight: bool,
    blackCastleLeft: bool,
    blackCastleRight: bool,
};

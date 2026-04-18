MODULE example01;
CONST
    size = 1024;
    zero = 0;

TYPE
    point = RECORD
        x, y: integer
    END;

VAR
    p0, p1: point;

BEGIN
    p0.x := 0;
    p0.y := 1
END example01.

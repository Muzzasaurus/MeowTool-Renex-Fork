///curInside(x,y,x2,y2)
if (mouse_xfixed > argument0) {
    if (mouse_xfixed < argument2) {
        if (mouse_y > argument1) {
            if (mouse_y < argument3) {
                return true
            }
        }
    }
}
return false

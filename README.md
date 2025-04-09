  /*********************************************************************
   Alrighty...
   
   This framework/library/toolkit, whatever it is, is made for drawing spirographs.
   
   It has been tested on most of the (simple) pictures and recipes included in the original
   toy.
   
   These drawings have been included here, under the un-called methods 'drawing1()' through 'drawing63()'.
   
   Some of those methods are test or calibration drawings, but most of them are legit.
   
   As I developed this framework, I simplified the syntax to call the drawing code; as such, earlier examples
   have a 2 part preSpin() and spin() call.
   preSpin() takes the gears and drawing hole*.
   spin()takes the hue, saturation, brightness, and the starting 'tooth' for the drawing.
   As the name implies, preSpin() has to be called before spin().
   
   The simplified method is turn(), and it doesn't require a previous method call.
   turn() takes floats (R, r, d, tooth, and colorNumber).
   
   The colorNumber is defined by a method setColor();
   
   switch (colorNum) {
   case 1: return  new float[]{0, 10, 10}; // Red 1
   case 2: return  new float[]{4, 7, 7};   // Green 2
   case 3: return  new float[]{7, 7, 7};   // Blue 3
   case 4: return  new float[]{1, 10, 10}; // Orange 4
   case 0: return  new float[]{0, 0, 0};   // Black 0
   case -1: return  new float[]{0, 0, 10}; // White -1
   default: return  new float[]{1, 0, 0};  // Defaults black.
   
   New colours can be added to the setColor() method, or existing colours can be tweaked.
   
   The colorMode is (HSB, 10, 10, 10).  I picked colours that corresponded to the spirograph colors.
   
   now, about drawing some spirographs..
   
   Spirograph drawings are hypo- or epitrochoids.  In the booklets, the most common were
   hypotrochoids: a smaller gear rotating inside a larger ring.
   Epitrochoids are when the gear is rotated on the outside of the ring or another gear.
   The mathematical formulas are similar for either style.
   Big 'R' represents the stationary, usually larger gear.  In the toy, it was usually either 105 or 96.
   Little 'r' represents the rotor gear, usually smaller that moves about the inside or outside of the 'R' gear.
   
   The variable 'd' stands for distance from the center of the 'r' gear.  This is the variable that represents the
   hole number from the toy's recipes.  Unfortunately, it is the only variable that I haven't been able to universally
   map to the toy's recipes to get right.  Of course, with math and graphics, there is no slippage, no backlash, no wiggle
   room, and, no space required for the gears.
   
   Since I don't have a toy to make measurements on, I've just had to guess, in many cases.  Where there was a picture
   of the drawing, I could better adjust the drawing to match.
   
   In many of my examples, I use a rule of thumb:   d = (r - 5) - (hole*2).   So for a drawing
   with gears 105 and 48, I would use 43 - 6 for hole number 3.
   
   Fortunately, it's easy to adjust the 'd' variable and try again if it doesn't look right.
   The 'tooth' variable, 4th argument in turn() selects the number of teeth to the right; -tooth for left.
   There are many references to 'the first/second/third marks' on the ring.
   I've calculated them before, but it's not too hard to figure out in an attempt or two.
   I think it's 6 teeth for mark 1 of the 96 R,  12 for mark 2, but I'm not sure.
   If your drawing looks a bit asymetrical after, add or subtract a tooth or two to bring the drawing
   into balance.
   
   The color numbers are currently 0: black, 1: red, 2: green, 3, blue, 4: orange, -1 white (for debugging purposes)
   and if a color number isn't in the list, it will draw black.
   
   
   This is a good time to introduce some additional variables you can optionally set in the drawing() method.
   
   int speed = 1 is the default.  It is pretty slow, but is the most accurate.
   faster speeds come at a cost of lower accuracy, as the drawing code will skip every 2nd plotted point
   with speed = 2, skip 3 points for speed = 3, etc.   There are a lot of extra plotted points, so I've not noticed
   any trouble with up to speed = 5;  above that and you might see curves getting blocky, but the drawings will *fly*.
   
   Another variable is 'scale = 4.0' (default).
   scale sets how large the drawing is; but uses the same R, r, d, and tooth values.
   
   A third variable is float thickness = 2.0 (default), corresponds to the strokeWeight() of the drawing.
   
   
   In the example drawings, sometimes I've just stacked turn() calls.
   
   Other times I've gotten creative, with for() loops, with foreach loops
   for (int i: red){}
   where int[] red = {1, 2, 4, 5, 7, 8};
   and added variables to the turn() calls that drew a list of holes in a certain color, that weren't in a sequence.
   other times, I've added an if statement, to draw one final drawing in a different gear, as a few recipes required.
   
   As I moved from recipe to recipe, I simply renamed 'drawing()' to 'drawing64()', and started a new 'drawing(){}'
   method.  This is why you can see or use all my past recipes.   In the 'settings()' method, simply change
   drawing(); to drawing1 through 63() and it should draw the thing it drew for me.
   
   and finally, this program works by plotting the points with the hypotrochoid formula, and saving them, and other values
   to a few rather long array lists.  Then when the math is finished, the draw() method connects the dots with lines, of the
   specified color, at the specified rotation.
   
   **********************************************************/

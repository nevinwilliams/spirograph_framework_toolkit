public void drawing() {

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


  // Here is a a sample drawing, and verbatim text from the Spirograph booklet on how to make it.

  /*
  Pin RING No. 150/105 to Paper and Baseboard.
   
   Use WHEEL No. 60, Hole 1 at mark 1. (note: mark 1 is always tooth 0)
   With Red Pen in Hole 1, draw pattern.
   Move the Wheel one tooth to the right,
   and with the same pen in Hole 1 draw pattern.
   Line up Hole 5 with mark 2 on Ring.
   With Black pen in Hole 5 draw pattern.
   Move Wheel one tooth to right and with
   same pen in Hole 5 draw pattern.
   //  note: I should have screened this better, but there aren't many like this
   Turn Wheel over (numbers underneath, and
   position Hole 5 between the two Black
   patterns.  Draw with Green Pen in Hole 5.
   
   */

  // and this is why the tooth argument is a float and not an integer.

  // Ok, so it's the 150/105 gear.  it's the inner one (most are) so it's 105.

  // turn(105

  // it's the 60 tooth smaller gear

  // turn(105, 60

  // it's hole 1, so my rule of thumb is 60 - 5 - (1)*2
  // turn(105, 60, 55 - 2,

  // it's tooth 0, and a red pen so

  turn(105, 60, 52-2, 0, 1);

  //  I drew the pattern just now to see how it looked. ok!

  // move one tooth to the right..  I'll just c&p the 1st line and change the 0 to a 1.

  turn(105, 60, 52-2, 1, 1);

  // I tried it out with 55; it didn't match the drawing.
  // so I went back changed the 3rd argument to 52-2; that more closely matches the drawing in the
  // spirograph instruction booklet. (You can find it online)
  // Onward!
  // Hole 5 with Mark 2 in black...  The first figure was a 7 sided one.
  // I'm going to guess Mark 2 is tooth 7.

  turn(105, 60, 52-5*2, 7, 0);

  // Looks right...
  // one tooth over, draw in black.

  turn(105, 60, 52-5*2, 8, 0);

  // So, it seems that the way the toymaker worked it out, was if you wanted a half-tooth drawing, you
  // just flipped the gear over.
  // I had to re-write my code because of one like this; I didn't think they used fractional teeth.
  // but they did.   Not often though.  You may never encounter this again.

  // between the black two black lines, draw in green.

  turn(105, 60, 52-5*2, 7.5, 2);

  // and there, the drawing in the booklet, and the drawing this code has done look pretty similar.
  // Should you be brave enough to try an epitrochoid, with the R150 or R144 gear, make the 2nd parameter negative.
  // You might have to scale down to 1.5 or 2 with the scale variable.

  // Enjoy, and leave a note if you find a bug or have an enhancement, or a comment.
  //    -nevin
}

public void drawingSpecial105_52() {

  //  This special case of an official spirograph drawing that changes
  // colours 3 times with the same gear is one that requires some special code.
  // For completeness, I'll write it.
  // ooh, it won't be pretty.
  //
  // (I suck as a programmer.)

  //speed = 5;

  turnSpecial(105, 52, 40, 0, 1);
}


public void drawing1() {
pushMatrix();

  float hole = 58;
  float step = 1.7F;

  preSpin(105, 63, hole);
  spin(0, 10, 10, 0);

  hole -= step;
  preSpin(105, 63, hole);
  spin(0, 10, 10, 1);

  hole -= step;
  preSpin(105, 63, hole);
  spin(0, 10, 10, 2);

  hole -= step;
  preSpin(105, 63, hole);
  spin(0, 10, 10, 3);

  hole -= step;
  preSpin(105, 63, hole);
  spin(4, 5, 7, 4);

  hole -= step;
  preSpin(105, 63, hole);
  spin(4, 5, 7, 5);

  hole -= step;
  preSpin(105, 63, hole);
  spin(4, 5, 7, 6);

  hole -= step;
  preSpin(105, 63, hole);
  spin(4, 5, 7, 7);

  hole -= step;
  preSpin(105, 63, hole);
  spin(7, 6, 7, 8);

  hole -= step;
  preSpin(105, 63, hole);
  spin(7, 6, 7, 9);

  hole -= step;
  preSpin(105, 63, hole);
  spin(7, 6, 7, 10);

  hole -= step;
  preSpin(105, 63, hole);
  spin(7, 6, 7, 11);
  popMatrix();
}

public void drawing2() {
  pushMatrix();
  for (int i = 0; i < 3; i++) {
    preSpin(96, 64, (float) (58 - i * 4.5));
    spin(0, 0, 0, 0);
  }

  for (int i = 3; i < 6; i++) {
    preSpin(96, 64, (float) (58 - i * 4.5));
    spin(0, 10, 10, 0);
  }

  for (int i = 6; i < 9; i++) {
    preSpin(96, 64, (float) (58 - i * 4.5));
    spin(6, 5, 7, 0);
  }
  for (int i = 9; i < 13; i++) {
    preSpin(96, 64, (float) (58 - i * 4.5));
    spin(5, 5, 7, 0);
  }
  popMatrix();
}

public void drawing3() {
  pushMatrix();
  for (int i = 0; i < 9; i++) {
    preSpin(96, 84, 74 - 2 * i);
    spin(0, 10, 10, i);
  }

  for (int i = 0; i < 9; i++) {
    preSpin(96, 84, 73 - 2 * i);
    spin(0, 10, 10, i);
  }
  popMatrix();
}

public void drawing4() {
  pushMatrix();
  for (int i = 0; i < 5; i++) {
    preSpin(105, 30, 25 - i * 2);
    spin(0, 0, 0, 0);
  }
  for (int i = 0; i < 5; i++) {
    preSpin(105, 45, 40 - i * 2);
    spin(4, 5, 7, 0);
  }
  for (int i = 0; i < 5; i++) {
    preSpin(105, 60, 50 - i * 2);
    spin(0, 10, 10, 0);
  }
  popMatrix();
}

public void drawing5() {
  int[] black = {1, 2, 4, 5, 7, 8, 10, 11, 13, 14};

  for (int i : black) {
    preSpin(96, 80, 77 - i * 2);
    spin(0, 0, 0, 0);
  }

  int[] red = {3, 6, 9, 12};

  for (int i : red) {
    preSpin(96, 80, 77 - i * 2);
    spin(0, 10, 10, 0);
  }
}

public void drawing6() {

  float step = 2.0F;
  for (int i = 0; i < 5; i++) {
    preSpin(96, 24, 18 - i * step);
    spin(6, 7, 7, 0);
  }

  for (int i = 0; i < 5; i++) {
    preSpin(96, 24, 18 - i * step);
    spin(4, 7, 7, 8); // Mark 2
  }

  for (int i = 0; i < 5; i++) {
    preSpin(96, 24, 18 - i * step);
    spin(0, 10, 10, 16); // Mark 3
  }

  for (int i = 15; i < 20; i++) {
    preSpin(96, 80, 70 - i * step);
    spin(4, 7, 7, 0);
  }

  for (int i = 15; i < 20; i++) {
    preSpin(96, 80, 70 - i * step);
    spin(0, 10, 10, 8); // Mark 2
  }
}

public void drawing7() {

  //speed = 4;
  float step = 2.0F;

  for (int i = 0; i < 9; i++) {

    preSpin(96, 84, 70 - i * step);
    spin(0, 10, 10, i);
    preSpin(96, 84, 70 - (i + 1) * step);
    spin(0, 10, 10, i);
  }
}

public void drawing8() {
  //speed = 2;
  for (int i = 0; i < 3; i++) {
    preSpin(105, 60, 45);
    spin(0, 10, 10, 7 + (float) i / 2);
  }

  for (int i = 0; i < 3; i++) {
    preSpin(105, 60, 45);
    spin(7, 7, 7, -1 + i);
  }
}

public void drawing9() {

  //speed = 2;
  for (int i = 0; i < 5; i++) {
    preSpin(96, 24, 18 - 2 * i);
    spin(0, 0, 0, 0);
  }

  for (int i = 0; i < 5; i++) {
    preSpin(96, 72, 72 - 27);
    spin(0, 10, 10, -2 + i);
  }

  for (int i = 0; i < 2; i++) {
    preSpin(96, 72, 72 - 45 - (i * 2));
    spin(0, 10, 10, 12);
  }

  for (int i = 2; i < 4; i++) {
    preSpin(96, 72, 72 - 45 - (i * 2));
    spin(0, 0, 0, 12);
  }
}

public void drawing10() {

  float step = 6;
  //speed = 3;
  preSpin(96, 63, 63 - step);
  spin(0, 0, 0, 0);

  step += 4;
  preSpin(96, 63, 63 - step);
  spin(7, 7, 7, 0);

  step += 4;
  preSpin(96, 63, 63 - step);
  spin(4.5F, 7, 7, 0);

  step += 4;
  preSpin(96, 63, 63 - step);
  spin(0, 10, 10, 0);
}

public void drawing11() {
  //speed = 3;

  for (int i = 0; i < 8; i++) {

    if (i % 2 == 1) {
      preSpin(105, 56, 48 - (i * 2));
      spin(0, 0, 0, 0);
    } else {
      preSpin(105, 56, 48 - (i * 2));
      spin(0, 10, 10, 0);
    }
  }
}

public void drawing12() {
  //speed = 4;
  for (int i = 0; i < 26; i++) {
    preSpin(105, 84, 70 - (i * 2));
    spin(6, 7, 7, i * 2);
  }
}

public void drawing13() {
  //speed = 4;

  preSpin(105, 24, 5);
  spin(0, 10, 10, 0);

  for (int i = 13; i < 16; i++) {
    preSpin(105, 80, 70 - (i * 2));
    spin(0, 10, 10, 0);
  }
}

public void drawing14() {
  //speed = 4;
  float hole = 62;
  float step = 0;

  preSpin(105, 75, hole - step * 2);
  spin(0, 10, 10, 0);

  step++;

  preSpin(105, 75, hole - step * 2);
  spin(0, 10, 10, -1);

  preSpin(105, 75, hole - step * 2);
  spin(0, 10, 10, 1);

  step++;

  preSpin(105, 75, hole - step * 2);
  spin(7, 7, 7, -2);

  preSpin(105, 75, hole - step * 2);
  spin(7, 7, 7, 2);

  step++;

  preSpin(105, 75, hole - step * 2);
  spin(7, 7, 7, -3);

  preSpin(105, 75, hole - step * 2);
  spin(7, 7, 7, 3);

  step++;

  preSpin(105, 75, hole - step * 2);
  spin(7, 7, 7, -4);

  preSpin(105, 75, hole - step * 2);
  spin(7, 7, 7, 4);


  step++;

  preSpin(105, 75, hole - step * 2);
  spin(0, 10, 10, -5);

  preSpin(105, 75, hole - step * 2);
  spin(0, 10, 10, 5);


  step++;

  preSpin(105, 75, hole - step * 2);
  spin(0, 10, 10, -6);

  preSpin(105, 75, hole - step * 2);
  spin(0, 10, 10, 6);


  step++;

  preSpin(105, 75, hole - step * 2);
  spin(0, 10, 10, -7);

  preSpin(105, 75, hole - step * 2);
  spin(0, 10, 10, 7);
}

public void drawing15() {

  //speed = 4;

  for (int i = 0; i < 3; i++) {
    preSpin(105, 30, 22 - (2 * i));
    spin(0, 0, 0, 0);
  }

  for (int i = 6; i < 9; i++) {
    preSpin(105, 45, 40 - (2 * i));
    spin(4, 7, 7, 0);
  }

  for (int i = 11; i < 14; i++) {
    preSpin(105, 60, 55 - 2 * i);
    spin(0, 10, 10, 0);
  }

  for (int i = 16; i < 19; i++) {
    preSpin(105, 75, 65 - 2 * i);
    spin(7, 7, 7, 0);
  }
}

public void drawing16() {

  speed = 4;
  for (int i = 0; i < 8; i += 2) {
    preSpin(96, 60, 50 - i * 2);
    spin(4, 7, 7, 0);

    preSpin(96, 60, 50 - i * 2);
    spin(7, 7, 7, 6);
  }

  for (int j = 0; j < 4; j++) {

    for (int i = 1; i < 4; i += 2) {
      preSpin(96, 72, 65 - i * 2);
      spin(0, 10, 10, (float) (3 + 6 * j));
    }
  }
}

public void drawing17() {
  //speed = 4;


  preSpin(105, 24, 5);
  spin(0, 0, 0, 0);

  preSpin(105, 36, 7);
  spin(0, 10, 10, 0);

  preSpin(105, 48, 5);
  spin(7, 7, 7, 0);

  preSpin(105, 60, 7);
  spin(4, 7, 7, 0);

  preSpin(105, 60, 7);
  spin(4, 7, 7, 8);

  preSpin(105, 72, 6);
  spin(0, 0, 0, 0);

  preSpin(105, 84, 6);
  spin(0, 10, 10, 0);

  preSpin(105, 84, 6);
  spin(0, 10, 10, 16);
}

public void drawing18() {
  //speed = 1;
  float step = 1.5F;
  preSpin(96, 40, 28 + step);
  spin(0, 0, 0, 0);

  preSpin(96, 56, 44 + step);
  spin(0, 0, 0, 0);

  for (int i = 0; i < 3; i++) {
    preSpin(96, 24, 12 + step);
    spin(0, 0, 0, (i * 8));
  }

  for (int i = 0; i < 4; i++) {
    preSpin(96, 32, 20 + step);
    spin(0, 0, 0, i * 8);
  }

  for (int i = 0; i < 6; i++) {
    preSpin(96, 48, 36 + step);
    spin(0, 0, 0, i * 8);
  }
}

public void drawing19() {
  /*
        144/96 • 60 • (Red) 1-2-3-4-5. Move 4 teeth right and repeat in (Blue), then move 4 teeth
   right and repeat in (Green).
   */

  //speed = 3;
  for (int i = 0; i < 5; i++) {
    preSpin(96, 60, 50 - i * 2);
    spin(0, 10, 10, 0);

    preSpin(96, 60, 50 - i * 2);
    spin(7, 7, 7, 4);

    preSpin(96, 60, 50 - i * 2);
    spin(4, 7, 7, 8);
  }
}

public void drawing20() {
  /*
        144/96 • 60 • (Blue)    1, draw 3 patterns moving 1 tooth right for each.
   (Green)   1, repeat moving one tooth right for each pattern.
   */
  for (int i = 0; i < 3; i++) {
    preSpin(96, 60, 55);
    spin(7, 7, 7, i);
  }
  for (int i = 3; i < 6; i++) {
    preSpin(96, 60, 55);
    spin(4, 7, 7, i);
  }
}

public void drawing21() {
  /*
       144/96 • 40 • (Blue) 1, draw 3 patterns moving 1 tooth right for each.
   56 • (Red)  1, move 2 teeth right of last pattern and draw 3 patterns moving
   1 tooth right for each.
   */


  for (int i = 0; i < 3; i++) {
    preSpin(96, 40, 35);
    spin(7, 7, 7, i);
    preSpin(96, 56, 51);
    spin(0, 10, 10, i + 4);
  }
}

public void drawing22() {
  /*
 Instructions:
   
   144/96 • 30 • (Blue) 1-3-5.
   84 • (Blue) 34-35.
   42 • (Red)  Move 2 teeth right and repeat,
   move 1 tooth right and repeat
   again.
   */
  //speed = 3;
  for (int i = 0; i < 3; i++) {
    preSpin(96, 30, 25 - i * 2);
    spin(7, 7, 7, 0);
  }

  for (int i = 0; i < 2; i++) {
    preSpin(96, 84, 28 - i * 2);
    spin(7, 7, 7, 0);
  }
  for (int j = 0; j < 2; j++) {

    preSpin(96, 42, 13);
    spin(0, 10, 10, j + 2F);
  }
}

public void drawing23() {

  /*
Instructions:
   
   150/105 • 84 • (Blue)   1-2-4-5-26-27-29-30.
   (Red)    3-17-18-20-21.
   */


  int[] blueHoles = {1, 2, 4, 5, 26, 27, 29, 30};
  int[] redHoles = {3, 17, 18, 20, 21};

  for (int i : blueHoles) {
    preSpin(105, 84, 79 - i * 2);
    spin(7, 7, 7, 0);
  }

  for (int i : redHoles) {
    preSpin(105, 84, 79 - i * 2);
    spin(0, 10, 10, 0);
  }
}

public void drawing24() {
  /*
    144/96 • 60 • (Red) 1-2-3-4-5-6. move 6 teeth right. (Green) 1-2-3-4-5.
   */
  //speed = 2;
  for (int i = 0; i < 5; i++) {
    preSpin(96, 60, 50 - i * 2);
    spin(0, 10, 10, 0);
    preSpin(96, 60, 50 - i * 2);
    spin(4, 7, 7, 6);
  }
  preSpin(96, 60, 50 - 5 * 2);
  spin(0, 10, 10, 0);
}

public void drawing25() {
  /*
        150/105 • 80 •  (Red) 6-8-10-14, (Blue) 18, (Green) 12-16.
   */
  //speed = 3;
  int[] redHoles = {6, 8, 10, 14};
  int[] blueHoles = {18};
  int[] greenHoles = {12, 16};

  for (int i : redHoles) {
    preSpin(105, 80, 70 - i * 2);
    spin(0, 10, 10, 0);
  }

  for (int i : blueHoles) {
    preSpin(105, 80, 70 - i * 2);
    spin(7, 7, 7, 0);
  }

  for (int i : greenHoles) {
    preSpin(105, 80, 70 - i * 2);
    spin(4, 7, 7, 0);
  }
}

public void drawing26() {

  /*
        150/105 • 75 •  (Red) 5-8-11-14, (Blue) 6-9-12-15, (Green) 7-10-13-16.
   */

  //speed = 3;
  int[] redHoles = {5, 8, 11, 14};
  int[] blueHoles = {6, 9, 12, 15};
  int[] greenHoles = {7, 10, 13, 16};

  for (int i : redHoles) {
    preSpin(105, 75, 65 - i * 2);
    spin(0, 10, 10, 0);
  }

  for (int i : blueHoles) {
    preSpin(105, 75, 65 - i * 2);
    spin(7, 7, 7, 0);
  }

  for (int i : greenHoles) {
    preSpin(105, 75, 65 - i * 2);
    spin(4, 7, 7, 0);
  }
}

public void drawing27() {

  /*
150/105 • 45 • (Green) 1-3-5-7-9-11-13, then draw (Red) 15-13-11-9-7-6-3-1, moving one tooth right for each hole.
   */
  //speed = 4;
  int iter = 0;

  int[] greenHoles = {1, 3, 5, 7, 9, 11, 13};
  int[] redHoles = {15, 13, 11, 9, 7, 6, 3, 1};

  for (int i : greenHoles) {
    preSpin(105, 45, 40 - i * 2);
    spin(4, 7, 7, iter);
    iter++;
  }

  for (int i : redHoles) {
    preSpin(105, 45, 40 - i * 2);
    spin(0, 10, 10, iter);
    iter++;
  }
}

public void drawing28() {

  /*
        150/105 • 63 • (Red) 16-18-24, (Blue) 17-23-25.  Move to 3rd tooth right of Mark 2 and
   draw (Red) 4-6, (Blue) 5.
   Note:  Mark 2 on the 150/105 ring is at tooth 7.
   */
  int[] redHoles = {16, 18, 24};
  int[] blueHoles = {17, 23, 25};

  for (int i : redHoles) {
    preSpin(105, 63, 58 - i * 2);
    spin(0, 10, 10, 0);
  }
  for (int i : blueHoles) {
    preSpin(105, 63, 58 - i * 2);
    spin(7, 7, 7, 0);
  }

  for (int i = 4; i <= 6; i += 2) {
    preSpin(105, 63, 58 - i * 2);
    spin(0, 10, 10, 10);
  }
  preSpin(105, 63, 58 - 5 * 2);
  spin(7, 7, 7, 10);
}

public void drawing29() {

  /*
        150/105 • 63  • (Red) 4-6, (Blue) 5.
   84  • (Green) 18-20, (Blue) 19,
   move 3 teeth right of Mark 2 (7 + 3) and draw
   (Blue) 18-20 (Red) 19.
   */

  preSpin(105, 63, 58 - 4 * 2);
  spin(0, 10, 10, 0);

  preSpin(105, 63, 58 - 5 * 2);
  spin(7, 7, 7, 0);

  preSpin(105, 63, 58 - 6 * 2);
  spin(0, 10, 10, 0);

  preSpin(105, 84, 79 - 18 * 2);
  spin(4, 7, 7, 0);

  preSpin(105, 84, 79 - 19 * 2);
  spin(7, 7, 7, 0);

  preSpin(105, 84, 79 - 20 * 2);
  spin(4, 7, 7, 0);

  preSpin(105, 84, 79 - 18 * 2);
  spin(7, 7, 7, 10);

  preSpin(105, 84, 79 - 19 * 2);
  spin(0, 10, 10, 10);

  preSpin(105, 84, 79 - 20 * 2);
  spin(7, 7, 7, 10);
}

public void drawing30() {


  /*
        144/96 • 32 •  (Red) 5, draw 8 patterns moving 1 tooth right for each pattern.
   Change color (needs 4, I used orange) and repeat until you have drawn
   8 patterns in each color.
   52 •  (Red) 19.
   84 •  (Red) 25.  (I used black)
   */
  //speed = 3;
  for (int i = 0; i < 8; i++) {
    preSpin(96, 32, 27 - 5 * 2);
    spin(0, 10, 10, i);

    preSpin(96, 32, 27 - 5 * 2);
    spin(4, 7, 7, i + 8);

    preSpin(96, 32, 27 - 5 * 2);
    spin(7, 7, 7, i + 16);

    preSpin(96, 32, 27 - 5 * 2);
    spin(1, 10, 10, i + 24);
  }
  preSpin(96, 52, 47 - 22 * 2);
  spin(0, 9, 9, 0);

  preSpin(96, 84, 79 - 25 * 2);
  spin(0, 0, 0, 0);
}

public void drawing31() {
  /*
        144/96 • 56 • (Red) 4-5-9-10-14-15.
   Move 4 teeth right. (Blue) 1-2-6-7.
   */
  int[] redHoles = {4, 5, 9, 10, 14, 15};
  int[] blueHoles = {1, 2, 6, 7};

  for (int i : redHoles) {
    preSpin(96, 56, 51 - i * 2);
    spin(0, 10, 10, 0);
  }
  for (int i : blueHoles) {
    preSpin(96, 56, 51 - i * 2);
    spin(7, 7, 7, 4);
  }
}

public void drawing32() {

  /*
       150/105 • 75 • (Red) 1-3-6-14, (Green) 10-13-16, (Blue) 2-5-7-9-11.
   */

  int[] red = {1, 3, 6, 14};
  int[] green = {10, 13, 16};
  int[] blue = {2, 5, 7, 9, 11};

  for (int i : red) {
    preSpin(105, 75, 70 - i * 2);
    spin(0, 10, 10, 0);
  }

  for (int i : green) {
    preSpin(105, 75, 70 - i * 2);
    spin(4, 7, 7, 0);
  }

  for (int i : blue) {
    preSpin(105, 75, 70 - i * 2);
    spin(7, 7, 7, 0);
  }
}

public void drawing33() {

  /*
        155/105 • 75 •  (Red) 2-7-10-16-22.
   (Green) 4-13-19-25.  (I changed it to blue)
   */
  //speed = 3;
  int[] red = {2, 7, 10, 16, 22};
  int[] green = {4, 13, 19, 25};

  for (int i : red) {
    preSpin(105, 75, 70 - i * 2);
    spin(0, 10, 10, 0);
  }

  for (int i : green) {
    preSpin(105, 75, 70 - i * 2);
    spin(7, 7, 7, 0);
  }
}

public void drawing34() {

  /*
        150/105 • 60(?) • (Black) 10-12, (BLue) 14-16,
   (Green) 18-20, (Red) 9-22-23.
   */

  int[] black = {10, 12};
  int[] blue = {14, 16};
  int[] green = {18, 20};
  int[] red = {9, 22, 23};

  for (int i : black) {
    preSpin(105, 60, 55 - i * 2);
    spin(0, 0, 0, 0);
  }
  for (int i : blue) {
    preSpin(105, 60, 55 - i * 2);
    spin(7, 7, 7, 0);
  }
  for (int i : green) {
    preSpin(105, 60, 55 - i * 2);
    spin(4, 7, 7, 0);
  }
  for (int i : red) {
    preSpin(105, 60, 55 - i * 2);
    spin(0, 10, 10, 0);
  }
}

public void drawing35() {
  /*
        144/96 • 80 • (Red) 2-6-21, (Blue) 4-23
   64 • (Red) 3 at mark 3 of ring.  (tooth 8)
   (Blue 1 at mark 3 of ring. (tooth 8)
   */
  //speed = 3;
  int[] red = {2, 6, 21};
  int[] blue = {4, 23};

  for (int i : red) {
    preSpin(96, 80, 75 - i * 2);
    spin(0, 10, 10, 0);
  }
  for (int i : blue) {
    preSpin(96, 80, 75 - i * 2);
    spin(7, 7, 7, 0);
  }

  preSpin(96, 64, 59 - 2 * 3);
  spin(0, 10, 10, 8);

  preSpin(96, 64, 59 - 2);
  spin(7, 7, 7, 8);
}

public void drawing36() {

  /*
        144/96 • 84 • (Red) 1-14, repeat at Mark 3 of ring (tooth 16).  Then at Mark 2,
   draw (Red) 1-27.
   56 •  (Blue 2-15, move 4 teeth right and draw (Red) 2.
   */

  preSpin(96, 84, 79 - 1);
  spin(0, 10, 10, 0);

  preSpin(96, 84, 79 - 1);
  spin(0, 10, 10, 16);

  preSpin(96, 84, 79 - 14 * 2);
  spin(0, 10, 10, 0);

  preSpin(96, 84, 79 - 14 * 2);
  spin(0, 10, 10, 16);

  preSpin(96, 84, 79 - 2);
  spin(0, 10, 10, 8);

  preSpin(96, 84, 79 - 27 * 2);
  spin(0, 10, 10, 8);

  preSpin(96, 56, 51 - 2 * 2);
  spin(7, 7, 7, 0);

  preSpin(96, 56, 51 - 15 * 2);
  spin(7, 7, 7, 0);

  preSpin(96, 56, 51 - 2 * 2);
  spin(0, 10, 10, 4);
}

public void drawing37() {
  /*
        144/96 • 32 • (Red) 1, draw 8 patterns moving one tooth right for each pattern.
   Change color and repeat until you have drawn 8 patterns in each
   of the 4 colors.
   */
  //speed = 1;
  for (int i = 0; i < 8; i++) {
    preSpin(96, 32, 27);
    spin(0, 10, 10, i);

    preSpin(96, 32, 27);
    spin(4, 7, 7, i + 8);

    preSpin(96, 32, 27);
    spin(7, 7, 7, i + 8 * 2);

    preSpin(96, 32, 27);
    spin(1, 10, 10, i + 8 * 3);
  }
}

public void drawing38() {

  //speed = 4;

  turn(105, 56, 51, 0, 3);
  turn(105, 84, 79, 0, 3);
  turn(105, 84, 79, 7, 3);
  turn(105, 84, 79, 14, 3);
  int[] blue = {1, 3, 6, 8};

  for (int i : blue) {
    turn(105, 42, 37 - i * 2, 0, 3);
    turn(105, 42, 37 - i * 2, 7, 3);
    turn(105, 42, 37 - i * 2, 14, 3);
  }
  int[] blue2 = {10, 12, 14};

  for (int i : blue2) {
    turn(105, 63, 58 - i * 2, 0, 3);
    turn(105, 63, 58 - i * 2, 7, 3);
    turn(105, 63, 58 - i * 2, 14, 3);
  }
}

public void drawing39() {

  int[] red = {1, 3, 6, 9, 21};
  int[] blue = {12, 15};

  for (int i : red) {
    turn(105, 56, 51 - i * 2, 0, 1);
  }
  for (int i : blue) {
    turn(105, 56, 51 - i * 2, 0, 3);
  }
}

public void drawing40() {
  //speed = 4;

  turn(105, 80, 75 - 2, 0, 1);
  turn(105, 80, 75 - 30 * 2, 0, 1);
  turn(105, 80, 75 - 5 * 2, 0, 3);
  turn(105, 80, 75 - 2 * 3, 0, 2);
}

public void drawing41() {

  // R=105;

  int[] blue = {5, 6, 7};
  int[] green = {9, 10, 11};
  int[] red = {1, 2, 3, 13, 14, 15};

  for (int i : blue) {
    turn(105, 45, 40 - i * 2, 0, 3);
  }

  for (int i : green) {
    turn(105, 45, 40 - i * 2, 0, 2);
  }

  for (int i : red) {
    turn(105, 45, 40 - i * 2, 0, 1);
  }
}

public void drawing42() {

  //speed = 4;

  int[] red = {9, 12, 15, 16};
  int[] blue = {10, 13};
  int[] green = {11, 14, 17, 20};


  for (int i : red) {
    turn(105, 80, 75 - i * 2, 0, 1);
  }

  for (int i : blue) {
    turn(105, 80, 75 - i * 2, 0, 3);
    ;
  }
  for (int i : green) {
    turn(105, 80, 75 - i * 2, 0, 2);
  }
}

public void drawing43() {

  int[] holes = {1, 9, 19};
  for (int j = 0; j < 5; j++) {
    for (int i : holes) {
      turn(96, 64, 59 - i * 2, j * 6, j + 1);
    }
  }
}

public void drawing44() {

  //speed = 3;

  turn(96, 75, 70 - 2, 0, 3);
  turn(96, 75, 70 - 25 * 2, 0, 2);

  turn(96, 63, 58 - 2 * 2, 0, 2);

  turn(96, 52, 47 - 14 * 2, 0, 3);
}

public void drawing45() {

  //speed = 3;
  int[] black = {15, 16, 18, 22, 23};
  int[] red1 = {3, 4, 5};
  int[] red2 = {15, 18, 22};
  float RT = 105;

  for (int i : black) {
    turn(RT, 63, 58 - i * 2, 0, 0);
  }

  for (int i : red1) {
    turn(RT, 63, 58 - i * 2, 0, 1);
  }
  for (int i : red2) {
    turn(RT, 84, 79 - i * 2, 10, 1);
  }

  turn(RT, 24, 19 - 8, 0, 1);
}

public void drawing46() {

  //speed = 4;
  float RT = 105;

  turn(RT, 24, 24, 0, 1);

  turn(RT, 24, 22, 0, 2);
  turn(RT, 24, 23, 0, 2);

  turn(RT, 36, 25, 0, 1);

  turn(RT, 48, 32, 0, 1);

  turn(RT, 72, 72 - 24, 0, 2);
}

public void drawing47() {

  //speed = 5;

  float rt = 105;

  turn(rt, 52, 47 - 2, 0, 2);
  turn(rt, 52, 47 - 15, 0, 3);
  turn(rt, 24, 18, 0, 3);
}

public void drawing48() {

  //speed = 4;
  float rg = 105;
  float rt = 45;
  float dt = 40;
  turn(rg, rt, dt - 2, 0, 0);
  for (int i = 1; i <= 7; i++) {
    turn(rg, rt, dt - i * 4, i, 1);
    turn(rg, rt, dt - i * 4, -i, 3);
  }
}

public void drawing49() {

  //speed = 6;
  float rt = 105;

  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 3; i++) {
      turn(rt, 45, 40 - i * 2, j * 5, 1);
      turn(rt, 45, 40 - ((i + 4) * 2), j * 5, 3);
    }
  }
  int[] red = {12, 14, 16, 18};
  for (int i : red) {
    turn(rt, 80, 80 - i * 2, 0, 1);
  }
  turn(rt, 75, 70 - 31 * 2, 0, 3);
}

public void drawing50() {
  //speed = 4;

  float R = 96;

  int[] red = {1, 4, 2};

  for (int i : red) {
    turn(R, 30, 25 - i * 2, 0, 1);
  }
  turn(R, 30, 25 - 5 * 2, 0, 3);

  turn(R, 60, 55 - 2 * 2, 0, 2);
  turn(R, 60, 55 - 24 * 2, 0, 2);
  turn(R, 60, 55 - 3 * 2, 0, 1);
}

public void drawing51() {
  //speed = 3;
  float R = 105;
  float r = 42;
  float d = 35;
  for (int i = 0; i < 21; i += 2) {
    turn(R, r, d, i, 3);
    turn(R, r, d, i + 1, 2);
  }
}

public void drawing52() {
  //speed = 3;
  float R = 105;

  int[] red = {1, 2, 8, 9, 15, 16, 22, 23};
  int[] black = {1, 8, 15, 22};

  for (int i : red) {
    turn(R, 84, 79 - i * 2, 10, 1);
  }
  for (int i : black) {
    turn(R, 63, 58 - i * 2, 0, 0);
  }
}

public void drawing53() {
  //speed = 4;
  float R = 105;

  int[] blue = {1, 2, 3, 26, 28};
  int[] red = {5, 6, 7, 22, 24};


  for (int i : blue) {
    if (i > 20) {
      turn(R, 75, 70 - i * 2, 0, 3);
    } else {
      turn(R, 30, 25 - i * 2, 0, 3);
    }
  }

  for (int i : red) {
    if (i > 20) {
      turn(R, 75, 70 - i * 2, 0, 1);
    } else {
      turn(R, 30, 25 - i * 2, 0, 1);
    }
  }
  turn(R, 60, 55 - 2, 8, 1);
  turn(R, 60, 55 - 2 * 2, 8, 3);
  turn(R, 60, 55 - 2 * 3, 8, 1);
}

public void drawing54() {

  //speed = 5;
  float R = 96;
  float r = 52;
  int[] blue = {5, 6, 7};
  int[] red = {6, 7};


  for (int i : blue) {

    turn(R, r, 47 - i * 2, 0, 3);
  }

  for (int i : red) {
    turn(R, r, 47 - i * 2, 2, 1);
  }
  turn(R, r, 47 - 5 * 2, 2, 3);
}

public void drawing55() {
  float R = 96;
  float r = 84;

  for (int i = 0; i < 3; i++) {
    turn(R, r, 79 - i * 2, 0, 0);
    turn(R, r, 79 - (i + 9) * 2, 0, 3);
    turn(R, r, 79 - (i + 21) * 2, 0, 1);
  }
  turn(R, r, 79 - 35 * 2, 0, 2);
  turn(R, r, 79 - 35 * 2, 2, 2);
  turn(R, r, 79 - 35 * 2, 4, 3);
}

public void drawing56() {
  float RR = 96;
  float rr = 72;
  int iter2 = 0;

  for (int i = 1; i < 7; i++) {
    turn(RR, rr, 67 - i * 2, iter2, 3);
    iter2++;
  }

  for (int i = 7; i > 0; i--) {
    turn(RR, rr, 67 - i * 2, iter2, 1);
    iter2++;
  }

  for (int i = 2; i <= 7; i++) {
    turn(RR, rr, 67 - i * 2, iter2, 2);
    iter2++;
  }

  for (int i = 6; i > 1; i--) {
    turn(RR, rr, 67 - i * 2, iter2, 0);
    iter2++;
  }
}

public void drawing57() {
  //speed = 3;
  float R = 96;
  int tooth = 0;
  for (int i = 0; i < 3; i++) {

    turn(R, 60, 55 - i * 2, 0, 1);
    turn(R, 60, 55 - i * 2, 2, 1);
    turn(R, 84, 79 - i * 2, 4, 3);
    turn(R, 84, 79 - i * 2, 6, 3);
    turn(R, 36, 31 - i * 2, 8, 2);
    turn(R, 36, 31 - i * 2, 10, 2);
  }
}

public void drawing58() {
  scale = 1.5F;

  float R = 150;
  turn(R, -80, 75, 0, 3);
  turn(R, -80, 75, 1, 3);
  turn(R, -80, 75, -1, 3);
  turn(R, -80, 75, 3, 1);
  turn(R, -80, 75, 4, 1);
  turn(R, -80, 75, 6, 2);
  turn(R, -80, 75, 7, 2);
}

public void drawing59() {

  scale = 1.5F;
  //speed = 2;
  turn(144, 72, 72, 0, -1);
  for (int i = 0; i < 9; i++) {
    turn(144, -72, 67, i - 4, 0);
    turn(144, -72, 67, i - 4 + 36, 1);
    turn(144, -72, 67, i - 4 + 36 + 18, 2);
    turn(144, -72, 67, i - 4 + 18, 3);
  }
  turn(96, 52, 40, 0, 2);

  turn(84, -40, 35 - 15 * 2, 0, 3);
}

public void drawing60() {

  //turn(96, 24, 19, 0 , -1);
  scale = 4;
  for (int i = 0; i < 5; i++) {
    turn(96, 36, 31, -2 + i, 1);
  }
  turn(96, 36, 31, 0, 2);
}

public void drawing61() {

  for (int i = 0; i < 5; i++) {
    turn(96, 42, 42, i - 4, 1);
  }
}

public void drawing62() {
  fafo = 0;

  turn(96, 48, 48, 0, 1);
  fafo = 90;  // yes, that's exactly what fafo stands for. ;)

  turn(96, 48, 48, 0, 3);

  fafo = 45;

  turn(96, 48, 48, 0, 2);

  fafo += 90;

  turn(96, 48, 48, 0, 4);
}

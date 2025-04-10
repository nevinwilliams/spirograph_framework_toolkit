
import java.util.ArrayList;

static float[] pos0 = new float[3];
static float[] pos1 = new float[3];

static float R;

float r;

float d;
static int counter = 0;
float zAngle = -90.0F;
static int stage = 0;
static float scale = 5.0F;
static float thickness = 2.0F;
static float toothDegree;
static float[] hsb = new float[3];
static int speed = 1;
static float transparency = 1.0F;
static boolean ringSet = false;
static boolean wasRun = false;
static int drawingInc = 0;

static float fafo = 0;

static ArrayList<float[]> pointList = new ArrayList<>();
static ArrayList<Integer> stageRange = new ArrayList<>();
static ArrayList<float[]> stageColor = new ArrayList<>();
static ArrayList<Float> stageTooth = new ArrayList<>();




public void setup() {
  //  size(1000, 1000, P3D);
  fullScreen(P3D);
  smooth();
  background(224);
  // background(0);
  colorMode(HSB, 10, 10, 10, 1.0F);
  frameRate(1000.0F);
  strokeCap(SQUARE);

  println("Press 'B' to backup, any key to advance through drawings.");
  drawingInc = 4;
  speed=5;
  drawing4();
  //  drawingSpecial105_52();  // special case for colors that change mid-draw.
}// setup end

public void draw() {
  translate(width / 2.0F, height / 2.0F);
  rotateZ(radians(zAngle));

  strokeWeight(thickness);

  if (counter < pointList.size() - 2) {


    pos0 = pointList.get(counter);
    pos1 = pointList.get(counter + 1);
    stage = (int) pos0[2];
    int nextStage = (int) pos1[2];
    if (nextStage != stage) {
      counter++;
    } else {
      rotateZ(radians(stageTooth.get(stage)));
      colorStroke(stageColor.get(stage));
      line(pos0[0], pos0[1], pos1[0], pos1[1]);
      wasRun = true;
      counter++;
    }
  }
} // draw method end

void keyPressed() {

  if (key == 'b' || key == 'B') {
    drawingInc--;
  } else {
    drawingInc++;
  }

  println(drawingInc);
  pushMatrix();

  switch(drawingInc) {
  case 0:
    resetVars();
    drawing();

    popMatrix();
    break;

  case 1:
    resetVars();
    drawing1();

    popMatrix();
    break;

  case 2:
    resetVars();
    drawing2();

    popMatrix();
    break;

  case 3:
    resetVars();
    drawing62();

    popMatrix();
    break;

  case 4:
    resetVars();
    drawing4();

    popMatrix();
    break;

  case 5:
    resetVars();
    drawing5();

    popMatrix();
    break;

  case 6:
    resetVars();
    drawing6();
    popMatrix();
    break;

  case 7:
    resetVars();
    drawing7();
    popMatrix();
    break;

  case 8:
    resetVars();
    drawing8();
    popMatrix();
    break;

  case 9:
    resetVars();
    drawing9();
    popMatrix();
    break;

  case 10:
    resetVars();
    drawing10();
    popMatrix();
    break;

  case 11:
    resetVars();
    drawing11();
    popMatrix();
    break;

  case 12:
    resetVars();
    drawing12();
    popMatrix();
    break;

  case 13:
    resetVars();
    drawing13();
    popMatrix();
    break;

  case 14:
    resetVars();
    drawing14();
    popMatrix();
    break;

  case 15:
    resetVars();
    drawing15();
    popMatrix();
    break;

  case 16:
    resetVars();
    drawing16();
    popMatrix();
    break;

  case 17:
    resetVars();
    drawing17();
    popMatrix();
    break;

  case 18:
    resetVars();
    drawing18();
    popMatrix();
    break;

  case 19:
    resetVars();
    drawing19();
    popMatrix();
    break;

  case 20:
    resetVars();
    drawing20();
    popMatrix();
    break;

  case 21:
    resetVars();
    drawing21();
    popMatrix();
    break;

  case 22:
    resetVars();
    drawing22();
    popMatrix();
    break;

  case 23:
    resetVars();
    drawing23();
    popMatrix();
    break;

  case 24:
    resetVars();
    drawing24();
    popMatrix();
    break;

  case 25:
    resetVars();
    drawing25();
    popMatrix();
    break;

  case 26:
    resetVars();
    drawing26();
    popMatrix();
    break;

  case 27:
    resetVars();
    drawing27();
    popMatrix();
    break;

  case 28:
    resetVars();
    drawing28();
    popMatrix();
    break;

  case 29:
    resetVars();
    drawing29();
    popMatrix();
    break;

  case 30:
    resetVars();
    drawing30();
    popMatrix();
    break;

  case 31:
    resetVars();
    drawing31();
    popMatrix();
    break;

  case 32:
    resetVars();
    drawing32();
    popMatrix();
    break;

  case 33:
    resetVars();
    drawing33();
    popMatrix();
    break;

  case 34:
    resetVars();
    drawing34();
    popMatrix();
    break;

  case 35:
    resetVars();
    drawing35();
    popMatrix();
    break;

  case 36:
    resetVars();
    drawing36();
    popMatrix();
    break;

  case 37:
    resetVars();
    drawing37();
    popMatrix();
    break;

  case 38:
    resetVars();
    drawing38();
    popMatrix();
    break;

  case 39:
    resetVars();
    drawing39();
    popMatrix();
    break;

  case 40:
    resetVars();
    drawing40();
    popMatrix();
    break;

  case 41:
    resetVars();
    drawing41();
    popMatrix();
    break;

  case 42:
    resetVars();
    drawing42();
    popMatrix();
    break;

  case 43:
    resetVars();
    drawing43();
    popMatrix();
    break;

  case 44:
    resetVars();
    drawing44();
    popMatrix();
    break;

  case 45:
    resetVars();
    drawing45();
    popMatrix();
    break;

  case 46:
    resetVars();
    drawing46();
    popMatrix();
    break;

  case 47:
    resetVars();
    drawing47();
    popMatrix();
    break;

  case 48:
    resetVars();
    drawing48();
    popMatrix();
    break;

  case 49:
    resetVars();
    drawing49();
    popMatrix();
    break;

  case 50:
    resetVars();
    drawing50();
    popMatrix();
    break;

  case 51:
    resetVars();
    drawing51();
    popMatrix();
    break;

  case 52:
    resetVars();
    drawing52();
    popMatrix();
    break;

  case 53:
    resetVars();
    drawing53();
    popMatrix();
    break;

  case 54:
    resetVars();
    drawing54();
    popMatrix();
    break;

  case 55:
    resetVars();
    drawing55();
    popMatrix();
    break;

  case 56:
    resetVars();
    drawing56();
    popMatrix();
    break;

  case 57:
    resetVars();
    drawing57();
    popMatrix();
    break;

  case 58:
    resetVars();
    drawing58();
    popMatrix();
    break;

  case 59:
    resetVars();
    drawing59();
    popMatrix();
    break;

  case 60:
    resetVars();
    drawing60();
    popMatrix();
    break;

  case 61:
    resetVars();
    drawing61();
    popMatrix();
    break;

  case 62:
    resetVars();
    drawing62();
    popMatrix();
    break;

  case 63:
    resetVars();
    drawingSpecial105_52();
    popMatrix();
    break;

  default:
    resetVars();
    drawingInc = 0;
    drawing();
    popMatrix();
    break;
  }
}

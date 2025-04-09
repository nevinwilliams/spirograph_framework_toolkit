
import java.util.ArrayList;

static float[] pos0 = new float[3];
static float[] pos1 = new float[3];

static float R;

float r;

float d;
static int counter = 0;
float zAngle = -90.0F;
static int stage = 0;
static float scale = 4.0F;
static float thickness = 2.0F;
static float toothDegree;
static float[] hsb = new float[3];
static int speed = 1;
static float transparency = 1.0F;
static boolean ringSet = false;
static boolean wasRun = false;

static float fafo = 0;

static ArrayList<float[]> pointList = new ArrayList<>();
static ArrayList<Integer> stageRange = new ArrayList<>();
static ArrayList<float[]> stageColor = new ArrayList<>();
static ArrayList<Float> stageTooth = new ArrayList<>();




public void setup() {
  size(1000, 1000, P3D);
  smooth();
  background(127 + 64 + 32);
  // background(0);
  colorMode(HSB, 10, 10, 10, 1.0F);
  frameRate(1000.0F);
  strokeCap(SQUARE);


  drawing();
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

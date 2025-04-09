public float[] hypotrochoid(float degree) {
  float[] xy = new float[3];

  float x;
  float y;


  x = ((R - r) * cos(radians(degree))) + (d * cos(radians(((R - r) / r) * degree - fafo*2)));
  y = ((R - r) * sin(radians(degree))) - (d * sin(radians(((R - r) / r) * degree - fafo*2)));
  xy[0] = x;
  xy[1] = y;
  xy[2] = (float) stage;
  return xy;
}

public float[] setColor(int colorNum) {

  switch (colorNum) {
  case 1:
    return  new float[]{0, 10, 10};  // Red
  case 2:
    return  new float[]{4, 7, 7};   // Green
  case 3:
    return  new float[]{7, 7, 7};  // Blue
  case 4:
    return  new float[]{1, 10, 10}; // Orange
  case 0:
    return  new float[]{0, 0, 0};  // Black
  case -1:
    return  new float[]{0, 0, 10}; // White
  default:
    return  new float[]{1, 0, 0}; // Defaults black.
  }
}

public int gcd(int r, int R) {  // Greatest Common Denominator
  if (R == 0) return r;
  return gcd(R, r % R);
}

public void stageAdd() {
  stageRange.add(pointList.size() - 1);
}

public void spin(float hue, float sat, float bright, float tooth) {
  hsb[0] = hue;
  hsb[1] = sat;
  hsb[2] = bright;
  toothDegree = 360.0F / (R / scale);
  stageColor.add(hsb.clone());
  stageTooth.add(tooth * toothDegree);
  stageAdd();
}

public void preTurn(int colorChar, float tooth, float RT) {
  hsb = setColor(colorChar);
  stageColor.add(hsb.clone());
  toothDegree = 360.0F / RT;
  stageTooth.add(tooth * toothDegree);
  stageAdd();
}

public void colorStroke(float[] hsb) {
  float h = hsb[0];
  float s = hsb[1];
  float b = hsb[2];

  stroke(h, s, b, transparency);
}

public void preSpin(float RT, float rT, float dT) {

  R = RT * scale;
  r = rT * scale;
  d = dT * scale;

  toothDegree = 360.0F / RT;
  float iter = 360 * abs(r / gcd((int) r, (int) R));
  pos0 = hypotrochoid(0);

  for (int i = 0; i < iter; i += speed) {
    pos0 = hypotrochoid(i);
    pointList.add(pos0);
  }
  pointList.add(hypotrochoid(0)); // two extra degree 0 points to ensure drawing
  pointList.add(hypotrochoid(0)); // finishes with no gaps.
  stage++;
}

public void turn(float RT, float rT, float dT, float tooth, int colorNum) {

  preTurn(colorNum, tooth, RT);

  R = RT * scale;
  r = rT * scale;
  d = dT * scale;


  float iter = 360 * abs(r / gcd((int) r, (int) R));
  pos0 = hypotrochoid(0);

  for (int i = 0; i < iter; i += speed) {
    pos0 = hypotrochoid(i);
    pointList.add(pos0);
  }
  pointList.add(hypotrochoid(0));  // pads with finishing points to
  pointList.add(hypotrochoid(0));  // ensure completeness.
  stage++;
}

public void turnSpecial(float RT, float rT, float dT, float tooth, int colorNum) {

  preTurn(1, tooth, RT);

  R = RT * scale;
  r = rT * scale;
  d = dT * scale;


  float iter = (360 * abs(r / gcd((int) r, (int) R)))/3.0F;
  pos0 = hypotrochoid(0);

  for (int i = 0; i < iter; i += speed) {
    pos0 = hypotrochoid(i);
    pointList.add(pos0);
  }
  //  pointList.add(hypotrochoid(0));  // pads with finishing points to
  //  pointList.add(hypotrochoid(0));  // ensure completeness.
  stage++;

  preTurn(2, tooth, RT);

  for (int i = (int)iter; i < iter*2; i += speed) {
    pos0 = hypotrochoid(i);
    pointList.add(pos0);
  }
  // pointList.add(hypotrochoid(0));  // pads with finishing points to
  // pointList.add(hypotrochoid(0));  // ensure completeness.
  stage++;

  preTurn(3, tooth, RT);

  for (int i = (int)iter*2; i < iter*3; i += speed) {
    pos0 = hypotrochoid(i);
    pointList.add(pos0);
  }
  pointList.add(hypotrochoid(0));  // pads with finishing points to
  pointList.add(hypotrochoid(0));  // ensure completeness.
  stage++;
}

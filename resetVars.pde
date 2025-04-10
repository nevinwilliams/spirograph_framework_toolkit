void resetVars() {

  pointList.clear();
  counter = 0;
  stageRange.clear();
  stageColor.clear();
  stageTooth.clear();
  background(0, 0, 8.75);
  stage = 0;
  scale = 4.0F;
  speed = 5;
  //resetMatrix();
  //translate(width / 2.0F, height / 2.0F);
  //rotateZ(radians(zAngle));
}

void message() {
  
  textSize(30);
  fill(0,0,0);
  text("Testing " + drawingInc + " press 'B' to backup, any key for next.", 0, 0, width, 30); 
  
}

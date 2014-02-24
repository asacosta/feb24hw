int[] answers;

void setup() {
  size(600, 600);
  smooth(8);
  loadData();
  answers = sort(answers);
  println(answers);
}

void draw() {
  background(255);
  drawCircles(answers);
}

void drawGraph(int[] numbers) {
  for (int i = 0; i < numbers.length; i++) {
    int n = numbers[i];
    float x = map(i, 0, numbers.length, 100, width - 100);
    float y = height - 100;
    float w = 5;
    float h = -map(n, 0, 10, 0, height - 100);
    rect(x, y, w, h);
  }
}


void drawCircles(int[] numbers) {
  for (int i = 0; i < numbers.length; i++) {
    int n = numbers[i];
    float x = map(i, 0, numbers.length, 1500, width-500);
    float y = height/2;
    float d = map(n, 0, sqrt(1), 0, sqrt(400));
    fill(50, 200, 200, 50);
    noStroke();
    ellipse(x, y, d, d);
  }
}

void loadData() {
  Table data = loadTable("data.csv", "header");
  answers = new int[data.getRowCount()];

  for (int i = 0; i < data.getRowCount(); i++) {

    answers[i] = data.getRow(i).getInt(1);
  }
}


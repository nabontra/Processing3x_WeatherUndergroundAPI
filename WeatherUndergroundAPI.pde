JSONObject json;

void setup() {
  size(800, 600);  //set the display size
  
}

void draw() {
  background(0);
  json = loadJSONObject("http://api.wunderground.com/api/xxx/conditions/q/TX/Fort_Worth.json");  //insert your API id instead of xxx

  JSONObject current_observation = json.getJSONObject("current_observation");  //this is a top-level object
  JSONObject display_location = json.getJSONObject("current_observation").getJSONObject("display_location");  //this object is nested, so you have to do JSON-ception.

  float temp_f = current_observation.getFloat("temp_f");
  float wind_degrees = current_observation.getFloat("wind_degrees");
  float pressure_in = current_observation.getFloat("pressure_in");
  float wind_kph = current_observation.getFloat("wind_kph");
  float visibility_mi = current_observation.getFloat("visibility_mi");
  
  String city = display_location.getString("full");  //some objects are stored as strings
  textSize(22);
  text("Here is some weather information from the city of "+city+"!", 50, 120);
  textSize(14);
  text("Temperature (F):" + temp_f + ", Wind (degrees):" + wind_degrees, 50, 50);
  text("Pressure (in):" + pressure_in + ", Wind (kph):" + wind_kph, 50, 70);
  text("Visibility (mi):" + visibility_mi, 50, 90);
  ellipse(300, 300, temp_f*2, pressure_in*2);  //example of using stored data to draw shapes
  
  delay(6500); //the free API usage allows 10 calls per minute
}
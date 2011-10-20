/* a sighting is owned by a place */
class Sighting {
  String description;
  SightingType type;
  float airportDist;
  float militaryDist;
  Date localTime;
  Place location;
  
  Sighting(String desc, SightingType type, float airportDist, float milDist, Date localTime, Place location) {
    this.description = desc;
    this.type = type;
    this.airportDist = airportDist;
    this.militaryDist = milDist;
    this.localTime = localTime;
    this.location = location;
  }
}


class SightingType {
  PImage icon;
  color colr;
  String name;
  
  SightingType(PImage icon, color colr, String name) {
    this.icon = icon;
    this.colr = colr;
    this.name = name;
  }
}

class Place {
  int type;  /* city, airport, military base */
  Location loc;
  String name;
  
  Place(int type, Location loc, String name) {
    this.type = type;
    this.loc = loc;
    this.name = name;
  }
}


interface SightingTable {
  Iterator<Sighting> activeSightingIterator();
}

class DummySightingTable implements SightingTable {
  ArrayList<Sighting> sightingList;
  
  DummySightingTable() {
      sightingList = new ArrayList<Sighting>();
    Place chicago = new Place(0, new Location(41.881944,-87.627778), "Chicago");
    PImage image_ = loadImage(UFOImages[0]);
    SightingType fruit = new SightingType(image_, UFOColors[0], UFOTypeLabels[0]);
    sightingList.add(new Sighting("A flying pineapple", fruit, 0.1, 0.2, new Date(), chicago));
    image_ = loadImage(UFOImages[1]);
    Place newYork = new Place(0, new Location(40.664274,-73.938500), "New York");
    SightingType circle = new SightingType(image_, UFOColors[1], UFOTypeLabels[1]);
    sightingList.add(new Sighting("A flying circle", circle, 0.3, 0.3, new Date(), newYork));
  }
  
  Iterator<Sighting> activeSightingIterator() {
    return sightingList.iterator();
  }
}


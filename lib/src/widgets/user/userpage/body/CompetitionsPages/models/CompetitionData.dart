class CompetitionModel {
  final String description, iconUrl, location, title, cost, date;
  final List<String> photos;

  CompetitionModel(
      {this.photos,
      this.description,
      this.iconUrl,
      this.location,
      this.cost,
      this.date,
      this.title});
}

abstract class ListItem {}

class NewCompetitionModel implements ListItem {
  final String description, iconUrl, location, title, cost, date, key;
  final List<String> photos;

  NewCompetitionModel(
      {this.photos,
      this.description,
      this.iconUrl,
      this.location,
      this.cost,
      this.date,
      this.key,
      this.title});
}

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

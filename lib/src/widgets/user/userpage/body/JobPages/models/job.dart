class JobModel {
  final String description, iconUrl, location, salary, title, key;
  final List<String> photos;

  JobModel(
      {this.photos,
      this.description,
      this.iconUrl,
      this.location,
      this.salary,
      this.key,
      this.title});
}

abstract class ListItem {}

class NewJobModel implements ListItem {
  final String description, iconUrl, location, salary, title, key;
  final List<String> photos;

  NewJobModel(
      {this.photos,
      this.description,
      this.iconUrl,
      this.location,
      this.salary,
      this.key,
      this.title});
}

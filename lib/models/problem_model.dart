class ProblemModel {
  String? client;
  String? description;
  String? problem;
  String? type;

  ProblemModel({this.client, this.description, this.problem, this.type});

  ProblemModel.fromJson(Map<String, dynamic> json) {
    client = json['client'];
    description = json['description'];
    problem = json['problem'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client'] = this.client;
    data['description'] = this.description;
    data['problem'] = this.problem;
    data['type'] = this.type;
    return data;
  }
}



class ProblemModel2 {
  String? client;
  String? description;

  ProblemModel2({this.client, this.description});

  ProblemModel2.fromJson(Map<String, dynamic> json) {
    client = json['client'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client'] = this.client;
    data['description'] = this.description;
    return data;
  }
}
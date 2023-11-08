class ProblemModel {

  String? id;
  String? client;
  String? description;
  String? problem;
  String? type;

  ProblemModel({required this.id ,this.client, this.description, this.problem, this.type});

  ProblemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    client = json['client'];
    description = json['description'];
    problem = json['problem'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client'] = this.client;
    data['description'] = this.description;
    data['problem'] = this.problem;
    data['type'] = this.type;
    return data;
  }
}



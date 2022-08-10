import 'package:cicgreenloan/modules/get_funding/models/cash_flow_model.dart';

class FilesModel {
  List<FileForm>? cashFlowStatement;
  List<FileForm>? companyPatentDoc;
  List<FileForm>? companyLicenceDoc;
  List<FileForm>? companyMoCCertificate;
  List<FileForm>? businessPlan;
  List<FileForm>? articleOfIncorporation;
  List<FileForm>? incomeStatement;
  List<FileForm>? balanceSheet;
  List<FileForm>? marketStudyDocs;
  List<FileForm>? otherDocument;

  FilesModel(
      {this.cashFlowStatement,
      this.companyPatentDoc,
      this.companyLicenceDoc,
      this.companyMoCCertificate,
      this.businessPlan,
      this.articleOfIncorporation,
      this.incomeStatement,
      this.balanceSheet,
      this.marketStudyDocs,
      this.otherDocument});

  FilesModel.fromJson(Map<String, dynamic> json) {
    if (json['cash_flow_statement'] != null) {
      cashFlowStatement = <FileForm>[];
      json['cash_flow_statement'].forEach((v) {
        cashFlowStatement!.add(FileForm.fromJson(v));
      });
    }
    if (json['company_patent_doc'] != null) {
      companyPatentDoc = <FileForm>[];
      json['company_patent_doc'].forEach((v) {
        companyPatentDoc!.add(FileForm.fromJson(v));
      });
    }
    if (json['company_licence_doc'] != null) {
      companyLicenceDoc = <FileForm>[];
      json['company_licence_doc'].forEach((v) {
        companyLicenceDoc!.add(FileForm.fromJson(v));
      });
    }
    if (json['company_MoC_certificate'] != null) {
      companyMoCCertificate = <FileForm>[];
      json['company_MoC_certificate'].forEach((v) {
        companyMoCCertificate!.add(FileForm.fromJson(v));
      });
    }
    if (json['business_plan'] != null) {
      businessPlan = <FileForm>[];
      json['business_plan'].forEach((v) {
        businessPlan!.add(FileForm.fromJson(v));
      });
    }
    if (json['article_of_incorporation'] != null) {
      articleOfIncorporation = <FileForm>[];
      json['article_of_incorporation'].forEach((v) {
        articleOfIncorporation!.add(FileForm.fromJson(v));
      });
    }
    if (json['income_statement'] != null) {
      incomeStatement = <FileForm>[];
      json['income_statement'].forEach((v) {
        incomeStatement!.add(FileForm.fromJson(v));
      });
    }
    if (json['balance_sheet'] != null) {
      balanceSheet = <FileForm>[];
      json['balance_sheet'].forEach((v) {
        balanceSheet!.add(FileForm.fromJson(v));
      });
    }
    if (json['market_study_docs'] != null) {
      marketStudyDocs = <FileForm>[];
      json['market_study_docs'].forEach((v) {
        marketStudyDocs!.add(FileForm.fromJson(v));
      });
    }
    if (json['other_document'] != null) {
      otherDocument = <FileForm>[];
      json['other_document'].forEach((v) {
        otherDocument!.add(FileForm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cashFlowStatement != null) {
      data['cash_flow_statement'] =
          cashFlowStatement!.map((v) => v.toJson()).toList();
    }
    if (companyPatentDoc != null) {
      data['company_patent_doc'] =
          companyPatentDoc!.map((v) => v.toJson()).toList();
    }
    if (companyLicenceDoc != null) {
      data['company_licence_doc'] =
          companyLicenceDoc!.map((v) => v.toJson()).toList();
    }
    if (companyMoCCertificate != null) {
      data['company_MoC_certificate'] =
          companyMoCCertificate!.map((v) => v.toJson()).toList();
    }
    if (businessPlan != null) {
      data['business_plan'] = businessPlan!.map((v) => v.toJson()).toList();
    }
    if (articleOfIncorporation != null) {
      data['article_of_incorporation'] =
          articleOfIncorporation!.map((v) => v.toJson()).toList();
    }
    if (incomeStatement != null) {
      data['income_statement'] =
          incomeStatement!.map((v) => v.toJson()).toList();
    }
    if (balanceSheet != null) {
      data['balance_sheet'] = balanceSheet!.map((v) => v.toJson()).toList();
    }
    if (marketStudyDocs != null) {
      data['market_study_docs'] =
          marketStudyDocs!.map((v) => v.toJson()).toList();
    }
    if (otherDocument != null) {
      data['other_document'] = otherDocument!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

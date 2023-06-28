import 'package:newspaper_hub/Model/CategoriesModel.dart';

List<CategoriesModel> getCategories(){
  List<CategoriesModel> category=<CategoriesModel>[];
  CategoriesModel categoriesModel= CategoriesModel();

  categoriesModel.categorieName = "Business";
  categoriesModel.categorieImage="https://images.unsplash.com/photo-1661956602153-23384936a1d3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80";
  category.add(categoriesModel);
  categoriesModel=CategoriesModel();

  categoriesModel.categorieName = "Entertainment";
  categoriesModel.categorieImage="https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZW50ZXJ0YWlubWVudHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoriesModel);
  categoriesModel=CategoriesModel();

  categoriesModel.categorieName = "Health";
  categoriesModel.categorieImage="https://media.istockphoto.com/id/1231520362/photo/doctor-man-holding-an-alcohol-disinfectant-gel-using-protective-mask-and-gloves-during.webp?b=1&s=170667a&w=0&k=20&c=HD34Li22S6WOiSTxTjwjYLyz1Zs0NU5EaILmKwmlI6M=";
  category.add(categoriesModel);
  categoriesModel=CategoriesModel();

  categoriesModel.categorieName = "Science";
  categoriesModel.categorieImage="https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U2NpZW5jZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoriesModel);
  categoriesModel=CategoriesModel();

  categoriesModel.categorieName = "Sports";
  categoriesModel.categorieImage="https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8U3BvcnRzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60";
  category.add(categoriesModel);
  categoriesModel=CategoriesModel();

  categoriesModel.categorieName = "Technology";
  categoriesModel.categorieImage="https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8VGVjaG5vbG9neXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoriesModel);
  categoriesModel=CategoriesModel();

  return category;

}
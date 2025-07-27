# About the app
This app is made using clean architecture with 3 layers that i will show how to the data flow in the next diagram
<img width="328" height="344" alt="image" src="https://github.com/user-attachments/assets/b7b209b3-2071-43c6-8a06-e46963f26df2" />

as shown in the previous diagram the data called by the UI or to be specific by the cubit (feature layer) the cubit asked the domain layer for the data but asked the interface class, not the concrete class, then the domain layer ask for the data from data layer in which 
the data layer handel the api calls with help of API_Services 

## Clean Architecture Layers
### 1- Feature layer 
- That implemnted with (MVVM bloc)
- Feauter layer is last layer that get data that is what the user see.
- MVVM (Model, view, view model) it's used to seperate the logic from the UI and it integrated with some of state managment techneique like (bloc, provide, getx) this project implemnted with MVVM bloc

### 2- Domain Layer 
- Domain layer works as a connecter between the UI layer and data layer it doesn't implement any functions but all app depends on it and it dosen't depend on any other layer

### 3- Data Layer
- We used a design pattern in this layer called the Repository Pattern. This pattern depends on separiting where the data will be saved and where the data will be called (repositories and data source) each one of the m have two classes one abstract and one is concret this
  design pattern help in unit testing and easly modifing or changing the code.
- This layer is responsible for handling all the data in the application (data from APi , firebase or offline data).

#Installing the app
- 

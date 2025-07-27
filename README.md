# About the app
This app is made using clean architecture with 3 layers, and I will show how the data flows in the next diagram
<img width="328" height="344" alt="image" src="https://github.com/user-attachments/assets/b7b209b3-2071-43c6-8a06-e46963f26df2" />

As shown in the previous diagram, the data called by the UI, or to be specific, by the cubit (feature layer), the cubit asked the domain layer for the data, but asked the interface class, not the concrete class, then the domain layer asked for the data from the data layer, in which 
The data layer handles the api calls with the help of API_Services 

## Clean Architecture Layers
### 1- Feature layer 
- That was implemented with (MVVM bloc)
- Feature layer is the last layer that gets data, which is what the user sees.
- MVVM (Model, View, View Model) is used to separate the logic from the UI, and it is integrated with some of the state management techniques like (Bloc, Provider, Getx). This project was implemented with the MVVM bloc

### 2- Domain Layer 
- The domain layer works as a connector between the UI layer and the data layer. It doesn't implement any functions, but all app depends on it, and it doesn't depend on any other layer

### 3- Data Layer
- We used a design pattern in this layer called the Repository Pattern. This pattern depends on separating where the data will be saved and where the data will be called (repositories and data source). Each one of them has two classes, one abstract and one concrete.
  These design patterns facilitate unit testing and make it easy to modify or change the code.
- This layer is responsible for handling all the data in the application (data from APi, Firebase, or offline data).

## Installing the app
- First, you create a project in your Android Studio with any name. While creating the project, press on **Get from version control system**, then paste in the URL field the URL of the project. It will take a while, but it will open
- Second, you need to check if your SDKs are compatible with the package I used. You can do this by running **flutter pub get**, and if there is any conflict, it will tell you what version you need to get for your SDKs or for the package. 
- The last step is to run this command in the terminal of the Android Studio **flutter pub run build_runner build --delete-conflicting-outputs**. This will make sure that all auto-generated files exist in your project
- In the end, just connect your emulator and run the app


## Some features in the app
- Real-time tracking of internet activity
- Light and dark mode
- Offline cashed data(Hive)

## Technology used
- Dio for handling API calls
- A Retrofit that helps in API calls
- json_serializable
- Dependent injection
- Cubit
- Repository pattern
- Clean architecture (Data - Domain - Feature)
- Hive
- Theme management

# Some screenshots from the app

<img width="461" height="903" alt="image loading" src="https://github.com/user-attachments/assets/2872ff54-df50-4e66-a915-89313b9563c1" />
<img width="461" height="916" alt="homa loading" src="https://github.com/user-attachments/assets/7dc0d4e8-4172-482d-89d1-d1bb5f59ea4d" />
<img width="422" height="896" alt="error" src="https://github.com/user-attachments/assets/c315ea05-b118-452e-89d4-a3edc84a3161" />
<img width="148" height="39" alt="check connectivity" src="https://github.com/user-attachments/assets/a4d900d4-9aff-4d9f-8d55-a7d3499877a0" />
<img width="384" height="827" alt="online light" src="https://github.com/user-attachments/assets/45c04e43-5d7c-4052-9c7e-9d9ad1543337" />
<img width="385" height="846" alt="online dark" src="https://github.com/user-attachments/assets/cdf83825-1544-410d-bb02-90f5146e49a1" />
<img width="377" height="853" alt="offline light" src="https://github.com/user-attachments/assets/071937a0-0198-4bd4-94dc-0bce5c9e27d3" />
<img width="387" height="862" alt="offline dark" src="https://github.com/user-attachments/assets/ee4e89c3-9c48-4654-b5fe-20464d0aa309" />

# infograinapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Task1: Implement user sign-up,login and verification functionality are managed in:
UI->Auth.

there is seperate implementation of logic and ui 
### Directory Structure

- `lib/`
  - `ui/`: Contains all UI components and screens.
  - `utility/`: Contains BLoC implementations for state management.
  - `models/`: Contains data models.
  - `Api/`: Contains repository classes that abstract the data layer.
  - `services/`: Contains network services and API integration.
  - `widgets/`: Contains utility Widgets and functions.

### Key Components

- **BLoC**: Manages the state of the application and handles business logic.
- **API Provider**: Handles all API requests and responses.
- **Models**: Defines the structure of the data.
- **Repositories**: Acts as an intermediary between the BLoC and the API provider.
- all APi are manages in api_provider.
- Endpoints in Endpoints.
- enclude network services as well as error handling for api integration.

There is lot of issue in your api responses like Verify Otp not work properly
User Order Api show Null data not able to get useroder model Ui Intergration not possible .
Here I added the response as well.
response of userorder:
{"status":200,"success":true,"message":"User Order Get Successfully!","result":{"buy":[],"sale":[]}}

# Logout api show 401 issue.
here the reposes:
[log] {"status":401,"message":"Unauthenticated","results":{}}

# I am not adding notification code becozz i don't have any account for create firebase console.
### here some screenshots

![Alt text](infograinapp/flutter_01.png)
![Alt text](infograinapp/flutter_02.png)
![Alt text](infograinapp/flutter_03.png)
![Alt text](infograinapp/flutter_04.png)
![Alt text](infograinapp/flutter_05.png)
![Alt text](infograinapp/flutter_06.png)
![Alt text](infograinapp/flutter_07.png)


### that all from my side 
##### thank you

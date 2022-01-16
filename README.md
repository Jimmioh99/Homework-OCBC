# Homework-OCBC
Flow of this application
- The first time user open this application. They will go to splash screen first. Check if they have login or not
    - If yes: They will go to Home screen
    - If Not: They will go to Login page. They can login if they already have account, or they can register if they dont have account
- After they register and success. They will go to Home screen
- At Home screen, they can see balance, account number, name. also, they can see their transaction history. and one last thing. Logout
- Move to transfer screen from home screen
    - user can pick, someone that already register on their database.
    - and transfer amount they want to send

What i use in this project ?
- Alamofire for webservice
- SwiftyJSON to wrap result from webservice into JSON
- SnapKit for autolayout
- VIPER for architecture


What i want to improve:
- Hide and unhide password at login and register view
- In currency, i should add “ . “ to seperate thousand
- handle when token for authorization is timeout
- When select user for transfer,  i will add search feature for name or account number 
- Use Clean Architecture, seperate to 3 layer (Presentation, Domain, and Data Layer)
    - Presentation layer using VIPER, but the interactor at domain layer
    - Webservice in Data Layer
- Why i dont use clean architecture in this project ?
    - answer: because i still learn about clean architecture, and i already trying to implement clean architecture in this project. But sadly there’s some bug. so i       just use basic viper in this project. But i will learn about clean architecture and try implement it in my next project.

Bug:
- There’s a bug when get register api, just return status.  dont have name and account number. so when user success register and push to home. The name section will   nil. User must logout and login to get 


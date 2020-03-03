# _Terminal_ ToDo App

This is an easy to use, purely terminal based TODO application.

## Install

1. Clone the repository
```
git clone https://github.com/ritesh99rakesh/ToDo-App.git
```
2. Create an `alias` in rc file (.bashrc/.zshrc).
```
alias todo="<path-to-repo>/ToDo-App/todo.sh"
```
3. Open a new terminal and type
```
todo
```
If you get the following output then the app is working

![No Todo](https://github.com/ritesh99rakesh/ToDo-App/blob/master/images/no_todo.png)

## How to use
* 1\. To add a ToDo 
    * 1.1\. Press `ENTER` to get the menu
    * 1.2\. Press `a` to add new ToDo
    * 1.3\. Some points:
        * 1.3.1\. `Title` is the only compulsory field
        * 1.3.2\. `Date`: today, tomorrow, yesterday, number, default today
        * 1.3.3\. `Date`: number corresponds to today+number
        * 1.3.4\. `Description`: defaults=`Title`
        * 1.3.5\. `Priority`: 1 is highest, default 

![Add Todo](https://github.com/ritesh99rakesh/ToDo-App/blob/master/images/add_todo.png)
* 2\. To edit a ToDo

![Edit Todo](https://github.com/ritesh99rakesh/ToDo-App/blob/master/images/edit_todo.png)
* 3\. Delete a ToDo

![Delete Todo](https://github.com/ritesh99rakesh/ToDo-App/blob/master/images/delete_todo.png)


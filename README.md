# flutter-bloc-practice

`flutter_bloc` is a state management library that allow users to seperate their application's business logics from the ui elements.

### Get started with bloc

Run the following command and that's it, you're good to go.

```bash

flutter pub add equatable flutter_bloc # Equatable is a object comparing package, it's a good practice to use equatable with bloc
```

There are two ways `bloc` can be used for local state management. 
- Cubit
- Bloc

Cubit is a straightforward process, it directly works on the event. On the other hand, the Bloc process needs a event handler to work with the states.

### Example
There are two examples are available inside the `/lib` folder. 
- Counter: Simple application to count with a counter variable. (Both of the cubit and bloc example are available)
- Todo: A todo application created following the bloc, contains bloc states, events.


### Author

[Kaium Al Limon](https://www.facebook.com/lemon.exee)
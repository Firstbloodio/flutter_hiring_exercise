# Introduction

This is a software development exercise for a Flutter mobile application developer position.

- [See the open position description on StackOverflow](https://stackoverflow.com/jobs/391155/flutter-developer-firstblood)

- [Read more about our hiring process](https://github.com/miohtama/how-to-hire-developers)

# Exercise

## Your task

The current skeleton implements a splash screen and a mock dashboard screen,
and some example tests.

Your task is to

- Add a login integration to the provided Flutter application skeleton
  on the profile screen

- Validate all inputs before sending them to the login

- Create and authenticate the user with the given REST backend
    * This backend is hardcoded to give always the same response
    * See more details below

- Add a post-login profile view with username, full name
  and level - please use your design skills with your own discretion

- After the authentication is complete, remember the user
  data in a store and be remember even if the user navigates away from the screen
    * For this exercise, the login status does not need to be persistent
    * For this exercise, there is no need for log out button

- Have an end-to-end tests for login
  * Assume the current mock backend server is running locally, so your PR must contain
    instructions how to make any necessary manual est up network wiring so that
    Flutter tests work against the backend
  * Check for input validation cases as well
  * Check post-login Profile screen works
  
- Have manual testing instructions for QA
  * Assume an internal testing team will test this feature with limited knowledge on Flutter
  * The pull request must contain instructions how the team can successfully test the feature in an Android emulator\
    and the backend running on the local host computer
  * This will also demostrate needed devops understanding how to make configurable builds

## How to submit the exercise

- [ ] Create a private copy of this Github repository
- [ ] Complete the task above
- [ ] Create a new pull request against your private repository
- [ ] In the PR, write down number of hours you spent on this exercise (we do not use this to rank you, we use it to adjust the laborisity of future exercises)
- [ ] Invite a Github user `miohtama` to your repository
- [ ] Send email to `dev-careers@fb.io` that you have completed the exercise

## How you will be ranked

We will look

- If the instructions were properly followed
- If the task was correctly completed
- All tests pass
- Code quality
- Code comment quality - for example if there are zero useful comments to make the reader to understand 
  your code then you will be negatively scored for this
- Pull request commenting quality

# Project description

This exercise is based on a Flutter starter tutorial.

The local development flow is

* Develop Flutter code using Visual Studio Code, or any of tools you wish

* Backend is Node.js / Express and can be run locally, instructions below

# Prerequisites

* You need to understand Flutter SDK, related mobile development tools, UNIX shell, Node.js

# Installation

* [Install Flutter and run Flutter doctor to ensure you have everything to run an app](https://flutter.dev/docs/get-started/install)

* We recommend using Visual Studio Code and Flutter extension for the development

# Development

## Running the app locally

* [Easiest way to run the application is using DevTools from Visual Studio Code](https://flutter.dev/docs/development/tools/devtools/vscode)
  and target Android emulator

* Run *Flutter Doctor* through Visual Studio Code command palette to ensure your editor is properly set up. You might need also do some extra setup.
  [Here are instructions for macOS](https://stackoverflow.com/questions/61036745/invalid-arguments-cannot-find-executable-for-null-when-emulated-android-on/61869002#61869002).

* Visual Studio Code will automatically detect the project. Go to VSCode Debug tab and hit the Play button next to *Run app (flutter_hiring_exercise)* and then choose Android emulator as target.

You can also run from the command line:

```sh
flutter emulators --launch flutter_emulator
flutter run
```

Make sure the backend process is running.

## Running tests

You can choose *Run all tests (flutter_hiring_exercise)* in Visual Studio Code.

Alternative you can run tests from the command line:

```sh
flutter test
```

## Running backend

You can run the backend by

```sh
cd backend
npm install
node index.js
```

Then you can test the server:

```sh
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"email": "example@example.com", "password":"secret"}' \
  http://localhost:3000/login
```

You should get a reply

```json
{"firstName":"John","lastName":"Appleseed","username":"flurryflutter","level":"100"}
```

Tested with Node v12.

# Further reading

[Flutter getting started](https://flutter.dev/docs/get-started/codelab)


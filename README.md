# Introduction

This is a software development exercise for a Flutter mobile application developer position.

- [See the open position description on StackOverflow](https://stackoverflow.com/jobs/391155/flutter-developer-firstblood)

- [Read more about our hiring process](https://github.com/miohtama/how-to-hire-developers)

# Exercise

## Your task

Your task is to

- Add a Xsolla social media login to the provided Flutter application skeleton

- Create and authenticate the user with the given REST backend

- Have an end-to-end test to check it works

- The current skeleton implements a splash screen and a mock dashboard screen,
  and a sample e2e test

- Xsolla API keys are given when you receive the exercise assignment

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
- Code quality
- Code comment quality
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

## Running tests

You can choose *Run all tests (flutter_hiring_exercise)* in Visual Studio Code.

Alternative you can run tests from the command line:

```sh
flutter test
```

# Further reading

[Flutter getting started](https://flutter.dev/docs/get-started/codelab)


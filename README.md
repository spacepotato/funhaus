## What is it?
This is a little helper script to download the Dude Soup podcast courtesy of Funhaus.

## How do I run it?
Clone the project and point your terminal to the root directory of the project. Then you can run:
```
  $ bundle install
  $ ruby funhaus.rb
```

This will download all current episodes of the podcast into a directory named `funhaus-podcasts`.

Running the script a second time will only download episodes of the podcast that you do not already have.

## To Do
- [ ] Make folder name more configurable
- [ ] Provide a mode for only downloading the latest episode


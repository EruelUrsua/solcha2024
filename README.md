# solcha2024

A new Flutter project.

## Upgrade to the latest version of flutter
flutter doctor upgrade 

## Check if your copy of the app has the appropriate packages 
flutter pub get

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### How to Contribute
1. Create a New Branch

```
git checkout -b <Branch Name>
```
2.  Apply changes to code 
3.  Save the changes
```
git add .
```
5. Commit Changes 
```
git commit -m "Add Details"
```
4. Push  the changes 
```
git push origin -u <Branch Name>
```
5. Go to Fork repository
6. Locate the Branch name
7. Create Pull Request then submit
8. Go to Upstream repository then click merge changes

### How to Update Fork Repository
1. Check if upstream remote is available
```
git remote -v
```
2. If Upstream remote is not available enter this command
```
git remote add upstream https://github.com/fidelledi/beehive_app.git
```
3. Double check if Upstream remote is listed in the address
4. Switch to main Branch
```
git checkout main
```
5. Fetch Upstream Changes
```
git fetch upstream
```
6. Merge Upstream & Origin Main
```
git merge upstream/main
```
7. Push the changes to Fork Repository
```
git push origin main
```
8. Refresh the Fork Repository Web Page 


# Debian install testing repo

see this stack_exchange [post](https://serverfault.com/questions/550855/how-to-add-debian-testing-repository-to-apt-get)

```
sudo vim /etc/apt/sources.list
```
to add this line into the sources list:
```
deb http://http.us.debian.org/debian/ testing non-free contrib main
```
save it, and run
```
sudo apt-get update
```
Finally, remove vim and reinstall it, it should be of ver.8.2.

# go-ssb-room-docker
Repo to host my attempt at fixing go-ssb-room docker image for pure docker and for cloudron

- I have tried many different things to try to be able to login but to no avail, 
- the only thing I can do is to create the admin users, so it seems that when using the cli to create those users the roomdb access is functional, otherwise in my understand there would be no way to create those admin users, it's when I want to login, using those admin users ID that, roomdb cannot be found. 
- I'm wondering if go-ssb-room isn't simply looking for roomdb at the root of the image (even tho the env file clearly define a REPO to work from)

# cloudron.io
the Cloudronmanifest file is only used in a docker build/push / cloudron install context. 

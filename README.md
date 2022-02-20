# go-ssb-room-docker : https://github.com/ssb-ngi-pointer/go-ssb-room

Steps: 
- cloudron install --image buzzworkers/go-ssb-room4:cloudron --no-wait
- next, identify your container ID (cloudron)
![image](https://user-images.githubusercontent.com/12155003/154856823-5625bae9-43c5-42c1-8c37-a329f2ce34f0.png)
- Exec into your container : sudo docker exec -ti -u 0 2e116baa-6a83-40c1-8ccb-3097aaa4b741 /bin/sh 
- got to /app/code/cmd/insert-user
- Create the Admin users https://github.com/ssb-ngi-pointer/go-ssb-room/blob/master/docs/deployment.md#first-admin-user
- Login (from an admin added ID) using your SSB id (manyverse or ssb client)
- eventually enable Public setting in go-ssb-room so you can create invites from the front-end easy

# cloudron.io
the Cloudronmanifest file is only used in a docker build/push / cloudron install context. 

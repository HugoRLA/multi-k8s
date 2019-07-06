docker build -t hugorla/multi-client:latest -t hugorla/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hugorla/multi-server:latest -t hugorla/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t hugorla/multi-worker:latest -t hugorla/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push hugorla/multi-client:latest
docker push hugorla/multi-server:latest
docker push hugorla/multi-worker:latest

docker push hugorla/multi-client:$SHA
docker push hugorla/multi-server:$SHA
docker push hugorla/multi-worker:$SHA


kubectl set image deployments/client-deployment client=hugorla/multi-client:$SHA
kubectl set image deployments/server-deployment server=hugorla/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=hugorla/multi-worker:$SHA
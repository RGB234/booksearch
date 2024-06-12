#!/bin/bash

# export K8SNODE_IP_ADDRESS="$(kubectl get nodes --selector=kubernetes.io/role!=master -o jsonpath={.items[*].status.addresses[?\(@.type==\"InternalIP\"\)].address})"

# Set the port
PORT=5000

# Stop any program currently running on the set port
echo 'preparing port' $PORT '...'
fuser -k 5000/tcp

# switch directories
cd build/web/

# Start the server
echo 'Server starting on port' $PORT '...'
python3 -m http.server $PORT
# flutter run -d chrome --web-renderer html
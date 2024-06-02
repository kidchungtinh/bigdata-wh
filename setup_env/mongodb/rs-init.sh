#!/bin/bash

echo "Waiting for MongoDB to start..."
sleep 10

mongo --host mongo-primary:27017 <<EOF
var config = {
    "_id": "dbrs",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo-primary:27017",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "mongo-secondary-1:27017",
            "priority": 2
        },
        {
            "_id": 3,
            "host": "mongo-secondary-2:27017",
            "priority": 1
        }
    ]
};
rs.initiate(config, {force: true});
EOF

echo "Replica set initiated"

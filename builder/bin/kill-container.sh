#!/bin/bash
docker exec integrichain_container bash /stop-services.sh
docker kill integrichain_container

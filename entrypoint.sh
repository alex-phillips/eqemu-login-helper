#!/bin/sh

echo "Starting Titanium/SoF login proxy..."
/bin/eqemu-login-helper-5998 &
echo "Starting SoD/Underfood/RoF login proxy..."
/bin/eqemu-login-helper-5999

#!/bin/bash

function dbs() {
	docker start mysql_server_56 postgres_server openmrs_2x
}

function datagrip {
   cd /home/agnaldo/jetbrains/DataGrip-2022.1.5/bin/ && ./datagrip.sh

}

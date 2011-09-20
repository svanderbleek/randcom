# RandCom-Server

A Rails 3 server that provides a service for RandCom iPhone app

## Usage

    GET: /commons/random?exclude='e1,e2,..eN'

returns a Flickr url for a random image from the commons

exclude is a comma separated list of commons institutions to ignore

    GET: /commons/institutions

returns a JSON array of commons institutions, can be used for exclude parameter for random call 

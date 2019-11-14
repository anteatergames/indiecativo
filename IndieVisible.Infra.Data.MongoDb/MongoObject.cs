﻿using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace IndieVisible.Infra.Data.MongoDb
{
	public abstract class MongoObject
	{
	    [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }
	}
}
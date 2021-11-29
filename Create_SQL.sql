create table if not exists Genre (
	id serial primary key,
	genre_name text not null unique
	);

create table if not exists Artist (
	id serial primary key,
	artist_name text not null
);

create table if not exists ArtistGenre (
	id serial primary key,
	artist_id integer not null references Artist(id),
	genre_id integer not null references Genre(id)
);

create table if not exists Album (
	id serial primary key,
	album_title text not null,
	album_year integer not null
);

create table if not exists ArtistAlbum (
	id serial primary key,
	artist_id integer not null references Artist(id),
	album_id integer not null references Album(id)
);

create table if not exists Track (
	id serial primary key,
	track_title text not null,
	track_length integer not null,
	album_id integer references Album(id)
);

create table if not exists Collection (
	id serial primary key,
	collection_name text not null,
	collection_year integer not null
);

create table if not exists CollectionTrack (
	id serial primary key,
	collection_id integer not null references Collection(id),
	track_id integer not null references Track(id)
);
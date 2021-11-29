select genre_name, count(ArtistGenre.artist_id) from Genre
	join ArtistGenre on ArtistGenre.genre_id = Genre.id
	group by Genre.genre_name;
	
select album_title, album_year, count(track.id) from Album
	join Track on Track.album_id = Album.id
	where album_year >= 2019 and album_year <= 2020
	group by album_title, album_year;
	
select album_title, round(AVG(Track.track_length), 2) from Album
	join Track on Album.id = Track.album_id
	group by album_title; 
	
select artist_name, album_year from Artist
	join ArtistAlbum on Artist.id = ArtistAlbum.artist_id 
	join Album on ArtistAlbum.album_id = Album.id
	where Album.album_year != 2020;

select distinct collection_name from Collection 
	join CollectionTrack on CollectionTrack.collection_id = Collection.id 
	join Track on CollectionTrack.track_id = Track.id 
	join Album on Track.album_id = Album.id 
	join ArtistAlbum on Album.id = ArtistAlbum.album_id 
	join Artist on ArtistAlbum.artist_id = Artist.id 
	where artist_name like 'Ariana Grande';

insert into ArtistGenre(artist_id, genre_id)
	values 
	(3, 7);

select album_title from Album 
	join ArtistAlbum on Album.id = ArtistAlbum.album_id 
	join Artist on Artist.id = ArtistAlbum.artist_id 
	join ArtistGenre on ArtistGenre.artist_id = Artist.id  
	group by Artist.artist_name, Album.album_title 
	having count(ArtistGenre.genre_id) > 1;
	
select track_title from Track 
	left join CollectionTrack on Track.id = CollectionTrack.track_id 
	where CollectionTrack.track_id is null;

select Artist.artist_name, Track.track_length from Artist 
	join ArtistAlbum on Artist.id = ArtistAlbum.artist_id 
	join Album on Album.id = ArtistAlbum.album_id 
	join Track on Track.album_id = Album.id 
	where Track.track_length in (select min(track_length) from Track);
	
insert into Track(track_title, track_length, album_id) 
	values 
	('Number 1', 175, 1),
	('Secret Garden', 150, 2),
	('Umbrella', 155, 3),
	('The Sun', 160, 4),
	('The Window', 165, 5),
	('Paradise', 170, 6),
	('Rainbow', 175, 7);

select album_title, count(Track.id) from Album 
	join Track on Album.id = Track.album_id 
	group by album_title 
	having count(Track.id) in (
		select count(Track.id) from Album
		join Track on Album.id = Track.album_id 
		group by album_title 
		order by count(Track.id)
		limit 1);


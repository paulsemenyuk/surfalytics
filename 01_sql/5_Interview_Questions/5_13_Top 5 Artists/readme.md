# Find Top 5 Artists with the Most Top 10 Song Appearances

## **Objective**
Write a query to identify the top 5 artists whose songs appear most frequently in the Top 10 of the `global_song_rank` table. The output should include:
- **Artist Name**
- **Song Appearance Rank**

If two or more artists have the same number of appearances, they share the same rank, and the ranks remain continuous (e.g., 1, 2, 2, 3, 4).

---

## **Schema**

### `artists` Table

| Column Name  | Type    | Description                           |
|--------------|---------|---------------------------------------|
| `artist_id`  | integer | Unique identifier for each artist     |
| `artist_name`| varchar | Name of the artist                   |
| `label_owner`| varchar | The music label associated with the artist |

### `songs` Table

| Column Name  | Type    | Description                           |
|--------------|---------|---------------------------------------|
| `song_id`    | integer | Unique identifier for each song       |
| `artist_id`  | integer | Unique identifier for the artist of the song |
| `name`       | varchar | Name of the song                     |

### `global_song_rank` Table

| Column Name  | Type    | Description                           |
|--------------|---------|---------------------------------------|
| `day`        | integer | The day the song rank is recorded     |
| `song_id`    | integer | Unique identifier for each song       |
| `rank`       | integer | Rank of the song on that day          |

---

## **Example Input**

### `artists` Table

| artist_id | artist_name | label_owner           |
|-----------|-------------|-----------------------|
| 101       | Ed Sheeran  | Warner Music Group    |
| 120       | Drake       | Warner Music Group    |
| 125       | Bad Bunny   | Rimas Entertainment   |

### `songs` Table

| song_id | artist_id | name              |
|---------|-----------|-------------------|
| 55511   | 101       | Perfect           |
| 45202   | 101       | Shape of You      |
| 22222   | 120       | One Dance         |
| 19960   | 120       | Hotline Bling     |

### `global_song_rank` Table

| day | song_id | rank |
|-----|---------|------|
| 1   | 45202   | 5    |
| 3   | 45202   | 2    |
| 1   | 19960   | 3    |
| 9   | 19960   | 15   |

---

## **Expected Output**

| artist_name | artist_rank |
|-------------|-------------|
| Ed Sheeran  | 1           |
| Drake       | 2           |

---

/*
  What is the average duration of a trip for 2020? 
  What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here.
  ANSWER: The average duration of a trip for 2020 is 39.23600913251798. 
  Compared with the average duration of 23.674069802378437 in 2019, the trip lengths increased greatly.
  I think probably due to the more advanced economic development, there are more private cars than before, so that more traffic congestion is caused.
  Moreover, parts of the chestnut street are underlying road construction. Many cars lost one more options when travelling across the river. They have to make a detour, causing more travelling time.
  Also, some severe weather caused longer travel time in 2020.
*/

-- Enter your SQL query here
SELECT AVG(duration) FROM indego_trips_2020_q2

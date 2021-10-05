CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE  (
    IN in_School_ID INTEGER, 
    IN in_Leader_Score INTEGER
  )

BEGIN
  UPDATE CHICAGO_PUBLIC_SCHOOLS
  SET Leaders_Score = in_Leader_Score
  WHERE School_ID = in_School_ID;
  
  IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
	  UPDATE CHICAGO_PUBLIC_SCHOOLS
	  SET Leaders_Icon = 'Very Weak'
	  WHERE School_ID = in_School_ID;
  ELSEIF in_Leader_Score < 40 THEN
	  UPDATE CHICAGO_PUBLIC_SCHOOLS
	  SET Leaders_Icon = 'Weak'
	  WHERE School_ID = in_School_ID;
  ELSEIF in_Leader_Score < 60 THEN
	  UPDATE CHICAGO_PUBLIC_SCHOOLS
	  SET Leaders_Icon = 'Average'
	  WHERE School_ID = in_School_ID;
  ELSEIF in_Leader_Score < 80 THEN
	  UPDATE CHICAGO_PUBLIC_SCHOOLS
	  SET Leaders_Icon = 'Strong'
	  WHERE School_ID = in_School_ID;
  ELSEIF in_Leader_Score < 100 THEN
	  UPDATE CHICAGO_PUBLIC_SCHOOLS
	  SET Leaders_Icon = 'Very Strong'
	  WHERE School_ID = in_School_ID;
  ELSE
	ROllback; 
  END IF;
  
  COMMIT; 

END
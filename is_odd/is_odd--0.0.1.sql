CREATE OR REPLACE FUNCTION is_even(value INT)
RETURNS BOOLEAN 
LANGUAGE plpgsql
AS $$
BEGIN
  IF value % 2 = 0 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$;
SET @time1 = CURRENT_TIMESTAMP(6);
CALL EvaluateDiscountedSales("2015-01-01", "2016-01-01", 30, 300000, "Parksbury", "Lake Jessicaview", "Chen, Smith and Ingram", "Blair, Porter and Brown");
SET @time2 = CURRENT_TIMESTAMP(6);
SET @dur_with_index = TIMESTAMPDIFF(MICROSECOND, @time1, @time2);

SELECT 
    @dur_without_index/1000 AS "time_before / ms", 
    @dur_with_index/1000 AS "time_now / ms", 
    @dur_without_index/@dur_with_index AS "speed_up_rate",
    IF(@dur_without_index/@dur_with_index>=2, "PASS", "FAIL") AS "CHECK index efficacy";
    
with myvars as 
	(select 3 as week_no /* SET approriate gameweek number */
	)
	
/* get standings stats for selected gameweek */
select prev_change.place
		,prev_change.team_name
        ,prev_change.gameweek_number
        ,prev_change.points
        ,prev_change.goal_difference
        ,prev_change.change_from_previous
from
	(
    /* calculate change in standing position compared to previous week */
	select place.place
			,place.team_name
			,place.gameweek_number
			,place.points
			,place.goal_difference
			,case 
				/* if change is negative, show '-' sign */
				when place.place - coalesce(lag(place.place) over(partition by place.team_name order by gameweek_number asc), place.place) < 0
					then cast(place.place - coalesce(lag(place.place) over(partition by place.team_name order by gameweek_number asc), place.place) as char(2))
				/* if no change, show 0 */
				when place.place - coalesce(lag(place.place) over(partition by place.team_name order by gameweek_number asc), place.place) = 0
					then cast(place.place - coalesce(lag(place.place) over(partition by place.team_name order by gameweek_number asc), place.place) as char(2))
				/* if change is positive, show '+' sign */
				when place.place - coalesce(lag(place.place) over(partition by place.team_name order by gameweek_number asc), place.place) > 0
					then concat( '+', cast(place.place - coalesce(lag(place.place) over(partition by place.team_name order by gameweek_number asc), place.place) as char(2)))
				else null           
            end as change_from_previous
	from
				/* calculate place in the standing based on no of points or goal_difference if no of points is equal */
				(
				select row_number() over(partition by gameweek_number order by points desc, goal_difference desc) as place
						,team_name
						,gameweek_number
						,points
						,goal_difference
				from football_standings 
						join myvars
							on 1=1
                /* sample is reduced only to selected and previous weeks, older/newer data is not needed for further calculations */
                where gameweek_number between myvars.week_no - 1 and myvars.week_no
				) place
	) prev_change
		join myvars
			on 1=1
where prev_change.gameweek_number = myvars.week_no
order by prev_change.place asc
;
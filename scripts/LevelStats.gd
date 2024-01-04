extends Node

var trampolines_used : int
var trampolines_goal : int
var trampolines_max : int = 10

var time : float
var goal_time : float

var total_bounces : int
var goal_bounces : int

func set_goals(trampolines : int, max_trampoline :int, time : float, bounces : int):
	trampolines_goal = trampolines
	trampolines_max = max_trampoline
	goal_time = time
	goal_bounces = bounces
	trampolines_used = 0
	time = 0
	total_bounces = 0
	

func trampoline_score():
	return 1.0 *trampolines_goal / trampolines_used

func time_score():
	return 1.0 * goal_time / time

func bounce_score():
	return 1.0 *goal_bounces / total_bounces

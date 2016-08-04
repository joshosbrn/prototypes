# NPR.org Story-to-Story Scroll
# Josh Osborne
# 8/4/2016
# :)

# Project Info & Setup
Framer.Info =
	title: "Story-To-Story Scroll – NPR.org"
	author: "Josh Osborne"
	twitter: "joshosbrn"
	description: "Exploring the interactions and transitions necessary for a smooth story-to-story scroll experience on NPR.org."

# Use desktop cursor
document.body.style.cursor = "auto"

# Disable right-click context menu
if document.addEventListener?
	document.addEventListener("contextmenu", (event) -> event.preventDefault())

# Background of prototype should be same color as story bg
bg = new BackgroundLayer
    backgroundColor: "#E0E0E0"

# Variables
scrollPoint1 = 300
scrollPoint2 = 1500
scrollPoint3 = 3650
transitionTime = .08

# Import Assets
# Import list of stories
storyFeed = new Layer
	width: 1024
	height: 7676
	image: "images/scroll-blog-content@2x.jpg"

# Make stories scrollable
feedScroll = ScrollComponent.wrap(storyFeed)
feedScroll.scrollHorizontal = false
feedScroll.mouseWheelEnabled = true

# Import sticky headers
stickyHeaderOne = new Layer
	width: 1045
	height: 55
	image: "images/sticky-header-1.png"
	x: -10
	opacity: 0

stickyHeaderTwo = new Layer
	width: 1045
	height: 55
	image: "images/sticky-header-2.png"
	x: -10
	opacity: 0

stickyHeaderThree = new Layer
	width: 1045
	height: 55
	image: "images/sticky-header-3.png"
	x: -10
	opacity: 0

# Static elements
playerAndSponsorship = new Layer
	width: 305
	height: 712
	image: "images/static-player@2x.png"
	x: 710

# Sticky Header Animations
feedScroll.on Events.Scroll, ->
	# First sticky header
	if feedScroll.scrollY > scrollPoint1
		stickyHeaderOne.animate
			properties:
				opacity: 1
			time: transitionTime
	
	if feedScroll.scrollY < scrollPoint1
		stickyHeaderOne.animate
			properties:
				opacity: 0
			time: transitionTime
	
	if  feedScroll.scrollY > scrollPoint2
		stickyHeaderOne.animate
			properties:
				opacity: 0
			time: transitionTime

	# Second sticky header
	if  feedScroll.scrollY > scrollPoint2
		stickyHeaderTwo.animate
			properties:
				opacity: 1
			time: transitionTime
	
	if  feedScroll.scrollY < scrollPoint2
		stickyHeaderTwo.animate
			properties:
				opacity: 0
			time: transitionTime
	
	if feedScroll.scrollY > scrollPoint3
		stickyHeaderTwo.animate
			properties:
				opacity: 0
			time: transitionTime
	
	# Third sticky header
	if  feedScroll.scrollY > scrollPoint3
		stickyHeaderThree.animate
			properties:
				opacity: 1
			time: transitionTime
	
	if  feedScroll.scrollY < scrollPoint3
		stickyHeaderThree.animate
			properties:
				opacity: 0
			time: transitionTime

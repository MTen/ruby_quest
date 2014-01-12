Gameplay:
This is a game that will be designed to teach non-programming gamers the basics of how ruby works. The combat gameplay will hopefully resemble final fantasy 3 with an active battle system and progress bar (https://www.youtube.com/watch?v=eo6JJBlcoPs) instead of focusing on menu navigation the gameplay of Ruby Quest would focus on using ruby syntax to attack enemies, cast spells, and use items. The user would start out just making method calls like slime.attack and as they get comfortable calling methods on objects we can start introducing new concepts like picking an item out of an array or a hash. Definig a method for a complex combo attack. (Tutorial: What method of attack are you going to use?) The player would have to use their ingame currency to unlock a small quip (called lore in the gaming world) about how the thing they are learning ties into the program world and then can further unlock examples of how it can be used.

Since I'm required to have an API in this project I've decided to integrate the weather underground API which will serve up different maps based on the current weather of new york city. Example if its 70 and nice out it will be a spring time map. If its below 32f the same map would be snow covered. If it is above 100f the map would be a field of mamga. Some other ideas of weather integration is tying monsters of specific affinity (earth, wind, fire, water) to dew point, current wind speed, and if I want to get crazy with this, an api based on tectonic shifts.

My ultimate goal is to take a non-programmer gamer and make them savy enough that they are able to use define methods, understand how classes work and be able to call Class.new to "summon" things to fight for them. I hope this eventually pique's their interest enough that they try to start hacking the gamefiles (since its hosted on github) and make their own mods to the game.


Weather Underground API integration and how it fits in:

This JSON request goes to weatherunderground and gets the temperature for new york city. The view of the town that is served to the player will be predicated on the real weather conditions of new york city. If I can figure out how to make the map dark to resemble night time or add in other weather effects like rian or snow I will but those are end stretch goals. 

require 'json'
require 'rest-client'

my_api_key = ENV['MY_API_KEY']

res = JSON.load(RestClient.get("http://api.wunderground.com/api/#{<%=ENV[weather_underground_key]%>}/conditions/q/NY/New_York.json"))

@temp = res["current_observation"]["temp_f"]


Resources


    MDN - Mozilla developer network : (https://developer.mozilla.org/en-US/) 
    
      - canvas
      - vector graphic scale 
    
    Checkboxes that are buttons for true false - call divs in and out  (http://tympanus.net/codrops/2012/12/17/css-click-events/)
    Transitions - use for battle (http://tympanus.net/codrops/2012/01/30/page-transitions-with-css3/)
    Glowing selector for ground tiles (http://designshack.net/articles/css/5-cool-css-hover-effects-you-can-copy-and-paste)
    
       /Glow/ -webkit-box-shadow: 0px 0px 20px rgba(255,255,255,0.8); -moz-box-shadow: 0px 0px 20px rgba(255,255,255,0.8); box-shadow: 0px 0px 20px rgba(255,255,255,0.8); }
    
    Making it snow (http://designshack.net/articles/css/make-it-snow-on-your-website-with-css-keyframe-animations/) (https://stackoverflow.com/questions/19882060/use-background-image-and-apply-css-animations-over-the-top-of-it)
    Weather Underground API (http://www.wunderground.com/weather/api/d/docs?MR=1)


DEVELOPMENT CYCLE


  Order of development
       get background assets
       basic rails app
       gems requirements
       add two towns to application views

Set up
   town map view
    welcome menu/index
    combat screen
    write tests for character (M~>V~>C)
    character (MVC)
    write tests for monster (M~>V~>C)
    battle (MVC)
    navigation
    database with items that have mvc

Add
A user log in 
Functional API Call 


Stretch goals
     Use params to capture where the character was and then have them walk to the new location in the new view.
     Add items
     Add currency
     Add Rain and snow effects
     Add day and night cycles
     Make avatar walk around map. 


Fall Back application: App that servers up a wall of images or gifs based on the weather.
Fall Back application: Prose Factor

DATA STRUCTURE


Models
Hero
Monster
Items
NPC 

View
Maps
Battle
Store

Controller
Store purchases
Battle
 -serves up proper assets for battle with 
Map change



Databases

Main Tables
     Characters, Monsters, Skills, Encounters, Items

     Characters
          name:string, class:string, level:integer, experience:integer, hit_points:integer, magic_points:integer, inventory_id:integer,
          has many *:skills, *:items

     Monsters
          has many :skills
          **has one :inventory

     *Skills #can survive with just using monster.attack
          has many :characters, :monsters
     
     Encounters
     
    **Items
     
Joiner Tables
     
    Monster Parties
    *inventory
     
* - first stretch tier
** - second stretch tier


Challenges

Making a semi-static webpage feel like a game without using javascript
     - The background image of the website will serve as the map.
     - use params to capture player position, input, and currently loaded assets from view to view.
     - use clickable divs and responsive web design to make a map navigable. 

 Make the character animated without javascript
     - turn sprite sheets into gifs

Its a huge project
     - break it down to the core components (MVP) and then try to get stretch goals

I needed to make my project engaging so I could learn as much as possible. I observed that I get the most excited about writing code when it is tied to one of my interest. Gaming has been a life long passion so I thought that hacking a game together would be a great anchor to get me to focus on the project.



# Private Events Project

The goal of this project is to implement similar functionality to [Eventbrite](https://www.eventbrite.com).

Users can create events, send invitations to their own events, and attend events.

Events have a date and location and can be attended by many users.

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations).

![Screenshot](/screenshot.png)

## Pre-Project Thoughts

Rails Associations are bit of a conceptual leap for me without practice, so this should help cement the theory into knowledge.

Going in, I've had a little practice with Bootstrap and I hope to iterate on my bootstrap skills and create something less mundane this time.

In my last project, [Members Only](https://github.com/JonathanYiv/members-only), I did not include any testing.

I would like to add testing to this project, using Minitest or possibly if I'm up for it, learn RSpec in Rails as well as FactoryGirl.

I've heard the trio of testing in Rails is Faker/FactoryGirl/RSpec, and it'd be nice to learn these skills before hitting the final Rails project, which I hear is a tough one.

On top of that, I would like to learn Devise. Rolling your own authentication doesn't cover for all the edge cases like Devise, from what I've heard.

### Planning

#### Associations

```
User
	has_many :hosted_events, class_name: 'Event', foreign_key: 'creator_id'
	belongs_to :event, through: :attendances
	has_many :invitations
	has_many :attendances

Event
	belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
	has_many :attendances
	has_many :invitations
	has_many :attendees, through: :attendances, source: :user

Attendances
	belongs_to :event
	belongs_to :user

Invitations
	belongs_to :event
	belongs_to :inviter, class_name: 'User', foreign_key: 'inviter_id' 
	belongs_to :invited, class_name: 'User', foreign_key: 'invited_id'
```

#### Resources

```
Users
	Routes: All
	Attributes:
		email - string
		password_digest

Sessions
	Routes:
		:new, :create, :destroy
	No Active Record model

Events
	Routes: All
	Attributes:
		creator_id - user:references
		title - string
		description - text
		date - datetime
		location - string

Invitations
	Routes:
		:show, :new, :create, :destroy
	Attributes:
		inviter_id - user:references
		invited_id - user:references
		event_id - event:references

Attendances
	Routes:
		:index, :create, :destroy
	Attributes:
		event_id - event:references
		user_id - user:references
```

### Possible Useflow

```
User goes to website home page
Presses the sign-up button
Inputs information and submits
User is automatically logged in if information is valid
User is redirected to their profile page, which lists their created events and attended events
User goes to 'Events' which lists all the currently existing Events, in order of upcoming
User clicks on an event and it opens up an event page
User reads information about event, who created the event, sees a list of people attending
User clicks the "attend" button
User is redirected to the event page, with user listed on the attendance list
User sees one of the header links has changed from "Notifications" to "Notifications (1)"
User clicks on the header link
User sees a notification indicating user has received an invite
User clicks on the invite link
It displays the event details and an accept invitation button and a reject invitation button
User clicks the reject invitation button
Invite is destroyed
User logs out
User tries to attend an event, but it redirects to login page
```

## Post-Project Thoughts

1. I have Rails Associations down pat. This was awesome practice. It was a wonderful feeling to draft the associations, contemplate about them for several minutes, adjust them, and then test them in the console to find success. I was wrong in my initial drafts but I see now the small differences that allow one to craft great associations.

2. This was my second iteration of building a Rails site, and a lot more of the basics and generic 'boilerplate' code is starting to become like second nature. Not fully yet, but it is definitely easily within my grasp.

3. I regret to say I did not iterate on the design of the website immensely. I used very similar bootstrap styling, but in reality, I think I truly need to dive into design in the next section of Odin to get good at that. So for now, I will focus on Rails itself, and not design except to a small degree.

4. I also did not tackle Devise/FactoryGirl/RSpec. I did learn about Faker and know how to use it though now, although I have not yet. I will leave that on the to do list for next time.

5. I will come back and add testing to this project.. someday.
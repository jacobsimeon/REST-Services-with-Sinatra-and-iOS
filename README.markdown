REST Services with Sinatra and iOS
==================================

What is REST?
-------------

  - [Wikipedia][1]:
  
  "Representational state transfer (REST) is a style of software architecture for distributed hypermedia systems such as the World Wide Web."

  - [Represenational State Transfer][2] (Roy Felding):
  
  "REST is a coordinated set of architectural constraints that attempts to minimize latency and network communication, while at the same time maximizing the independence and scalability of component implementations."
  
REST is a set of Constraints
----------------------------
  -  Client-Server
    - data stays on server
  - __Stateless__
    - no client context on the server
    - don't set 'current' anything
  - Cacheable
  - Layered system
  - Code on demand
  - __Uniform Interface__ (through URIs)


REST Uses Universal Resource Indicators
---------------------------------------
  - Client uses URI to request a representation of a resource
  - The exact resource is indicated by the URI itself, not the request body
  - If you are building a REST service, your URLs are your user interface.
  - Good
    - `GET /tasks/1`
    - `POST /projects/1/tasks`
  - Bad
    - `POST /getTask/`
    - `GET /addTask?title=5`

REST Communicates With __Resources__
-------------------------------------
  - POST (create)
    - 201 (Created)
    - 422 (Unprocessable Entity)
  - GET, PUT, DELETE, PATCH
    - 200
    - 404
    
---

The App
-------
 - Todos application
 - CRUD tasks

The URIs (The UI)
----------------
 (show and step through sinatra code)
   
The Client
---------------
 (introduce RestKit)
 Create a few tasks
 Read tasks
 Update a task
 Destroy a task


Questions/Discussion
Handling relationships

[1]: http://en.wikipedia.org/wiki/Representational_state_transfer
[2]: http://www.ics.uci.edu/~taylor/documents/2002-REST-TOIT.pdf

  

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
    - 200 (OK)
    - 404 (NOT FOUND)
    
---

The App
-------
  - Todos application
  - Manage tasks

The URIs (The UI)
----------------
  
    ``` ruby
    get '/tasks' do
      Task.to_json
    end 

    post '/tasks' do
      pp @data
      @task = Task.new @data 
      if @task.valid?
        @task.save
        @task.to_json
      else
        status 422 
        @task.errors_hash.to_json
      end 
    end 

    get '/tasks/:id' do
      @task = Task.find(params)
      raise Sinatra::NotFound unless @task
      @task.to_json
    end 

    put '/tasks/:id' do
      @task = Task.find :id => params[:id]
      raise Sinatra::NotFound unless @task
      @task.update @data
      @task.to_json
    end 

    delete '/tasks/:id' do
      @task = Task.find :id => params[:id]
      raise Sinatra::NotFound unless @task
      @task.destroy
      @task.to_json
    end
    ```
   
The Client
---------------
  - introduce [RestKit][3]
    [Task][6]
    [Manager][5]
    [Services][4]
    
    ``` objc
      -(void)createObject:(NSObject *)theObject withMapping:(RKObjectMapping *)mapping{
        self.target = theObject;
        [[LBDataManager sharedManager].rkObjectManager 
         postObject:theObject mapResponseWith:mapping delegate:self];
      }

      -(void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error{
        [self.delegate objectDidFailCreation:error];
        [super objectLoader:objectLoader didFailWithError:error];
      }

      -(void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)loadedObjects{
        [self.delegate didCreateObject:[loadedObjects objectAtIndex:0]];
        [super objectLoader:objectLoader didLoadObjects:loadedObjects];
      }
    ```
  
  - Create a task
  - Read tasks
  - Update a task
  - Destroy a task


Questions/Discussion
Handling relationships

[1]: http://en.wikipedia.org/wiki/Representational_state_transfer
[2]: http://www.ics.uci.edu/~taylor/documents/2002-REST-TOIT.pdf
[3]: http://restkit.org
[4]: https://github.com/jacobsimeon/REST-Services-with-Sinatra-and-iOS/blob/master/client/Todo/Todo/LBCreateObjectService.m
[5]: https://github.com/jacobsimeon/REST-Services-with-Sinatra-and-iOS/blob/master/client/Todo/Todo/LBDataManager.m
[6]: https://github.com/jacobsimeon/REST-Services-with-Sinatra-and-iOS/blob/master/client/Todo/Todo/Task.m
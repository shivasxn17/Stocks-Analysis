This is just for learning web development concepts like ruby on rails - MVC understanding , html , css , javascript and deployment check for live projects with heroku, amazon ....
for version controlling using Git.
Setup and Run- just have to download the repo then u can just go to main rails directory then run

```
#!ruby

bundle install

```

```
#!ruby

rails server -b 0.0.0.0

```
for this Heroku needs to be installed.
Push this repo on heroku master.
Heroku is used for production deployment
Jenkins job for CI/CD, pipeline is created.




# Ruby on Rails MVC Diagram

This diagram visualizes the flow of a request through a Ruby on Rails application, illustrating the Model-View-Controller (MVC) architecture.

```mermaid
graph LR
    A["Browser Request (e.g., /users)"] --> B{Rails Router}
    B -- Matches Route --> C["Controller (e.g., UsersController)"]
    C -- Action (e.g., #index) --> D["Model (e.g., User)"]
    D -- Interacts with Database --> E[Database]
    E -- Returns Data --> D
    D -- Processes Data --> C
    C -- Renders View --> F["View (e.g., index.html.erb)"]
    F -- Uses Data from Controller --> C
    C -- Sends Response --> B
    B -- Sends Response --> A

    style B fill:#f9f,stroke:#333,stroke-width:2px
    style C fill:#ccf,stroke:#333,stroke-width:2px
    style D fill:#aaf,stroke:#333,stroke-width:2px
    style F fill:#88f,stroke:#333,stroke-width:2px
    style E fill:#66f,stroke:#333,stroke-width:2px

    classDef controller fill:#ccf,stroke:#333,stroke-width:2px
    class C controller
# Jenkins Docker Compose 

## Purpose 

A preconfigured Jenkins environment inclusive of plugins for developing test pipelines, plugins etc.

I found myself with a need to be able to reset Jenkins quickly as well as recording the state needed for me to start work quickly. This allows me to properly record the plugins I'm using, have a consistant stable environment for easy demos and also light enough to store in git since 
and thus avoid large file / repo size limitiations from git providers as well as improve 
network performance during a commit.

# Installing / Environment Setup
 - installs docker-compose if needed
 - creates the working directory for `jenkins home` and for the compose file
 ```
  ./install.sh
 ```


# Stop container
 - from this directory run 
   ```
     docker-compose down
   ```
# Start container (After previosuly installing)
 - from this directory run 
   ```
     docker-compose up -d
   ```

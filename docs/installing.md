## Installing neo

You have two options:

1- Installing the gem locally

2- Run the bin file directly

### Details

1- Install the gem locally:

After cloning this repository, build the gem file:

    sudo gem build neo

Once the gem file is generated, proceed to install it locally

    sudo gem install neo

You can now run neo as a CLI:

    neo create_pipeline <pipeline-yml-location>

2- Run the bin file directly after cloning the repo:

    bundle exec ruby ./bin/neo create_pipeline <pipelie-yml-location>



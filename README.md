# UIPATH DASHBOARD

This is a Kibana Dashboard customized for UIPath logs.
It is implemented as an ELK Stack using ElasticSearch, LogStash and Kibana.

## Quick Start

To simplify installation the project is built as a Docker container. If you have Docker on your computer, you should be up running with a simple command. If not, you first have some installation to do.

### Requirements

You need [Docker](https://www.docker.com/) installed on your computer.
Consider installing [Kitematic](https://kitematic.com/) which provides
a graphical user interface for Docker.

For Elasticsearch to complete launching, at least 4Gb of memory needs to be allocated to Docker, and its limit on mmap counts needs to be set to [262,144 or more.](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-prod-mode).

### Starting Up

In the command shell of the Docker Toolbox, change current directory to this distribution.
To build and launch the project, execute in the shell:

    $ docker-compose --project-name uipath up --build dashboard

Wait until the build has completed, then open the Kibana dashboards in a web browser:

    http://localhost:5601/app/kibana#/dashboards

On windows the URL may have another port than 5601 mapping to it. If you use Kitematic, click on the Settings tab, and then on the Ports sub-tab to see the list of the ports exposed by the container (under DOCKER PORT) and the list of IP addresses and ports they are published on and accessible from on your machine (under MAC IP:PORT). Use the provided IP/port shown mapping to 5601 or configure it yourself for example to `32770`.

If the Kibana page doesn't open, wait a little longer to ensure it is ready. It may take up to a few minutes before everything is settled.

If the visualizations in the Kibana dashboard show no data, you may have to adjust the time range for the logs in the top right of the menu.

### Using Your Own Logs

Obviously you didn't just want to see some random preset logs, but use your own. Let's get you onboard.

Logfiles are loaded live from the `logs` directory. Add your own logfiles to
the directory. Alternatively, modify the path for logs in `docker-compose.yml` to your own log directory and restart.

UIpath can log directly to ElasticSearch so if you're savvy that's an option.

## Advanced

The following are notes for advanced customization and further development. You don't need it for basic use.

### ELK Stack

For further customization see the documentation of elk-docker, which is used as foundation:

    https://elk-docker.readthedocs.io/

### Exporting the Dashboard

Kibana persists the Dashboard configuration in ElasticSearch.
To export a design to a JSON file for later loading:

1. In Kibana, select the Management item in the sidebar.
2. Select the Saved Objects tab.
3. Click the Export Everything button.
4. Store the file (eventually in place of existing ./export.json)

Alternatively (and still required) if you know the dashboard ID you can export via http:

    curl http://localhost:5601/api/kibana/dashboards/export?dashboard=xxxxx > dashboard.json

Rename the file and place it in the `dashboard` directory.


MIT License. Copyright (c) 2018 Rune Norderhaug

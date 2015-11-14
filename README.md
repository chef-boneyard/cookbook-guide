This is Chef's Partner Engineering guide for writing cookbooks. It is intended to provide guidelines for how to write high-quality cookbooks for sharing with the Chef Community. The content is in the [docs/](docs/) directory or you may view it as a presentation.

# Contributing #
These guidelines are a living document, so feel free to send PRs and we'll discuss and incorporate the feedback.

# Viewing and Downloading the Presentation #
The format is [reveal-md](https://github.com/webpro/reveal-md). You may use Vagrant and virtualbox to view the presentation without installing reveal-md and its dependencies. To view the deck:
* Install [Vagrant](https://vagrantup.com)
* Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* `export VAGRANT_DEFAULT_PROVIDER=virtualbox`
* `vagrant up guide`
* Open up <http://127.0.0.1:1948/index.md> and you're in the presentation.
* You may download the slides from the last slide or directly from <http://127.0.0.1:1948/cookbook-guide.pdf>

## Updating the Presentation #
The content is the Markdown files in the [docs](docs) directory, but the `index.md` is dynamically generated inside the [Vagrantfile](Vagrantfile). You may `vagrant ssh guide` in and change the running command to point to the `/vagrant/docs/` directory and edit these and refresh your browser to see the content update. You may also `vagrant provision guide` if you want to refresh everything without destroying the VM.

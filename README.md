# Phoenix/Svelt template project

[![GitHub Super-Linter](https://github.com/calebgasser/phoenix-svelte-template/workflows/Lint/badge.svg)](https://github.com/marketplace/actions/super-linter)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Requirements](#requirements)
- [Usage](#usage)
- [Notes](#notes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Requirements

- nerdctl or docker (not tested with docker yet.)
- [task](https://www.taskfile.dev)

## Usage

1. Select `Use this template` on the GitHub page.
2. Change `config.env` to fit our purposes.
(Such as `APP_NAME` to the name of your app.)
3. Run `task up` to start the server and generate your initial project.
4. Visit `localhost:4000` or something different depending on
how you changed `config.env`

A directory will be crated with your project name that you specified
with `APP_NAME` in `config.env` that will contain all our source code.

## Notes

- See available tasks with `task --list`
- View logs of the server container with `task logs`
- Get shell access to the container with `task shell`
- Stop the currently running server container with `task down`
- Stop the server container, remove the containers and volumes
(does not affect your source code.) `task remove`

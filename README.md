# The Expedition of Humphry Clinker

Version: 1.9beta
Released: 2013-04-26

HTML5 Boilerplate Version: 3.0.6

## Overview
This is the workspace and install files required for running your own copy of the Expedition of Humphry Clinker digital book.

## Instructions
1. Clone the [Symphony CMS repository](https://github.com/symphonycms/symphony-2) to your web server’s public directory.
2. Clone this repository to `workspace` within Symphony CMS’s director.
3. Replace the contents of `.gitmodules` with the contents of `workspace/gitmodules`
4. Run the following command to ensure the submodules are cloned:

		git submodule update --init --recursive
5. Point your web browser at http://example.com/install/ and provide details for establishing a database connection and about your server environment.
6. Remove installer files:

	`rm -rf install/ workspace/install.sql`
7. Follow the Elasticsearch installation instructions at [https://github.com/nickdunn/elasticsearch]
8. The Elasticsearch mappings have all been created, so should be able to just build your mappings and index the entries.
9. Done!

## License and Copyrights
Do what you wish. All code I've created here released with the MIT/X11 license, and all texts are in the public domain.